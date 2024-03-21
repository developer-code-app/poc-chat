part of 'broadcaster.dart';

class ChatMessage extends BroadcastMessage {
  ChatMessage({required this.message});

  final Message message;
}
