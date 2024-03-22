part of 'search_page_bloc.dart';

abstract class SearchPageState {}

class InitialState extends _State {}

class LoadSuccessState extends _State {
  LoadSuccessState({required this.messages, required this.currentUser});

  final List<Message> messages;
  final User currentUser;
}

class LoadFailureState extends _State {
  LoadFailureState(this.error);

  final Exception error;
}
