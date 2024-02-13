import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat/models/user.dart';
import 'package:poc_chat/repository/user_repository.dart';

part 'login_page_event.dart';
part 'login_page_state.dart';

typedef _State = LoginPageState;
typedef _Event = LoginPageEvent;

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  LoginPageBloc({required this.repository}) : super(InitialState()) {
    on<StartedEvent>(_mapStartedToState);
    on<DataLoadedEvent>(_mapDataLoadedToState);
    on<ErrorOccurredEvent>(_mapErrorOccurredToState);
    on<SetupMockDataEvent>(_mapSetupMockDataToState);
    on<ClearDatabaseEvent>(_mapClearDatabaseToState);
  }

  final UserRepository repository;

  Future<void> _mapStartedToState(
    StartedEvent event,
    Emitter emit,
  ) async {
    try {
      final users = await repository.findAllUsers();

      add(DataLoadedEvent(
        users: users.where((element) => element.id == '2').toList(),
      ));
    } on Exception catch (error) {
      add(ErrorOccurredEvent(error));
    }
  }

  Future<void> _mapDataLoadedToState(
    DataLoadedEvent event,
    Emitter emit,
  ) async {
    emit(LoadSuccessState(users: event.users));
  }

  Future<void> _mapErrorOccurredToState(
    ErrorOccurredEvent event,
    Emitter emit,
  ) async {
    emit(LoadFailureState(event.error));
  }

  Future<void> _mapSetupMockDataToState(
    SetupMockDataEvent event,
    Emitter emit,
  ) async {
    await repository.addUsersMockData();
    add(StartedEvent());
  }

  Future<void> _mapClearDatabaseToState(
    ClearDatabaseEvent event,
    Emitter emit,
  ) async {
    await repository.removeUsersMockDate();
    add(StartedEvent());
  }
}
