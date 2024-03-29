part of 'chat_page_bloc.dart';

abstract class ChatPageState {}

class InitialState extends _State {}

class LoadInProgressState extends _State {}

class LoadSuccessState extends _State {
  LoadSuccessState({required this.room, required this.currentUser});

  final ChatRoom room;
  final User currentUser;
}

class LoadFailureState extends _State {
  LoadFailureState(this.error);

  final Exception error;
}
