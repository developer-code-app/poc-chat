part of 'chat_page_bloc.dart';

abstract class ChatPageEvent {}

class StartedEvent extends _Event {}

class DataLoadedEvent extends _Event {
  DataLoadedEvent({required this.room});

  final ChatRoom room;
}

class ErrorOccurredEvent extends _Event {
  ErrorOccurredEvent(this.error);

  final Exception error;
}

class SendMessageEvent extends _Event {
  SendMessageEvent(this.text);

  final String text;
}
