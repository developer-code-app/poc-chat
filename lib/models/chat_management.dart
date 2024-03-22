import 'dart:convert';
import 'dart:io';

import 'package:poc_chat/broadcaster/broadcaster.dart';
import 'package:poc_chat/models/message.dart';
import 'package:poc_chat/models/message_event.dart';

class ChatWebSocket {
  ChatWebSocket._();

  static ChatWebSocket? _instance;

  // ignore: prefer_constructors_over_static_methods
  static ChatWebSocket get instance {
    _instance ??= ChatWebSocket._();

    return _instance!;
  }

  static String webSocketUrl = 'ws://10.0.0.24:8080';

  WebSocket? webSocket;

  Future<void> connect() async {
    if (webSocket?.readyState == WebSocket.open) return;

    webSocket = await WebSocket.connect(webSocketUrl);
    webSocket?.listen(
      (jsonString) {
        final json = jsonDecode(jsonString) as Map<String, dynamic>;
        final payload = WebSocketPayload.fromJson(json);

        if (payload is MessagePayload) {
          Broadcaster.instance.add(ChatMessage(message: payload.message));
        } else if (payload is DeleteEventPayload) {
          Broadcaster.instance.add(
            DeleteMessageEvent(
              messageId: payload.messageId,
              ownerId: payload.ownerId,
            ),
          );
        }
      },
      onError: (_) => connect(),
      onDone: () => disconnect().then((_) => connect()),
    );
  }

  Future<void> disconnect() async {
    if (webSocket?.readyState == WebSocket.open) {
      await webSocket?.close();
      webSocket = null;
    }
  }

  Future<void> sendMessage(Message message) async {
    if (message is BasicMessage) {
      _sendBasicMessage(message);
    } else if (message is SubscriptionPackageMessage) {
      _sendSubscriptionPackageMessage(message);
    }
  }

  Future<void> _sendBasicMessage(BasicMessage message) async {
    await connect();

    Map<String, dynamic> json = {
      'type': 'MESSAGE',
      'message': {
        'id': message.id,
        'owner': {
          'id': message.owner.id,
          'image_url': message.owner.imageUrl,
          'name': message.owner.name,
        },
        'text': message.text,
        'type': 'BASIC',
      }
    };

    webSocket?.add(const JsonEncoder().convert(json));
  }

  Future<void> _sendSubscriptionPackageMessage(
    SubscriptionPackageMessage message,
  ) async {
    await connect();

    Map<String, dynamic> json = {
      'type': 'MESSAGE',
      'message': {
        'id': message.id,
        'owner': {
          'id': message.owner.id,
          'image_url': message.owner.imageUrl,
          'name': message.owner.name,
        },
        'image_url': message.imageUrl,
        'name': message.name,
        'is_purchased': message.isPurchased,
        'type': 'SUBSCRIPTION',
      }
    };

    webSocket?.add(const JsonEncoder().convert(json));
  }

  Future<void> deleteMessage(Message message) async {
    await connect();

    Map<String, dynamic> json = {
      'type': 'EVENT',
      'event': {
        'message_id': message.id,
        'owner_id': message.owner.id,
        'type': 'DELETE',
      }
    };

    webSocket?.add(const JsonEncoder().convert(json));
  }
}
