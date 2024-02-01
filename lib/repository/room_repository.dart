import 'package:poc_chat/models/room.dart';
import 'package:poc_chat/providers/service/isar_service.dart';

class RoomRepository {
  RoomRepository({required this.isar});

  final IsarService isar;

  Future<Room> fetchRoom({required int roomId}) async {
    return isar.fetchRoom(roomId: roomId);
  }
}
