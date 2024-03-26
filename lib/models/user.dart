import 'package:poc_chat/providers/isar_storage/entities/isar_user_entity.dart';
import 'package:poc_chat/providers/isar_storage/entities/message_entity.dart';

class User {
  User({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory User.fromUserEntity(UserEntity entity) {
    return User(
      id: entity.id.toString(),
      name: entity.name,
      imageUrl: entity.imageUrl,
    );
  }

  factory User.fromEntity(IsarUserEntity entity) {
    return User(
      id: entity.id.toString(),
      name: entity.name,
      imageUrl: entity.imageUrl,
    );
  }

  final String id;
  final String name;
  final String imageUrl;
}
