import 'package:dfunc/dfunc.dart';
import 'package:isar/isar.dart';
import 'package:poc_chat/extensions/extended_nullable.dart';
import 'package:poc_chat/models/chat_room.dart';
import 'package:poc_chat/models/message.dart';
import 'package:poc_chat/models/message_type.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_message_entity.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_user_entity.dart';

class IsarChatRoomService {
  IsarChatRoomService(this.isar);

  final Future<Isar> isar;

  Future<ChatRoom> fetchRoom({required int roomId}) async {
    return isar.then((isar) async {
      final entity = await isar.isarChatRoomEntitys.get(roomId);
      final room = entity?.let(ChatRoom.fromEntity);

      return room.getOrThrowException(Exception('Room not found.'));
    });
  }

  Future<Message> sendMessage({
    required String text,
    required String roomId,
    required String userId,
  }) async {
    return await isar.then((isar) async {
      final owner = await isar.isarUserEntitys.get(int.parse(userId));
      final room = await isar.isarChatRoomEntitys.get(int.parse(roomId));

      final message = IsarMessageEntity()
        ..text = text
        ..owner.value = owner
        ..room.value = room
        ..type = MessageType.basic;

      await isar.writeTxn(() async {
        await isar.isarMessageEntitys.put(message);

        message.room.save();
        message.owner.save();
      });

      return Message.fromEntity(message);
    }).onError<Error>((error, _) => throw Exception(error));
  }
}
