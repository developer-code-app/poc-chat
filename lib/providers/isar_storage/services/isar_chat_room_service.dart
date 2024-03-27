import 'package:collection/collection.dart';
import 'package:dfunc/dfunc.dart';
import 'package:isar/isar.dart';
import 'package:poc_chat/extensions/extended_nullable.dart';
import 'package:poc_chat/models/chat_room.dart';
import 'package:poc_chat/models/message.dart';
import 'package:poc_chat/models/message_type.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_message_entity.dart'
    as entity;
import 'package:poc_chat/providers/isar_storage/entities/isar_user_entity.dart';
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

  Future<ChatRoom?> findChatRoom({required String chatRoomId}) async {
    return isar.then((isar) async {
      final entity = await isar.isarChatRoomEntitys.get(int.parse(chatRoomId));
      return entity?.let(ChatRoom.fromEntity);
    });
  }

  Future<ChatRoom> createChatRoom({required String chatRoomId}) async {
    final room = IsarChatRoomEntity();

    await isar.then(
      (isar) async {
        final users = await isar.isarUserEntitys.where().findAll();

        isar.writeTxn(() async {
          await isar.isarChatRoomEntitys.putAll([room]);
          room.members.addAll(users);

          await room.members.save();
        });
      },
    );

    return ChatRoom.fromEntity(room);
  }

  Future<Message> saveMessage(IsarSaveMessageRequest request) async {
    return await isar.then((isar) async {
      final room = await isar.isarChatRoomEntitys.get(request.chatRoomId);
      final member = room
          .getOrThrowException(Exception('Room not found.'))
          .members
          .firstWhereOrNull((member) => member.id == request.userId)
          .getOrThrowException(Exception('Member not found.'));

      final message = entity.IsarMessageEntity()
        ..owner.value = member
        ..room.value = room;

      if (request is IsarSaveBasicMessageRequest) {
        message.type = MessageType.basic;
        message.text = request.text;
      } else if (request is IsarSaveSubscriptionPackageMessageRequest) {
        message.type = MessageType.subscription;
        message.package = entity.SubscriptionPackage()
          ..imageUrl = request.imageUrl
          ..name = request.name
          ..isPurchased = request.isPurchased;
      } else if (request is IsarSaveAppointmentMessageRequest) {
        message.type = MessageType.appointment;
        message.appointment = entity.Appointment()
          ..packageName = request.packageName
          ..selectedDate =
              request.selectedDate?.let((selectedDate) => entity.AvailableDate()
                ..date = selectedDate.date
                ..time = selectedDate.time)
          ..availableDates = request.availableDates
              .map((availableDate) => entity.AvailableDate()
                ..date = availableDate.date
                ..time = availableDate.time)
              .toList();
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

  Future<void> saveMessages(List<Message> messages) async {
    return await isar.then((isar) async {
      final users = await isar.isarUserEntitys.where().findAll();
      final room = await isar.isarChatRoomEntitys.get(1);
      final isarMessages = messages
          .map(
            (message) {
              final messageEntity = entity.IsarMessageEntity()
                ..owner.value = users.firstWhere(
                  (user) => user.id == int.parse(message.owner.id),
                )
                ..room.value = room
                ..id = int.parse(message.id);

              if (message is BasicMessage) {
                return messageEntity
                  ..type = MessageType.basic
                  ..text = message.text;
              } else if (message is SubscriptionPackageMessage) {
                return messageEntity
                  ..type = MessageType.subscription
                  ..package = (entity.SubscriptionPackage()
                    ..imageUrl = message.imageUrl
                    ..name = message.name
                    ..isPurchased = message.isPurchased);
              } else if (message is AppointmentMessage) {
                final availableDates = message.availableDates
                    .map(
                      (availableDate) => entity.AvailableDate()
                        ..date = availableDate.date
                        ..time = availableDate.time,
                    )
                    .toList();

                return messageEntity
                  ..type = MessageType.appointment
                  ..appointment = (entity.Appointment()
                    ..packageName = message.packageName
                    ..availableDates = availableDates);
              } else {
                throw Exception();
              }
            },
          )
          .whereNotNull()
          .toList();

      await isar.writeTxn(() async {
        await isar.isarMessageEntitys.putAll(isarMessages);
        room?.messages.addAll(isarMessages);
        isarMessages.forEach((message) => message.owner.save());
        await room?.messages.save();
      });
    }).onError<Error>((error, _) => throw Exception(error));
  }

  Future<Message> deleteMessage(String messageId) async {
    return isar.then((isar) async {
      final messageEntity =
          await isar.isarMessageEntitys.get(int.parse(messageId));
      final message =
          messageEntity.getOrThrow(errorMessage: 'Message not found.');

      message.deletedAt = DateTime.now();

      await isar.writeTxn(() async {
        await isar.isarMessageEntitys.put(message);

        message.room.save();
        message.owner.save();
      });

      return Message.fromEntity(message);
    }).onError<Error>((error, _) => throw Exception(error));
  }
}
