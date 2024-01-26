import 'package:poc_chat/models/message/appointment_message.dart';
import 'package:poc_chat/models/message/basic_message.dart';
import 'package:poc_chat/models/message/subscription_message.dart';
import 'package:poc_chat/models/room.dart';
import 'package:poc_chat/repository/user_repository.dart';

class RoomRepository {
  Future<Room> fetchRoom({required String roomId}) async {
    if (roomId != '1') throw Exception('Room not found.');

    final repository = UserRepository();
    final users = await repository.fetchUsers();
    final admin = users.first;
    final user = users.last;

    return Future.value(Room(
      id: '1',
      messages: [
        BasicMessage(
          id: '1',
          user: admin,
          text:
              'สวัสดีค่ะ น้ำฝนนะคะ ตามที่เราเคยคุยกันไว้เรื่องติดตั้งประตูไฟฟ้า คุณรวิทัตได้เลือกแบบสลิง ที่ราคา 33,000 บาท ใช่มัยคะ',
        ),
        BasicMessage(
          id: '2',
          user: user,
          text: 'ใช่ครับผม',
        ),
        BasicMessage(
          id: '3',
          user: admin,
          text: 'โอเคค่ะ ฝนรบกวนคุณรวิทัตชำระเงินแพ็กเกจนี้ให้หน่อยนะคะ',
        ),
        SubscriptionMessage(
          id: '4',
          user: admin,
          imageUrl: '',
          packageName:
              'มอเตอร์ประตูรีโมท HomeXpert ประตูบานซ้อน 2 ติดตั้งแบบสลิง...',
          isPaid: false,
        ),
        BasicMessage(
          id: '5',
          user: user,
          text: 'สักครู่นะครับ กำลังชำระเงินครับ',
        ),
        SubscriptionMessage(
          id: '6',
          user: user,
          imageUrl: '',
          packageName:
              'มอเตอร์ประตูรีโมท HomeXpert ประตูบานซ้อน 2 ติดตั้งแบบสลิง',
          isPaid: true,
        ),
        BasicMessage(
          id: '7',
          user: user,
          text: 'เรียบร้อยครับผม',
        ),
        BasicMessage(
          id: '8',
          user: admin,
          text:
              'ขอบคุณค่ะ สะดวกให้เข้าไปติดตั้งวันไหนบ้างคะใกล้สุดจะมี 1/11, 5/11 ค่ะ',
        ),
        BasicMessage(
          id: '9',
          user: user,
          text: 'ผมสะดวก วันที่ 1/11 ครับ',
        ),
        BasicMessage(
          id: '10',
          user: admin,
          text: 'ได้เลยค่ะ เดี๋ยวฝนจะทำนัดหมายให้นะคะ',
        ),
        BasicMessage(
          id: '11',
          user: admin,
          text: 'รบกวนคุณรวิทัต เลือกช่วงเวลาให้ฝนหน่อยค่ะ',
        ),
        AppointmentMessage(
          id: '12',
          user: admin,
          packageName:
              'มอเตอร์ประตูรีโมท HomeXpert ประตูบานซ้อน 2 ติดตั้งแบบสลิง...',
          availableDates: [
            AvailableDate(date: DateTime.now(), time: Time.morning),
            AvailableDate(date: DateTime.now(), time: Time.afternoon)
          ],
        ),
        AppointmentMessage(
          id: '13',
          user: user,
          packageName:
              'มอเตอร์ประตูรีโมท HomeXpert ประตูบานซ้อน 2 ติดตั้งแบบสลิง...',
          availableDates: [
            AvailableDate(date: DateTime.now(), time: Time.morning),
            AvailableDate(date: DateTime.now(), time: Time.afternoon)
          ],
          time: Time.morning,
        ),
        BasicMessage(
          id: '14',
          user: user,
          text: 'ตามนี้เลยครับผม',
        ),
        BasicMessage(
          id: '15',
          user: admin,
          text: 'รับทราบค่ะ ขอบคุณค่ะ',
        ),
      ],
    ));
  }
}
