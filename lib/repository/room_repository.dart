import 'package:poc_chat/models/chat_room.dart';
import 'package:poc_chat/models/message.dart';
import 'package:poc_chat/models/subscription_package.dart';
import 'package:poc_chat/providers/isar_storage/isar_storage_provider.dart';

class RoomRepository {
  RoomRepository({required this.storageProvider});

  final IsarStorageProvider storageProvider;

  Future<ChatRoom> fetchRoom({required int roomId}) async {
    return storageProvider.chatRoom.fetchRoom(roomId: roomId);
  }

  Future<Message> sendBasicMessage({
    required String text,
    required String roomId,
    required String userId,
  }) {
    return storageProvider.chatRoom.sendBasicMessage(
      text: text,
      roomId: roomId,
      userId: userId,
    );
  }

  Future<Message> shareSubscriptionPackageMessage({
    required SubscriptionPackage package,
    required bool isPurchased,
    required String roomId,
    required String userId,
  }) {
    return storageProvider.chatRoom.shareSubscriptionPackageMessage(
      package: package,
      isPurchased: isPurchased,
      roomId: roomId,
      userId: userId,
    );
  }
}
