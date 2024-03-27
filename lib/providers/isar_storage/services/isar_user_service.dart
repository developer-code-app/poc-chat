import 'package:dfunc/dfunc.dart';
import 'package:isar/isar.dart';
import 'package:poc_chat/models/user.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_message_entity.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_user_entity.dart';

class IsarUserService {
  IsarUserService(this.isar);

  final Future<Isar> isar;

  Future<List<User>> findAllUsers() async {
    final users = await isar.then(
      (isar) => isar.isarUserEntitys.where().findAll(),
    );

    return users.map(User.fromEntity).toList();
  }

  Future<void> addMockData() async {
    final users = ['SC Asset', 'Pattarapon']
        .mapIndexed((index, name) => IsarUserEntity()
          ..name = name
          ..imageUrl = '')
        .toList();

    await isar.then(
      (isar) => isar.writeTxn(() async {
        await isar.isarUserEntitys.putAll(users);
      }),
    );
  }

  Future<void> removeMockData() async {
    await isar.then(
      (isar) => isar.writeTxn(() async {
        await isar.isarUserEntitys.clear();
        await isar.isarChatRoomEntitys.clear();
        await isar.isarMessageEntitys.clear();
      }),
    );
  }
}
