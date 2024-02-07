import 'package:isar/isar.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_chat_room_entity.dart';

part 'isar_user_entity.g.dart';

@collection
class IsarUserEntity {
  Id id = Isar.autoIncrement;

  late String userId;
  late String imageUrl;
  late String name;

  @Backlink(to: 'members')
  final rooms = IsarLinks<IsarChatRoomEntity>();
}
