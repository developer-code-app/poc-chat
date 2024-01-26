import 'package:poc_chat/models/message/message.dart';

class Room {
  Room({required this.id, required this.messages});

  final String id;
  final List<Message> messages;
}
