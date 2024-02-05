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
