import 'package:poc_chat/models/message.dart';
import 'package:poc_chat/models/user.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_chat_room_entity.dart';

class ChatRoom {
  ChatRoom({
    required this.id,
    required this.messages,
    required this.members,
  });

  factory ChatRoom.fromEntity(IsarChatRoomEntity entity) {
    return ChatRoom(
      id: entity.id.toString(),
      messages: entity.messages.map(Message.fromEntity).toList(),
      members: entity.members.map(User.fromEntity).toList(),
    );
  }

  final String id;
  final List<Message> messages;
  final List<User> members;
}
