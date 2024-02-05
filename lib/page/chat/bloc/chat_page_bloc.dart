import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat/models/chat_room.dart';
import 'package:poc_chat/models/message.dart';
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
  }) : super(InitialState()) {
    on<StartedEvent>(_mapStartedToState);
    on<DataLoadedEvent>(_mapDataLoadedToState);
    on<ErrorOccurredEvent>(_mapErrorOccurredToState);
    on<SendMessageEvent>(_mapSendMessageToState);
    on<MessageUpdatedEvent>(_onMessageUpdatedEvent);
  }

  final RoomRepository repository;
  final User user;

  Future<void> _mapStartedToState(
    StartedEvent event,
    Emitter emit,
  ) async {
    try {
      final room = await repository.fetchRoom(roomId: 1);

      add(DataLoadedEvent(room: room));
    } on Exception catch (error) {
      add(ErrorOccurredEvent(error));
    }
  }

  Future<void> _mapDataLoadedToState(
    DataLoadedEvent event,
    Emitter emit,
  ) async {
    emit(LoadSuccessState(room: event.room, currentUser: user));
  }

  Future<void> _mapErrorOccurredToState(
    ErrorOccurredEvent event,
    Emitter emit,
  ) async {
    emit(LoadFailureState(event.error));
  }

  Future<void> _mapSendMessageToState(
    SendMessageEvent event,
    Emitter emit,
  ) async {
    repository
        .sendMessage(text: event.text, roomId: '1', userId: user.id)
        .then((message) => add(MessageUpdatedEvent(message: message)));
  }

  Future<void> _onMessageUpdatedEvent(
    MessageUpdatedEvent event,
    Emitter emit,
  ) async {
    final state = this.state;

    if (state is LoadSuccessState) {
      add(
        DataLoadedEvent(
          room: state.room.copyWith(
            messages: state.room.messages..add(event.message),
          ),
        ),
      );
    }
  }
}
