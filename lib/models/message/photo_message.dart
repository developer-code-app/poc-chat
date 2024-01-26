import 'package:poc_chat/models/message/message.dart';
import 'package:poc_chat/models/user.dart';

class PhotoMessage extends Message {
  PhotoMessage({
    required String id,
    required User user,
    required this.photos,
  }) : super(id: id, user: user);

  final List<String> photos;
}
