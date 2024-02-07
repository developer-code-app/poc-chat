import 'package:isar/isar.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_message_entity.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_user_entity.dart';

part 'isar_chat_room_entity.g.dart';

@collection
class IsarChatRoomEntity {
  Id id = Isar.autoIncrement;

  late String roomId;

  final messages = IsarLinks<IsarMessageEntity>();
  final members = IsarLinks<IsarUserEntity>();
}
