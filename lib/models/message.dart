import 'package:dfunc/dfunc.dart';
import 'package:poc_chat/extensions/extended_nullable.dart';
import 'package:poc_chat/models/message_type.dart';
import 'package:poc_chat/models/time.dart';
import 'package:poc_chat/models/user.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_message_entity.dart'
    as isar_entity;

abstract class Message {
  Message({required this.id, required this.owner});

  factory Message.fromEntity(isar_entity.IsarMessageEntity entity) {
    final invalidException = Exception('Invalid response spec.');
    final owner = entity.owner.value
        .getOrThrowException(Exception('User not found.'))
        .let(User.fromEntity);

    switch (entity.type) {
      case MessageType.basic:
        return BasicMessage(
          id: entity.id.toString(),
          owner: owner,
          text: entity.text.getOrThrowException(invalidException),
        );
      case MessageType.photo:
        return PhotoMessage(
          id: entity.id.toString(),
          owner: owner,
          photos: entity.photos.getOrThrowException(invalidException),
        );
      case MessageType.subscription:
        final package = entity.package.getOrThrowException(invalidException);

        return SubscriptionPackageMessage(
          id: entity.id.toString(),
          owner: owner,
          imageUrl: package.imageUrl,
          name: package.name,
          isPurchased: package.isPurchased,
        );
      case MessageType.appointment:
        final appointment =
            entity.appointment.getOrThrowException(invalidException);
        final availableDates =
            appointment.availableDates.map(AvailableDate.fromEntity).toList();

        return AppointmentMessage(
          id: entity.id.toString(),
          owner: owner,
          packageName: appointment.packageName,
          availableDates: availableDates,
          selectedDate: appointment.selectedDate?.let(AvailableDate.fromEntity),
        );
      default:
        throw Exception('Unsupported message type.');
    }
  }

  final String id;
  final User owner;
}

class BasicMessage extends Message {
  BasicMessage({
    required String id,
    required User owner,
    required this.text,
  }) : super(id: id, owner: owner);

  final String text;
}

class PhotoMessage extends Message {
  PhotoMessage({
    required String id,
    required User owner,
    required this.photos,
  }) : super(id: id, owner: owner);

  final List<String> photos;
}

class SubscriptionPackageMessage extends Message {
  SubscriptionPackageMessage({
    required String id,
    required User owner,
    required this.imageUrl,
    required this.name,
    required this.isPurchased,
  }) : super(id: id, owner: owner);

  final String imageUrl;
  final String name;
  final bool isPurchased;
}

class AppointmentMessage extends Message {
  AppointmentMessage({
    required String id,
    required User owner,
    required this.packageName,
    required this.availableDates,
    this.selectedDate,
  }) : super(id: id, owner: owner);

  final String packageName;
  final List<AvailableDate> availableDates;
  final AvailableDate? selectedDate;
}

class AvailableDate {
  AvailableDate({required this.date, required this.time});

  factory AvailableDate.fromEntity(isar_entity.AvailableDate entity) {
    return AvailableDate(date: entity.date, time: entity.time);
  }

  final DateTime date;
  final Time time;
}
