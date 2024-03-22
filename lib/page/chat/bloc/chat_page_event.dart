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

class MessageAddedEvent extends _Event {
  MessageAddedEvent(this.message);

  final Message message;
}

class MessageDeletedEvent extends _Event {
  MessageDeletedEvent(this.message);

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

class MessageOptionsRequestedEvent extends _Event {
  MessageOptionsRequestedEvent(
    this.context, {
    required this.message,
  });

  final BuildContext context;
  final Message message;
}

class DeleteMessageRequestedEvent extends _Event {
  DeleteMessageRequestedEvent({required this.messageId});

  final String messageId;
}
