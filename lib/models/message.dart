import 'package:dfunc/dfunc.dart';
import 'package:poc_chat/extensions/extended_nullable.dart';
import 'package:poc_chat/models/message_type.dart';
import 'package:poc_chat/models/time.dart';
import 'package:poc_chat/models/user.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_message_entity.dart'
    as isar_entity;
import 'package:poc_chat/providers/isar_storage/entities/message_entity.dart';

abstract class Message {
  Message({
    required this.id,
    required this.owner,
    required this.roomId,
    this.deletedAt,
  });

  factory Message.fromMessageEntity(MessageEntity entity) {
    final invalidException = Exception('Invalid response spec.');
    final owner = entity.owner
        .getOrThrowException(Exception('User not found.'))
        .let(User.fromUserEntity);

    switch (entity.type) {
      case MessageType.basic:
        return BasicMessage(
          id: entity.id.toString(),
          owner: owner,
          deletedAt: entity.deletedAt,
          text: entity.text.getOrThrowException(invalidException),
          roomId: entity.roomId.toString(),
        );
      case MessageType.photo:
        return PhotoMessage(
          id: entity.id.toString(),
          owner: owner,
          deletedAt: entity.deletedAt,
          photos: entity.photos.getOrThrowException(invalidException),
          roomId: entity.roomId.toString(),
        );
      case MessageType.subscription:
        final package = entity.package.getOrThrowException(invalidException);

        return SubscriptionPackageMessage(
          id: entity.id.toString(),
          owner: owner,
          deletedAt: entity.deletedAt,
          imageUrl: package.imageUrl,
          name: package.name,
          isPurchased: package.isPurchased,
          roomId: entity.roomId.toString(),
        );
      case MessageType.appointment:
        final appointment =
            entity.appointment.getOrThrowException(invalidException);
        final availableDates = appointment.availableDates
            .map(AvailableDate.fromAvailableDateEntity)
            .toList();

        return AppointmentMessage(
          id: entity.id.toString(),
          owner: owner,
          deletedAt: entity.deletedAt,
          packageName: appointment.packageName,
          availableDates: availableDates,
          selectedDate: appointment.selectedDate
              ?.let(AvailableDate.fromAvailableDateEntity),
          roomId: entity.roomId.toString(),
        );
      default:
        throw Exception('Unsupported message type.');
    }
  }

  factory Message.fromEntity(isar_entity.IsarMessageEntity entity) {
    final invalidException = Exception('Invalid response spec.');
    final owner = entity.owner.value
        .getOrThrowException(Exception('User not found.'))
        .let(User.fromEntity);
    final roomId = entity.room.value
        .getOrThrowException(Exception('Room not found.'))
        .id
        .toString();

    switch (entity.type) {
      case MessageType.basic:
        return BasicMessage(
          id: entity.id.toString(),
          owner: owner,
          deletedAt: entity.deletedAt,
          text: entity.text.getOrThrowException(invalidException),
          roomId: roomId,
        );
      case MessageType.photo:
        return PhotoMessage(
          id: entity.id.toString(),
          owner: owner,
          deletedAt: entity.deletedAt,
          photos: entity.photos.getOrThrowException(invalidException),
          roomId: roomId,
        );
      case MessageType.subscription:
        final package = entity.package.getOrThrowException(invalidException);

        return SubscriptionPackageMessage(
          id: entity.id.toString(),
          owner: owner,
          deletedAt: entity.deletedAt,
          imageUrl: package.imageUrl,
          name: package.name,
          isPurchased: package.isPurchased,
          roomId: roomId,
        );
      case MessageType.appointment:
        final appointment =
            entity.appointment.getOrThrowException(invalidException);
        final availableDates =
            appointment.availableDates.map(AvailableDate.fromEntity).toList();

        return AppointmentMessage(
          id: entity.id.toString(),
          owner: owner,
          deletedAt: entity.deletedAt,
          packageName: appointment.packageName,
          availableDates: availableDates,
          selectedDate: appointment.selectedDate?.let(AvailableDate.fromEntity),
          roomId: roomId,
        );
      default:
        throw Exception('Unsupported message type.');
    }
  }

  final String id;
  final User owner;
  final DateTime? deletedAt;
  final String roomId;
}

class BasicMessage extends Message {
  BasicMessage({
    required super.id,
    required super.owner,
    required super.roomId,
    required this.text,
    super.deletedAt,
  });

  final String text;
}

class PhotoMessage extends Message {
  PhotoMessage({
    required super.id,
    required super.owner,
    required super.roomId,
    required this.photos,
    super.deletedAt,
  });

  final List<String> photos;
}

class SubscriptionPackageMessage extends Message {
  SubscriptionPackageMessage({
    required super.id,
    required super.owner,
    required super.roomId,
    required this.imageUrl,
    required this.name,
    required this.isPurchased,
    super.deletedAt,
  });

  final String imageUrl;
  final String name;
  final bool isPurchased;
}

class AppointmentMessage extends Message {
  AppointmentMessage({
    required super.id,
    required super.owner,
    required super.deletedAt,
    required super.roomId,
    required this.packageName,
    required this.availableDates,
    this.selectedDate,
  });

  final String packageName;
  final List<AvailableDate> availableDates;
  final AvailableDate? selectedDate;
}

class AvailableDate {
  AvailableDate({required this.date, required this.time});

  factory AvailableDate.fromAvailableDateEntity(AvailableDateEntity entity) {
    return AvailableDate(date: entity.date, time: entity.time);
  }

  factory AvailableDate.fromEntity(isar_entity.AvailableDate entity) {
    return AvailableDate(date: entity.date, time: entity.time);
  }

  final DateTime date;
  final Time time;
}
