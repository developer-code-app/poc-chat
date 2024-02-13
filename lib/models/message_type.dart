import 'package:json_annotation/json_annotation.dart';

enum MessageType {
  @JsonValue('BASIC')
  basic,
  @JsonValue('PHOTO')
  photo,
  @JsonValue('SUBSCRIPTION')
  subscription,
  @JsonValue('APPOINTMENT')
  appointment,
  unsupported,
}
