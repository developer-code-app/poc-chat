import 'package:poc_chat/models/message/message.dart';
import 'package:poc_chat/models/user.dart';

class SubscriptionMessage extends Message {
  SubscriptionMessage({
    required String id,
    required User user,
    required this.imageUrl,
    required this.packageName,
    required this.isPaid,
  }) : super(id: id, user: user);

  final String imageUrl;
  final String packageName;
  final bool isPaid;
}
