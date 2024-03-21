import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat/broadcaster/broadcaster.dart';
import 'package:poc_chat/models/chat_room.dart';
import 'package:poc_chat/models/chat_management.dart';
import 'package:poc_chat/models/message.dart';
import 'package:poc_chat/models/subscription_package.dart';
import 'package:poc_chat/models/user.dart';
import 'package:poc_chat/repository/room_repository.dart';

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
    on<MessageUpdatedEvent>(_onMessageUpdatedEvent);
    on<SearchEvent>(_onSearchEvent);

    _broadcasterSubscription =
        Broadcaster.instance.stream.listen((message) async {
      if (message is ChatMessage) {
        if (message.message.owner.id != user.id) {
          await repository
              .saveMessage(message: message.message, chatRoomId: chatRoomId)
              .then(MessageUpdatedEvent.new)
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
      final chatRoom = await repository.findChatRoom(chatRoomId: chatRoomId);

      add(DataLoadedEvent(chatRoom: chatRoom));
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
      ),
      chatRoomId: chatRoomId,
    );

    add(MessageUpdatedEvent(message));
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
      ),
      chatRoomId: chatRoomId,
    );

    add(MessageUpdatedEvent(message));
    ChatWebSocket.instance.sendMessage(message);
  }

  Future<void> _onMessageUpdatedEvent(
    MessageUpdatedEvent event,
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

  Future<void> _onSearchEvent(
    SearchEvent event,
    Emitter emit,
  ) async {
    try {
      final messages = await repository.searchMessages(message: 'รวิทัต');
      final result =
          messages.whereType<BasicMessage>().map((e) => e.text).join(', ');
    } catch (error) {
      print('Error: $error');
    }
  }
}
