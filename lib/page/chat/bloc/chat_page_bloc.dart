import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat/broadcaster/broadcaster.dart';
import 'package:poc_chat/models/chat_room.dart';
import 'package:poc_chat/models/chat_management.dart';
import 'package:poc_chat/models/message.dart';
import 'package:poc_chat/models/subscription_package.dart';
import 'package:poc_chat/models/user.dart';
import 'package:poc_chat/page/action_sheet.dart' as action_sheet;
import 'package:poc_chat/providers/isar_storage/entities/message_entity.dart';
import 'package:poc_chat/repository/room_repository.dart';
import 'package:http/http.dart' as http;

part 'chat_page_event.dart';
part 'chat_page_state.dart';

typedef _State = ChatPageState;
typedef _Event = ChatPageEvent;

class ChatPageBloc extends Bloc<_Event, _State> {
  ChatPageBloc({
    required this.repository,
    required this.user,
    required this.chatRoomId,
  }) : super(InitialState()) {
    on<StartedEvent>(_mapStartedToState);
    on<DataLoadedEvent>(_mapDataLoadedToState);
    on<ErrorOccurredEvent>(_mapErrorOccurredToState);
    on<BasicMessageSentEvent>(_mapBasicMessageSentToState);
    on<ShareSubscriptionPackageEvent>(_mapShareSubscriptionPackageToState);
    on<MessageAddedEvent>(_onMessageAddedEvent);
    on<MessageDeletedEvent>(_onMessageDeletedEvent);
    on<MessageOptionsRequestedEvent>(_onMessageOptionsRequestedEvent);
    on<DeleteMessageRequestedEvent>(_onDeleteMessageRequestedEvent);

    _broadcasterSubscription =
        Broadcaster.instance.stream.listen((message) async {
      if (message is ChatMessage) {
        if (message.message.owner.id != user.id) {
          await repository
              .saveMessage(message: message.message, chatRoomId: chatRoomId)
              .then(MessageAddedEvent.new)
              .then(add);
        }
      } else if (message is DeleteMessageEvent) {
        if (message.ownerId != user.id) {
          await repository
              .deleteMessage(messageId: message.messageId)
              .then(MessageDeletedEvent.new)
              .then(add);
        }
      }
    });
  }

  final RoomRepository repository;
  final User user;
  final String chatRoomId;

  StreamSubscription<BroadcastMessage>? _broadcasterSubscription;

  @override
  Future<void> close() {
    _broadcasterSubscription?.cancel();
    ChatWebSocket.instance.disconnect();

    return super.close();
  }

  Future<void> _mapStartedToState(
    StartedEvent event,
    Emitter emit,
  ) async {
    try {
      emit(LoadInProgressState());
      await Future.delayed(const Duration(seconds: 1));

      final chatRoom = await repository
          .findChatRoom(chatRoomId: chatRoomId)
          .then((chatRoom) async {
        if (chatRoom != null) return chatRoom;

        return await repository.createChatRoom(chatRoomId: chatRoomId);
      });

      if (chatRoom.messages.isEmpty) {
        final messages = await fetchMessages();
        await repository.saveMessages(
            chatRoomId: chatRoomId, messages: messages);

        add(DataLoadedEvent(chatRoom: chatRoom.copyWith(messages: messages)));
      } else {
        add(DataLoadedEvent(chatRoom: chatRoom));
      }
    } on Exception catch (error) {
      add(ErrorOccurredEvent(error));
    }
  }

  Future<void> _mapDataLoadedToState(
    DataLoadedEvent event,
    Emitter emit,
  ) async {
    emit(LoadSuccessState(room: event.chatRoom, currentUser: user));
  }

  Future<void> _mapErrorOccurredToState(
    ErrorOccurredEvent event,
    Emitter emit,
  ) async {
    emit(LoadFailureState(event.error));
  }

  Future<void> _mapBasicMessageSentToState(
    BasicMessageSentEvent event,
    Emitter emit,
  ) async {
    final message = await repository.saveMessage(
      message: BasicMessage(
        id: 'MESSAGE_ID',
        owner: user,
        text: event.text,
        roomId: chatRoomId,
      ),
      chatRoomId: chatRoomId,
    );

    add(MessageAddedEvent(message));
    ChatWebSocket.instance.sendMessage(message);
  }

  Future<void> _mapShareSubscriptionPackageToState(
    ShareSubscriptionPackageEvent event,
    Emitter emit,
  ) async {
    final message = await repository.saveMessage(
      message: SubscriptionPackageMessage(
        id: 'MESSAGE_ID',
        owner: user,
        imageUrl: event.package.thumbnailUrl,
        name: event.package.name,
        isPurchased: event.isPurchased,
        roomId: chatRoomId,
      ),
      chatRoomId: chatRoomId,
    );

    add(MessageAddedEvent(message));
    ChatWebSocket.instance.sendMessage(message);
  }

  Future<void> _onMessageAddedEvent(
    MessageAddedEvent event,
    Emitter emit,
  ) async {
    final state = this.state;

    if (state is LoadSuccessState) {
      add(
        DataLoadedEvent(
          chatRoom: state.room.copyWith(
            messages: state.room.messages..add(event.message),
          ),
        ),
      );
    }
  }

  Future<void> _onMessageDeletedEvent(
    MessageDeletedEvent event,
    Emitter emit,
  ) async {
    final state = this.state;

    if (state is LoadSuccessState) {
      final messages = state.room.messages
          .map((message) =>
              message.id == event.message.id ? event.message : message)
          .toList();

      add(DataLoadedEvent(chatRoom: state.room.copyWith(messages: messages)));
    }
  }

  Future<void> _onMessageOptionsRequestedEvent(
    MessageOptionsRequestedEvent event,
    Emitter emit,
  ) async {
    if (event.message.owner.id == user.id) {
      action_sheet.ActionSheet(
        actions: [
          action_sheet.Action(
            'Delete',
            () => add(DeleteMessageRequestedEvent(messageId: event.message.id)),
          )
        ],
        cancel: action_sheet.Action('Cancel', () {}),
      ).show(event.context);
    }
  }

  Future<void> _onDeleteMessageRequestedEvent(
    DeleteMessageRequestedEvent event,
    Emitter emit,
  ) async {
    final message = await repository.deleteMessage(messageId: event.messageId);

    add(MessageDeletedEvent(message));
    ChatWebSocket.instance.deleteMessage(message);
  }

  Future<List<Message>> fetchMessages() async {
    final response =
        await http.get(Uri.parse('http://10.0.0.9:8080/chat_messages/'));

    if (response.statusCode == 200) {
      final entities = List<MessageEntity>.from(
        json.decode(response.body).map((x) => MessageEntity.fromJson(x)),
      );

      return entities
          .map((entity) => Message.fromMessageEntity(entity))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
