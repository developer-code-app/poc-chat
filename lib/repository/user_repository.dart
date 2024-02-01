import 'package:poc_chat/models/user.dart';
import 'package:poc_chat/providers/service/isar_service.dart';

class UserRepository {
  UserRepository({required this.isar});

  final IsarService isar;

  Future<List<User>> fetchUsers() async {
    return await isar.fetchUsers();
  }
}
