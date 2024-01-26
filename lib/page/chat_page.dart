import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poc_chat/models/message/appointment_message.dart';
import 'package:poc_chat/models/message/basic_message.dart';
import 'package:poc_chat/models/message/message.dart';
import 'package:poc_chat/models/message/photo_message.dart';
import 'package:poc_chat/models/message/subscription_message.dart';
import 'package:poc_chat/models/user.dart';
import 'package:poc_chat/repository/room_repository.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({required this.user, super.key});

  final User user;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final repository = RoomRepository();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.inversePrimary,
        title: Text('Hello, ${widget.user.name}'),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: repository.fetchRoom(roomId: '1'),
              builder: (context, snapshot) {
                final messages = snapshot.data?.messages ?? [];

                return ListView(
                  children: messages.map((message) {
                    return _buildMessage(
                      context,
                      messages: messages,
                      message: message,
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Container(
            color: colorScheme.inversePrimary,
            height: 100,
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.photo_outlined,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Aa'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.send,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(
    BuildContext context, {
    required List<Message> messages,
    required Message message,
  }) {
    final index = messages.indexOf(message);
    final previousMessage = index > 0 ? messages[index - 1] : null;
    final isOwner = message.user.id == widget.user.id;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Align(
        alignment: isOwner ? Alignment.topRight : Alignment.topLeft,
        child: Column(
          crossAxisAlignment:
              isOwner ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            _buildUser(
              context,
              message: message,
              previousMessage: previousMessage,
            ),
            if (message is BasicMessage)
              _buildBasicMessage(context, message: message),
            if (message is SubscriptionMessage)
              _buildSubscriptionMessage(context, message: message),
            if (message is AppointmentMessage)
              _buildAppointmentMessage(context, message: message),
            if (message is PhotoMessage)
              _buildPhotoMessage(context, message: message),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicMessage(
    BuildContext context, {
    required BasicMessage message,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final isOwner = message.user.id == widget.user.id;

    return Container(
      decoration: BoxDecoration(
        color: isOwner ? colorScheme.inversePrimary : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          message.text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildSubscriptionMessage(
    BuildContext context, {
    required SubscriptionMessage message,
  }) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(message.packageName),
          ),
          if (message.isPaid)
            TextButton(onPressed: () {}, child: const Text('ชำระเงินแล้ว'))
          else
            TextButton(onPressed: () {}, child: const Text('ชำระเงิน'))
        ],
      ),
    );
  }

  Widget _buildAppointmentMessage(
    BuildContext context, {
    required AppointmentMessage message,
  }) {
    final time = message.time;

    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'สร้างนัดหมาย',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(message.packageName),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('วันนัดหมาย'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              DateFormat('dd MMMM yyyy')
                  .format(message.availableDates.first.date),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 4),
          if (time != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                time.description() ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          else
            ...message.availableDates
                .map<Widget>((availableDate) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(availableDate.time.description() ?? ''),
                      ),
                    ),
                  );
                })
                .intersperse(const SizedBox(height: 8))
                .toList(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildPhotoMessage(
    BuildContext context, {
    required PhotoMessage message,
  }) {
    return Container();
  }

  Widget _buildUser(
    BuildContext context, {
    required Message message,
    Message? previousMessage,
  }) {
    if (previousMessage?.user.id != message.user.id) {
      final isOwner = message.user.id == widget.user.id;

      return !isOwner
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    message.user.name,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            )
          : const SizedBox(height: 8);
    } else {
      return Container();
    }
  }
}