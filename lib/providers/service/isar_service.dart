import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:poc_chat/models/message.dart';
import 'package:poc_chat/models/room.dart';
import 'package:poc_chat/models/user.dart';

class IsarService {
  IsarService() {
    db = openDB();
  }

  late Future<Isar> db;

  Future<List<User>> fetchUsers() async {
    final isar = await db;

    return isar.users.where().findAll();
  }

  Future<Room> fetchRoom({required int roomId}) async {
    final isar = await db;
    final room = await isar.rooms.get(roomId);

    if (room == null) throw Exception('Room not found.');

    return Future.value(room);
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();

      return await Isar.open(
        [RoomSchema, MessageSchema, UserSchema],
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }

  Future<bool> close() async {
    final isar = await db;

    return isar.close(deleteFromDisk: true);
  }

  Future<void> setMockData() async {
    final isar = await db;

    const packageName =
        'มอเตอร์ประตูรีโมท HomeXpert ประตูบานซ้อน 2 ติดตั้งแบบสลิง...';
    final availableDates = [
      AvailableDate()
        ..date = DateTime.now()
        ..time = Time.morning,
      AvailableDate()
        ..date = DateTime.now()
        ..time = Time.afternoon,
    ];
    final room = Room();
    final users = ['SC Asset', 'Pattarapon']
        .map(
          (userName) => User()
            ..name = userName
            ..imageUrl = '',
        )
        .toList();
    final messages = [
      Message()
        ..owner.value = users.first
        ..type = MessageType.basic
        ..text =
            'สวัสดีค่ะ น้ำฝนนะคะ ตามที่เราเคยคุยกันไว้เรื่องติดตั้งประตูไฟฟ้า คุณรวิทัตได้เลือกแบบสลิง ที่ราคา 33,000 บาท ใช่มัยคะ',
      Message()
        ..owner.value = users.last
        ..type = MessageType.basic
        ..text = 'ใช่ครับผม',
      Message()
        ..owner.value = users.first
        ..type = MessageType.basic
        ..text = 'โอเคค่ะ ฝนรบกวนคุณรวิทัตชำระเงินแพ็กเกจนี้ให้หน่อยนะคะ',
      Message()
        ..owner.value = users.first
        ..type = MessageType.subscription
        ..subscription = (Subscription()
          ..imageUrl = ''
          ..packageName = packageName
          ..isPaid = false),
      Message()
        ..owner.value = users.last
        ..type = MessageType.basic
        ..text = 'สักครู่นะครับ กำลังชำระเงินครับ',
      Message()
        ..owner.value = users.last
        ..type = MessageType.subscription
        ..subscription = (Subscription()
          ..imageUrl = ''
          ..packageName = packageName
          ..isPaid = true),
      Message()
        ..owner.value = users.last
        ..type = MessageType.basic
        ..text = 'เรียบร้อยครับผม',
      Message()
        ..owner.value = users.first
        ..type = MessageType.basic
        ..text =
            'ขอบคุณค่ะ สะดวกให้เข้าไปติดตั้งวันไหนบ้างคะใกล้สุดจะมี 1/11, 5/11 ค่ะ',
      Message()
        ..owner.value = users.last
        ..type = MessageType.basic
        ..text = 'ผมสะดวก วันที่ 1/11 ครับ',
      Message()
        ..owner.value = users.first
        ..type = MessageType.basic
        ..text = 'ได้เลยค่ะ เดี๋ยวฝนจะทำนัดหมายให้นะคะ',
      Message()
        ..owner.value = users.first
        ..type = MessageType.basic
        ..text = 'รบกวนคุณรวิทัต เลือกช่วงเวลาให้ฝนหน่อยค่ะ',
      Message()
        ..owner.value = users.first
        ..type = MessageType.appointment
        ..appointment = (Appointment()
          ..packageName = packageName
          ..availableDates = availableDates),
      Message()
        ..owner.value = users.last
        ..type = MessageType.basic
        ..text = 'ตามนี้เลยครับผม',
      Message()
        ..owner.value = users.last
        ..type = MessageType.appointment
        ..appointment = (Appointment()
          ..packageName = packageName
          ..availableDates = availableDates),
      Message()
        ..owner.value = users.first
        ..type = MessageType.basic
        ..text = 'รับทราบค่ะ ขอบคุณค่ะ',
    ];

    await isar.writeTxn(() async {
      await isar.users.putAll(users);
      await isar.rooms.put(room);
      await isar.messages.putAll(messages);

      room.members.addAll(users);
      room.messages.addAll(messages);

      messages.forEach((message) => message.owner.save());

      await room.members.save();
      await room.messages.save();
    });
  }
}
