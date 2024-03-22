import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat/models/message.dart';
import 'package:poc_chat/models/user.dart';
import 'package:poc_chat/repository/room_repository.dart';

part 'search_page_event.dart';
part 'search_page_state.dart';

typedef _State = SearchPageState;
typedef _Event = SearchPageEvent;

class SearchPageBloc extends Bloc<_Event, _State> {
  SearchPageBloc({
    required this.repository,
    required this.user,
    required this.keyword,
  }) : super(InitialState()) {
    on<StartedEvent>(_mapStartedToState);
    on<DataLoadedEvent>(_mapDataLoadedToState);
  }

  final RoomRepository repository;
  final User user;
  final String keyword;

  Future<void> _mapStartedToState(
    StartedEvent event,
    Emitter emit,
  ) async {
    try {
      final messages = await repository.searchMessages(message: keyword);

      emit(
        LoadSuccessState(
          messages: messages.whereType<BasicMessage>().toList(),
          currentUser: user,
        ),
      );
    } on Exception catch (error) {
      emit(ErrorOccurredEvent(error));
    }
  }

  Future<void> _mapDataLoadedToState(
    DataLoadedEvent event,
    Emitter emit,
  ) async {
    emit(LoadSuccessState(messages: event.messages, currentUser: user));
  }
}
