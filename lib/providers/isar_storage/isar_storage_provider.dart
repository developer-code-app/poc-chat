import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_message_entity.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_user_entity.dart';
import 'package:poc_chat/providers/isar_storage/services/isar_chat_room_service.dart';
import 'package:poc_chat/providers/isar_storage/services/isar_user_service.dart';

class IsarStorageProvider {
  IsarStorageProvider(Future<Isar> isar)
      : user = IsarUserService(isar),
        chatRoom = IsarChatRoomService(isar);

  IsarStorageProvider.basic() : this(_openDatabase());

  static Future<Isar> _openDatabase() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();

      return await Isar.open(
        [
          IsarChatRoomEntitySchema,
          IsarUserEntitySchema,
          IsarMessageEntitySchema
        ],
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }

  final IsarUserService user;
  final IsarChatRoomService chatRoom;
}

 // Future<bool> close() async {
  //   final isar = await db;

  //   return isar.close(deleteFromDisk: true);
  // }

  // Future<void> setMockData() async {
  //   final isar = await db;

    // const packageName =
    //     'มอเตอร์ประตูรีโมท HomeXpert ประตูบานซ้อน 2 ติดตั้งแบบสลิง...';
    // final availableDates = [
    //   AvailableDate()
    //     ..date = DateTime.now()
    //     ..time = Time.morning,
    //   AvailableDate()
    //     ..date = DateTime.now()
    //     ..time = Time.afternoon,
    // ];
    // final room = Room();
    // final users = ['SC Asset', 'Pattarapon']
    //     .map(
    //       (userName) => UserEntity()
    //         ..name = userName
    //         ..imageUrl = '',
    //     )
    //     .toList();
    // final messages = [
    //   Message()
    //     ..owner.value = users.first
    //     ..type = MessageType.basic
    //     ..text =
    //         'สวัสดีค่ะ น้ำฝนนะคะ ตามที่เราเคยคุยกันไว้เรื่องติดตั้งประตูไฟฟ้า คุณรวิทัตได้เลือกแบบสลิง ที่ราคา 33,000 บาท ใช่มัยคะ',
    //   Message()
    //     ..owner.value = users.last
    //     ..type = MessageType.basic
    //     ..text = 'ใช่ครับผม',
    //   Message()
    //     ..owner.value = users.first
    //     ..type = MessageType.basic
    //     ..text = 'โอเคค่ะ ฝนรบกวนคุณรวิทัตชำระเงินแพ็กเกจนี้ให้หน่อยนะคะ',
    //   Message()
    //     ..owner.value = users.first
    //     ..type = MessageType.subscription
    //     ..subscription = (Subscription()
    //       ..imageUrl = ''
    //       ..packageName = packageName
    //       ..isPaid = false),
    //   Message()
    //     ..owner.value = users.last
    //     ..type = MessageType.basic
    //     ..text = 'สักครู่นะครับ กำลังชำระเงินครับ',
    //   Message()
    //     ..owner.value = users.last
    //     ..type = MessageType.subscription
    //     ..subscription = (Subscription()
    //       ..imageUrl = ''
    //       ..packageName = packageName
    //       ..isPaid = true),
    //   Message()
    //     ..owner.value = users.last
    //     ..type = MessageType.basic
    //     ..text = 'เรียบร้อยครับผม',
    //   Message()
    //     ..owner.value = users.first
    //     ..type = MessageType.basic
    //     ..text =
    //         'ขอบคุณค่ะ สะดวกให้เข้าไปติดตั้งวันไหนบ้างคะใกล้สุดจะมี 1/11, 5/11 ค่ะ',
    //   Message()
    //     ..owner.value = users.last
    //     ..type = MessageType.basic
    //     ..text = 'ผมสะดวก วันที่ 1/11 ครับ',
    //   Message()
    //     ..owner.value = users.first
    //     ..type = MessageType.basic
    //     ..text = 'ได้เลยค่ะ เดี๋ยวฝนจะทำนัดหมายให้นะคะ',
    //   Message()
    //     ..owner.value = users.first
    //     ..type = MessageType.basic
    //     ..text = 'รบกวนคุณรวิทัต เลือกช่วงเวลาให้ฝนหน่อยค่ะ',
    //   Message()
    //     ..owner.value = users.first
    //     ..type = MessageType.appointment
    //     ..appointment = (Appointment()
    //       ..packageName = packageName
    //       ..availableDates = availableDates),
    //   Message()
    //     ..owner.value = users.last
    //     ..type = MessageType.basic
    //     ..text = 'ตามนี้เลยครับผม',
    //   Message()
    //     ..owner.value = users.last
    //     ..type = MessageType.appointment
    //     ..appointment = (Appointment()
    //       ..packageName = packageName
    //       ..availableDates = availableDates),
    //   Message()
    //     ..owner.value = users.first
    //     ..type = MessageType.basic
    //     ..text = 'รับทราบค่ะ ขอบคุณค่ะ',
    // ];

  //   await isar.writeTxn(() async {
  //     await isar.userEntitys.putAll(users);
  //     await isar.rooms.put(room);
  //     await isar.messages.putAll(messages);

      // room.members.addAll(users);
      // room.messages.addAll(messages);

      // messages.forEach((message) => message.owner.save());

      // await room.members.save();
      // await room.messages.save();
  //   });
  // }