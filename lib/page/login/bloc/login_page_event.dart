part of 'login_page_bloc.dart';

abstract class LoginPageEvent {}

class StartedEvent extends _Event {}

class DataLoadedEvent extends _Event {
  DataLoadedEvent({required this.users});

  final List<User> users;
}

class ErrorOccurredEvent extends _Event {
  ErrorOccurredEvent(this.error);

  final Exception error;
}

class SetupMockDataEvent extends _Event {}

class ClearDatabaseEvent extends _Event {}
