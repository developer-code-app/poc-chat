import 'package:poc_chat/models/user.dart';

abstract class Message {
  Message({required this.id, required this.user});

  final String id;
  final User user;
}
