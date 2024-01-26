import 'package:poc_chat/models/message/message.dart';
import 'package:poc_chat/models/user.dart';

class AppointmentMessage extends Message {
  AppointmentMessage({
    required String id,
    required User user,
    required this.packageName,
    required this.availableDates,
    this.time,
  }) : super(id: id, user: user);

  final String packageName;
  final List<AvailableDate> availableDates;
  final Time? time;
}

class AvailableDate {
  AvailableDate({required this.date, required this.time});
  final DateTime date;
  final Time time;
}

enum Time {
  morning,
  afternoon,
  custom,
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
