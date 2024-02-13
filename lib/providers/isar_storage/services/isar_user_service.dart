import 'package:dfunc/dfunc.dart';
import 'package:isar/isar.dart';
import 'package:poc_chat/models/message_type.dart';
import 'package:poc_chat/models/time.dart';
import 'package:poc_chat/models/user.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_message_entity.dart';
import 'package:poc_chat/providers/isar_storage/entities/isar_user_entity.dart';

class IsarUserService {
  IsarUserService(this.isar);

  final Future<Isar> isar;

  Future<List<User>> findAllUsers() async {
    final users = await isar.then(
      (isar) => isar.isarUserEntitys.where().findAll(),
    );

    return users.map(User.fromEntity).toList();
  }

  Future<void> addMockData() async {
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
    final users = ['SC Asset', 'Pattarapon']
        .mapIndexed((index, name) => IsarUserEntity()
          ..name = name
          ..imageUrl = '')
        .toList();
    final room = IsarChatRoomEntity();
    final messages = [
      IsarMessageEntity()
        ..owner.value = users.first
        ..type = MessageType.basic
        ..text =
            'สวัสดีค่ะ น้ำฝนนะคะ ตามที่เราเคยคุยกันไว้เรื่องติดตั้งประตูไฟฟ้า คุณรวิทัตได้เลือกแบบสลิง ที่ราคา 33,000 บาท ใช่มัยคะ',
      IsarMessageEntity()
        ..owner.value = users.last
        ..type = MessageType.basic
        ..text = 'ใช่ครับผม',
      IsarMessageEntity()
        ..owner.value = users.first
        ..type = MessageType.basic
        ..text = 'โอเคค่ะ ฝนรบกวนคุณรวิทัตชำระเงินแพ็กเกจนี้ให้หน่อยนะคะ',
      IsarMessageEntity()
        ..owner.value = users.first
        ..type = MessageType.subscription
        ..package = (SubscriptionPackage()
          ..imageUrl = ''
          ..name = packageName
          ..isPurchased = false),
      IsarMessageEntity()
        ..owner.value = users.last
        ..type = MessageType.basic
        ..text = 'สักครู่นะครับ กำลังชำระเงินครับ',
      IsarMessageEntity()
        ..owner.value = users.last
        ..type = MessageType.subscription
        ..package = (SubscriptionPackage()
          ..imageUrl = ''
          ..name = packageName
          ..isPurchased = true),
      IsarMessageEntity()
        ..owner.value = users.last
        ..type = MessageType.basic
        ..text = 'เรียบร้อยครับผม',
      IsarMessageEntity()
        ..owner.value = users.first
        ..type = MessageType.basic
        ..text =
            'ขอบคุณค่ะ สะดวกให้เข้าไปติดตั้งวันไหนบ้างคะใกล้สุดจะมี 1/11, 5/11 ค่ะ',
      IsarMessageEntity()
        ..owner.value = users.last
        ..type = MessageType.basic
        ..text = 'ผมสะดวก วันที่ 1/11 ครับ',
      IsarMessageEntity()
        ..owner.value = users.first
        ..type = MessageType.basic
        ..text = 'ได้เลยค่ะ เดี๋ยวฝนจะทำนัดหมายให้นะคะ',
      IsarMessageEntity()
        ..owner.value = users.first
        ..type = MessageType.basic
        ..text = 'รบกวนคุณรวิทัต เลือกช่วงเวลาให้ฝนหน่อยค่ะ',
      IsarMessageEntity()
        ..owner.value = users.first
        ..type = MessageType.appointment
        ..appointment = (Appointment()
          ..packageName = packageName
          ..availableDates = availableDates),
      IsarMessageEntity()
        ..owner.value = users.last
        ..type = MessageType.basic
        ..text = 'ตามนี้เลยครับผม',
      IsarMessageEntity()
        ..owner.value = users.last
        ..type = MessageType.appointment
        ..appointment = (Appointment()
          ..packageName = packageName
          ..availableDates = availableDates
          ..selectedDate = availableDates.last),
      IsarMessageEntity()
        ..owner.value = users.first
        ..type = MessageType.basic
        ..text = 'รับทราบค่ะ ขอบคุณค่ะ',
    ];

    await isar.then(
      (isar) => isar.writeTxn(() async {
        await isar.isarUserEntitys.putAll(users);
        await isar.isarChatRoomEntitys.putAll([room]);
        await isar.isarMessageEntitys.putAll(messages);

        room.members.addAll(users);
        room.messages.addAll(messages);

        messages.forEach((message) => message.owner.save());

        await room.members.save();
        await room.messages.save();
      }),
    );
  }

  Future<void> removeMockData() async {
    await isar.then(
      (isar) => isar.writeTxn(() async {
        await isar.isarUserEntitys.clear();
        await isar.isarChatRoomEntitys.clear();
        await isar.isarMessageEntitys.clear();
      }),
    );
  }
}
