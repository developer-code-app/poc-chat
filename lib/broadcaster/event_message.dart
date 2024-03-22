part of 'broadcaster.dart';

class DeleteMessageEvent extends BroadcastMessage {
  DeleteMessageEvent({
    required this.messageId,
    required this.ownerId,
  });

  final String messageId;
  final String ownerId;
}
