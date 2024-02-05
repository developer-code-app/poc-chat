import 'package:poc_chat/models/chat_room.dart';
import 'package:poc_chat/providers/isar_storage/isar_storage_provider.dart';

class RoomRepository {
  RoomRepository({required this.storageProvider});

  final IsarStorageProvider storageProvider;

  Future<ChatRoom> fetchRoom({required int roomId}) async {
    return storageProvider.chatRoom.fetchRoom(roomId: roomId);
  }
}
