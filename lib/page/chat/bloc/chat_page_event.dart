part of 'chat_page_bloc.dart';

abstract class ChatPageEvent {}

class StartedEvent extends _Event {}

class DataLoadedEvent extends _Event {
  DataLoadedEvent({required this.chatRoom});

  final ChatRoom chatRoom;
}

class ErrorOccurredEvent extends _Event {
  ErrorOccurredEvent(this.error);

  final Exception error;
}

class BasicMessageSentEvent extends _Event {
  BasicMessageSentEvent(this.text);

  final String text;
}

class MessageUpdatedEvent extends _Event {
  MessageUpdatedEvent(this.message);

  final Message message;
}

class ShareSubscriptionPackageEvent extends _Event {
  ShareSubscriptionPackageEvent({
    required this.package,
    required this.isPurchased,
  });

  final SubscriptionPackage package;
  final bool isPurchased;
}
