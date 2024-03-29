import 'package:poc_chat/models/message.dart';

abstract class IsarSaveMessageRequest {
  IsarSaveMessageRequest({
    required this.userId,
    required this.chatRoomId,
  });

  factory IsarSaveMessageRequest.fromModel({
    required Message message,
    required String chatRoomId,
  }) {
    if (message is BasicMessage) {
      return IsarSaveBasicMessageRequest(
        userId: int.parse(message.owner.id),
        chatRoomId: int.parse(chatRoomId),
        text: message.text,
      );
    } else if (message is SubscriptionPackageMessage) {
      return IsarSaveSubscriptionPackageMessageRequest(
        userId: int.parse(message.owner.id),
        chatRoomId: int.parse(chatRoomId),
        imageUrl: message.imageUrl,
        name: message.name,
        isPurchased: message.isPurchased,
      );
    } else if (message is AppointmentMessage) {
      return IsarSaveAppointmentMessageRequest(
        userId: int.parse(message.owner.id),
        chatRoomId: int.parse(chatRoomId),
        packageName: message.packageName,
        availableDates: message.availableDates
            .map(
              (availableDate) => AvailableDate(
                date: availableDate.date,
                time: availableDate.time,
              ),
            )
            .toList(),
      );
    } else {
      throw Exception('Unsupported message');
    }
  }
  final int userId;
  final int chatRoomId;
}

class IsarSaveBasicMessageRequest extends IsarSaveMessageRequest {
  IsarSaveBasicMessageRequest({
    required super.userId,
    required super.chatRoomId,
    required this.text,
  });

  final String text;
}

class IsarSaveSubscriptionPackageMessageRequest extends IsarSaveMessageRequest {
  IsarSaveSubscriptionPackageMessageRequest({
    required super.userId,
    required super.chatRoomId,
    required this.imageUrl,
    required this.name,
    required this.isPurchased,
  });

  final String imageUrl;
  final String name;
  final bool isPurchased;
}

class IsarSaveAppointmentMessageRequest extends IsarSaveMessageRequest {
  IsarSaveAppointmentMessageRequest({
    required super.userId,
    required super.chatRoomId,
    required this.packageName,
    required this.availableDates,
    this.selectedDate,
  });

  final String packageName;
  final List<AvailableDate> availableDates;
  final AvailableDate? selectedDate;
}
