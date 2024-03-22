import 'package:poc_chat/models/chat_room.dart';
import 'package:poc_chat/models/message.dart';
import 'package:poc_chat/providers/isar_storage/isar_storage_provider.dart';
import 'package:poc_chat/providers/isar_storage/requests/isar_save_message_request.dart';

class RoomRepository {
  RoomRepository({required this.storageProvider});

  final IsarStorageProvider storageProvider;

  Future<List<Message>> searchMessages({required String message}) async {
    return storageProvider.chatRoom.findMessages(message: message);
  }

  Future<ChatRoom> findChatRoom({required String chatRoomId}) async {
    return storageProvider.chatRoom.findChatRoom(chatRoomId: chatRoomId);
  }

  Future<Message> saveMessage({
    required Message message,
    required String chatRoomId,
  }) {
    final request = IsarSaveMessageRequest.fromModel(
      message: message,
      chatRoomId: chatRoomId,
    );

    return storageProvider.chatRoom.saveMessage(request);
  }

  Future<Message> deleteMessage({required String messageId}) {
    return storageProvider.chatRoom.deleteMessage(messageId);
  }
}
