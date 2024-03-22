part of 'search_page_bloc.dart';

abstract class SearchPageEvent {}

class StartedEvent extends _Event {}

class DataLoadedEvent extends _Event {
  DataLoadedEvent({required this.messages});

  final List<Message> messages;
}

class ErrorOccurredEvent extends _Event {
  ErrorOccurredEvent(this.error);

  final Exception error;
}
