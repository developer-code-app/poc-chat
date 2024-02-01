import 'package:isar/isar.dart';
import 'package:poc_chat/models/room.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;

  late String imageUrl;
  late String name;

  @Backlink(to: 'members')
  final rooms = IsarLinks<Room>();
}
