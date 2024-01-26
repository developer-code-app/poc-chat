import 'package:poc_chat/models/message/message.dart';
import 'package:poc_chat/models/user.dart';

class BasicMessage extends Message {
  BasicMessage({
    required String id,
    required User user,
    required this.text,
  }) : super(id: id, user: user);

  final String text;
}
