import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat/models/chat_room.dart';
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
  }) : super(InitialState()) {
    on<StartedEvent>(_mapStartedToState);
    on<DataLoadedEvent>(_mapDataLoadedToState);
    on<ErrorOccurredEvent>(_mapErrorOccurredToState);
    on<BasicMessageSentEvent>(_mapBasicMessageSentToState);
    on<ShareSubscriptionPackageEvent>(_mapShareSubscriptionPackageToState);
    on<MessageUpdatedEvent>(_onMessageUpdatedEvent);
  }

  final RoomRepository repository;
  final User user;
  static int roomId = 1;

  Future<void> _mapStartedToState(
    StartedEvent event,
    Emitter emit,
  ) async {
    try {
      final room = await repository.fetchRoom(roomId: roomId);

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

  Future<void> _mapBasicMessageSentToState(
    BasicMessageSentEvent event,
    Emitter emit,
  ) async {
    repository
        .sendBasicMessage(
          text: event.text,
          roomId: roomId.toString(),
          userId: user.id,
        )
        .then(MessageUpdatedEvent.new)
        .then(add);
  }

  Future<void> _mapShareSubscriptionPackageToState(
    ShareSubscriptionPackageEvent event,
    Emitter emit,
  ) async {
    repository
        .shareSubscriptionPackageMessage(
          package: event.package,
          isPurchased: event.isPurchased,
          roomId: roomId.toString(),
          userId: user.id,
        )
        .then(MessageUpdatedEvent.new)
        .then(add);
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
