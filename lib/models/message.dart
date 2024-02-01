import 'package:isar/isar.dart';
import 'package:poc_chat/models/room.dart';
import 'package:poc_chat/models/user.dart';

part 'message.g.dart';

@collection
class Message {
  Id id = Isar.autoIncrement;

  @enumerated
  late MessageType type;

  String? text;
  List<String>? photos;
  Subscription? subscription;
  Appointment? appointment;

  @Backlink(to: 'messages')
  final room = IsarLink<Room>();
  final owner = IsarLink<User>();
}

@embedded
class Subscription {
  late String imageUrl;
  late String packageName;
  late bool isPaid;
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

enum Time {
  morning,
  afternoon,
  custom,
}

enum MessageType {
  basic,
  photo,
  subscription,
  appointment,
  unsupported,
}

extension TimeExtension on Time {
  String? description() {
    switch (this) {
      case Time.morning:
        return 'ช่วงเช้า (09:00 - 12:00)';
      case Time.afternoon:
        return 'ช่วงบ่าย (13:00 - 16:00)';
      case Time.custom:
        return null;
    }
  }
}
