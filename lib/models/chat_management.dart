import 'dart:convert';
import 'dart:io';

import 'package:poc_chat/broadcaster/broadcaster.dart';
import 'package:poc_chat/models/message.dart';
import 'package:poc_chat/models/user.dart';

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

        Message message;

        if (json['type'] == 'BASIC') {
          message = BasicMessage(
            id: json['id'],
            owner: User(
              id: json['owner']['id'],
              name: json['owner']['name'],
              imageUrl: json['owner']['image_url'],
            ),
            text: json['text'],
          );
        } else if (json['type'] == 'SUBSCRIPTION') {
          message = SubscriptionPackageMessage(
            id: json['id'],
            owner: User(
              id: json['owner']['id'],
              name: json['owner']['name'],
              imageUrl: json['owner']['image_url'],
            ),
            imageUrl: json['image_url'],
            name: json['name'],
            isPurchased: json['is_purchased'],
          );
        } else {
          throw Exception('Unsupported message type');
        }

        Broadcaster.instance.add(ChatMessage(message: message));
      },
      onError: () => connect(),
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
      'id': message.id,
      'owner': {
        'id': message.owner.id,
        'image_url': message.owner.imageUrl,
        'name': message.owner.name,
      },
      'text': message.text,
      'type': 'BASIC'
    };

    webSocket?.add(const JsonEncoder().convert(json));
  }

  Future<void> _sendSubscriptionPackageMessage(
    SubscriptionPackageMessage message,
  ) async {
    await connect();

    Map<String, dynamic> json = {
      'id': message.id,
      'owner': {
        'id': message.owner.id,
        'image_url': message.owner.imageUrl,
        'name': message.owner.name,
      },
      'image_url': message.imageUrl,
      'name': message.name,
      'is_purchased': message.isPurchased,
      'type': 'SUBSCRIPTION'
    };

    webSocket?.add(const JsonEncoder().convert(json));
  }
}
