import 'package:isar/isar.dart';
import 'package:poc_chat/models/message_type.dart';
import 'package:poc_chat/models/time.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_user_entity.dart';

part 'isar_message_entity.g.dart';

@collection
class IsarMessageEntity {
  Id id = Isar.autoIncrement;

  @enumerated
  late MessageType type;

  String? text;
  List<String>? photos;
  SubscriptionPackage? package;
  Appointment? appointment;

  @Backlink(to: 'messages')
  final room = IsarLink<IsarChatRoomEntity>();
  final owner = IsarLink<IsarUserEntity>();
}

@embedded
class SubscriptionPackage {
  late String imageUrl;
  late String name;
  late bool isPurchased;
}

@embedded
class Appointment {
  late String packageName;
  late List<AvailableDate> availableDates;

  AvailableDate? selectedDate;
}

@embedded
class AvailableDate {
  late DateTime date;

  @enumerated
  late Time time;
}
