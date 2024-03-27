// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageEntity _$MessageEntityFromJson(Map<String, dynamic> json) =>
    MessageEntity(
      id: json['id'] as int,
      type: $enumDecode(_$MessageTypeEnumMap, json['type']),
      owner: UserEntity.fromJson(json['owner'] as Map<String, dynamic>),
      roomId: json['room_id'] as int,
      text: json['text'] as String?,
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      package: json['package'] == null
          ? null
          : SubscriptionPackageEntity.fromJson(
              json['package'] as Map<String, dynamic>),
      appointment: json['appointment'] == null
          ? null
          : AppointmentEntity.fromJson(
              json['appointment'] as Map<String, dynamic>),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$MessageEntityToJson(MessageEntity instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': _$MessageTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text);
  writeNotNull('photos', instance.photos);
  writeNotNull('package', instance.package);
  writeNotNull('appointment', instance.appointment);
  writeNotNull('deleted_at', instance.deletedAt?.toIso8601String());
  val['owner'] = instance.owner;
  val['room_id'] = instance.roomId;
  return val;
}

const _$MessageTypeEnumMap = {
  MessageType.basic: 'BASIC',
  MessageType.photo: 'PHOTO',
  MessageType.subscription: 'SUBSCRIPTION',
  MessageType.appointment: 'APPOINTMENT',
  MessageType.unsupported: 'unsupported',
};

SubscriptionPackageEntity _$SubscriptionPackageEntityFromJson(
        Map<String, dynamic> json) =>
    SubscriptionPackageEntity(
      imageUrl: json['image_url'] as String,
      name: json['name'] as String,
      isPurchased: json['is_purchased'] as bool,
    );

Map<String, dynamic> _$SubscriptionPackageEntityToJson(
        SubscriptionPackageEntity instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
      'name': instance.name,
      'is_purchased': instance.isPurchased,
    };

AppointmentEntity _$AppointmentEntityFromJson(Map<String, dynamic> json) =>
    AppointmentEntity(
      packageName: json['package_name'] as String,
      availableDates: (json['available_dates'] as List<dynamic>)
          .map((e) => AvailableDateEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedDate: json['selected_date'] == null
          ? null
          : AvailableDateEntity.fromJson(
              json['selected_date'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppointmentEntityToJson(AppointmentEntity instance) {
  final val = <String, dynamic>{
    'package_name': instance.packageName,
    'available_dates': instance.availableDates,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('selected_date', instance.selectedDate);
  return val;
}

AvailableDateEntity _$AvailableDateEntityFromJson(Map<String, dynamic> json) =>
    AvailableDateEntity(
      date: DateTime.parse(json['date'] as String),
      time: $enumDecode(_$TimeEnumMap, json['time']),
    );

Map<String, dynamic> _$AvailableDateEntityToJson(
        AvailableDateEntity instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'time': _$TimeEnumMap[instance.time]!,
    };

const _$TimeEnumMap = {
  Time.morning: 'MORNING',
  Time.afternoon: 'AFTERNOON',
  Time.custom: 'CUSTOM',
};

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      id: json['id'] as int,
      imageUrl: json['image_url'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageUrl,
      'name': instance.name,
    };
