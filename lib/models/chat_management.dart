import 'dart:convert';
import 'dart:io';

import 'package:poc_chat/models/message.dart';
import 'package:poc_chat/models/user.dart';

class ChatManagement {
  ChatManagement._();

  static ChatManagement? _instance;

  // ignore: prefer_constructors_over_static_methods
  static ChatManagement get instance {
    _instance ??= ChatManagement._();

    return _instance!;
  }

  static String webSocketUrl = 'ws://10.0.0.12:8080';

  void listener(Function(Message)? message) async {
    final webSocket = await WebSocket.connect(webSocketUrl);

    webSocket.listen((jsonString) {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;

      if (json['type'] == 'BASIC') {
        message?.call(
          BasicMessage(
            id: json['id'],
            owner: User(
              id: json['owner']['id'],
              name: json['owner']['name'],
              imageUrl: json['owner']['image_url'],
            ),
            text: json['text'],
          ),
        );
      } else if (json['type'] == 'SUBSCRIPTION') {
        message?.call(
          SubscriptionPackageMessage(
            id: json['id'],
            owner: User(
              id: json['owner']['id'],
              name: json['owner']['name'],
              imageUrl: json['owner']['image_url'],
            ),
            imageUrl: json['image_url'],
            name: json['name'],
            isPurchased: json['is_purchased'],
          ),
        );
      }
    });
  }

  Future<void> sendMessage(Message message) async {
    if (message is BasicMessage) {
      _sendBasicMessage(message);
    } else if (message is SubscriptionPackageMessage) {
      _sendSubscriptionPackageMessage(message);
    }
  }

  Future<void> _sendBasicMessage(BasicMessage message) async {
    final webSocket = await WebSocket.connect(webSocketUrl);

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

    webSocket.add(const JsonEncoder().convert(json));
  }

  Future<void> _sendSubscriptionPackageMessage(
    SubscriptionPackageMessage message,
  ) async {
    final webSocket = await WebSocket.connect(webSocketUrl);

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

    webSocket.add(const JsonEncoder().convert(json));
  }
}
