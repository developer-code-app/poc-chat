import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_message_entity.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_user_entity.dart';
import 'package:poc_chat/providers/isar_storage/services/isar_chat_room_service.dart';
import 'package:poc_chat/providers/isar_storage/services/isar_user_service.dart';

class IsarStorageProvider {
  IsarStorageProvider(Future<Isar> isar)
      : user = IsarUserService(isar),
        chatRoom = IsarChatRoomService(isar);

  IsarStorageProvider.basic() : this(_openDatabase());

  static Future<Isar> _openDatabase() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();

      return await Isar.open(
        [
          IsarChatRoomEntitySchema,
          IsarUserEntitySchema,
          IsarMessageEntitySchema
        ],
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }

  final IsarUserService user;
  final IsarChatRoomService chatRoom;
}
