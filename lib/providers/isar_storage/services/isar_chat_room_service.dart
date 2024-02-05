import 'package:dfunc/dfunc.dart';
import 'package:isar/isar.dart';
import 'package:poc_chat/extensions/extended_nullable.dart';
import 'package:poc_chat/models/chat_room.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_chat_room_entity.dart';

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
}
