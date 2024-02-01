part of 'login_page_bloc.dart';

abstract class LoginPageState {}

class InitialState extends _State {}

class LoadSuccessState extends _State {
  LoadSuccessState({required this.users});

  final List<User> users;
}

class LoadFailureState extends _State {
  LoadFailureState(this.error);

  final Exception error;
}
