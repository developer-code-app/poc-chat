import 'package:poc_chat/models/user.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_user_entity.dart';
import 'package:poc_chat/providers/isar_storage/isar_storage_provider.dart';

class UserRepository {
  UserRepository({required this.storageProvider});

  final IsarStorageProvider storageProvider;

  Future<List<User>> fetchUsers() async {
    return await storageProvider.user.fetchUsers();
  }

  Future<void> addUsersMockData() async {
    return await storageProvider.user.addMockData();
  }

  Future<void> removeUsersMockDate() async {
    return await storageProvider.user.removeMockData();
  }
}
