import 'package:poc_chat/models/message.dart';
import 'package:poc_chat/models/user.dart';

abstract class WebSocketPayload {
  WebSocketPayload();

  factory WebSocketPayload.fromJson(Map<String, dynamic> json) {
    if (json['type'] == 'MESSAGE' && json['message']['type'] == 'BASIC') {
      return MessagePayload(
        message: BasicMessage(
          id: json['message']['id'],
          owner: User(
            id: json['message']['owner']['id'],
            name: json['message']['owner']['name'],
            imageUrl: json['message']['owner']['image_url'],
          ),
          deletedAt: json['message']['deleted_at'],
          text: json['message']['text'],
        ),
      );
    } else if (json['type'] == 'MESSAGE' &&
        json['message']['type'] == 'SUBSCRIPTION') {
      return MessagePayload(
        message: SubscriptionPackageMessage(
          id: json['message']['id'],
          owner: User(
            id: json['message']['owner']['id'],
            name: json['message']['owner']['name'],
            imageUrl: json['message']['owner']['image_url'],
          ),
          deletedAt: json['message']['deleted_at'],
          imageUrl: json['message']['image_url'],
          name: json['message']['name'],
          isPurchased: json['message']['is_purchased'],
        ),
      );
    } else if (json['type'] == 'EVENT' && json['event']['type'] == 'DELETE') {
      return DeleteEventPayload(
        messageId: json['event']['message_id'],
        ownerId: json['event']['owner_id'],
      );
    } else {
      throw Exception('Unsupported message type.');
    }
  }
}

class MessagePayload extends WebSocketPayload {
  MessagePayload({required this.message});

  final Message message;
}

class DeleteEventPayload extends WebSocketPayload {
  DeleteEventPayload({
    required this.messageId,
    required this.ownerId,
  });

  final String messageId;
  final String ownerId;
}
