import 'package:poc_chat/models/user.dart';

class UserRepository {
  Future<List<User>> fetchUsers() {
    return Future.value([
      User(id: '1', imageUrl: '', name: 'Namfon'),
      User(id: '2', imageUrl: '', name: 'Pattarapon'),
    ]);
  }
}
