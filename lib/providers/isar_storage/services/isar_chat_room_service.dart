import 'package:collection/collection.dart';
import 'package:dfunc/dfunc.dart';
import 'package:isar/isar.dart';
import 'package:poc_chat/extensions/extended_nullable.dart';
import 'package:poc_chat/models/chat_room.dart';
import 'package:poc_chat/models/message.dart';
import 'package:poc_chat/models/message_type.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_message_entity.dart';
import 'package:poc_chat/providers/isar_storage/requests/isar_save_message_request.dart';

class IsarChatRoomService {
  IsarChatRoomService(this.isar);

  final Future<Isar> isar;

  Future<List<Message>> findMessages({required String message}) async {
    return isar.then((isar) async {
      final entities = await isar.isarMessageEntitys
          .filter()
          .textContains(message)
          .findAll();

      return entities.map(Message.fromEntity).toList();
    });
  }

  Future<ChatRoom> findChatRoom({required String chatRoomId}) async {
    return isar.then((isar) async {
      final entity = await isar.isarChatRoomEntitys.get(int.parse(chatRoomId));
      final room = entity?.let(ChatRoom.fromEntity);

      return room.getOrThrowException(Exception('Chat room not found.'));
    });
  }

  Future<Message> saveMessage(IsarSaveMessageRequest request) async {
    return await isar.then((isar) async {
      final room = await isar.isarChatRoomEntitys.get(request.chatRoomId);
      final member = room
          .getOrThrowException(Exception('Room not found.'))
          .members
          .firstWhereOrNull((member) => member.id == request.userId)
          .getOrThrowException(Exception('Member not found.'));

      final message = IsarMessageEntity()
        ..owner.value = member
        ..room.value = room;

      if (request is IsarSaveBasicMessageRequest) {
        message.type = MessageType.basic;
        message.text = request.text;
      } else if (request is IsarSaveSubscriptionPackageMessageRequest) {
        message.type = MessageType.subscription;
        message.package = SubscriptionPackage()
          ..imageUrl = request.imageUrl
          ..name = request.name
          ..isPurchased = request.isPurchased;
      } else {
        throw Exception('Unsupported message type');
      }

      await isar.writeTxn(() async {
        await isar.isarMessageEntitys.put(message);

        message.room.save();
        message.owner.save();
      });

      return Message.fromEntity(message);
    }).onError<Error>((error, _) => throw Exception(error));
  }
}
