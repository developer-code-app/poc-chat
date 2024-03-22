import 'dart:async';

import 'package:poc_chat/models/message.dart';

part 'chat_message.dart';
part 'event_message.dart';

class Broadcaster {
  Broadcaster._({required this.messageStreamController});

  static Broadcaster? _instance;

  // ignore: prefer_constructors_over_static_methods
  static Broadcaster get instance {
    _instance ??= Broadcaster._(
      messageStreamController: StreamController.broadcast(),
    );

    return _instance!;
  }

  final StreamController<BroadcastMessage> messageStreamController;

  Stream<BroadcastMessage> get stream => messageStreamController.stream;

  void add(BroadcastMessage message) => messageStreamController.add(message);
}

abstract class BroadcastMessage {}
