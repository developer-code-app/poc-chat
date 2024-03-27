import 'package:json_annotation/json_annotation.dart';

import 'package:poc_chat/models/message_type.dart';
import 'package:poc_chat/models/time.dart';

part 'message_entity.g.dart';

@JsonSerializable()
class MessageEntity {
  const MessageEntity({
    required this.id,
    required this.type,
    required this.owner,
    required this.roomId,
    this.text,
    this.photos,
    this.package,
    this.appointment,
    this.deletedAt,
  });

  factory MessageEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MessageEntityToJson(this);

  final int id;
  final MessageType type;
  final String? text;
  final List<String>? photos;
  final SubscriptionPackageEntity? package;
  final AppointmentEntity? appointment;
  final DateTime? deletedAt;
  final UserEntity owner;
  final int roomId;
}

@JsonSerializable()
class SubscriptionPackageEntity {
  const SubscriptionPackageEntity({
    required this.imageUrl,
    required this.name,
    required this.isPurchased,
  });

  factory SubscriptionPackageEntity.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionPackageEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionPackageEntityToJson(this);

  final String imageUrl;
  final String name;
  final bool isPurchased;
}

@JsonSerializable()
class AppointmentEntity {
  const AppointmentEntity({
    required this.packageName,
    required this.availableDates,
    this.selectedDate,
  });

  factory AppointmentEntity.fromJson(Map<String, dynamic> json) =>
      _$AppointmentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentEntityToJson(this);

  final String packageName;
  final List<AvailableDateEntity> availableDates;
  final AvailableDateEntity? selectedDate;
}

@JsonSerializable()
class AvailableDateEntity {
  const AvailableDateEntity({
    required this.date,
    required this.time,
  });

  factory AvailableDateEntity.fromJson(Map<String, dynamic> json) =>
      _$AvailableDateEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableDateEntityToJson(this);

  final DateTime date;
  final Time time;
}

@JsonSerializable()
class UserEntity {
  const UserEntity({
    required this.id,
    required this.imageUrl,
    required this.name,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  final int id;
  final String imageUrl;
  final String name;
}
