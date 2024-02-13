import 'package:poc_chat/models/user.dart';
import 'package:poc_chat/providers/isar_storage/isar_storage_provider.dart';

class UserRepository {
  UserRepository({required this.storageProvider});

  final IsarStorageProvider storageProvider;

  Future<List<User>> findAllUsers() async {
    return await storageProvider.user.findAllUsers();
  }

  Future<void> addUsersMockData() async {
    return await storageProvider.user.addMockData();
  }

  Future<void> removeUsersMockDate() async {
    return await storageProvider.user.removeMockData();
  }
}
