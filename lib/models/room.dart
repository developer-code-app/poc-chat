import 'package:isar/isar.dart';
import 'package:poc_chat/models/message.dart';
import 'package:poc_chat/models/user.dart';

part 'room.g.dart';

@collection
class Room {
  Id id = Isar.autoIncrement;

  final messages = IsarLinks<Message>();
  final members = IsarLinks<User>();
}
