import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:poc_chat/extensions/alert_dialog_convenience_showing.dart';
import 'package:poc_chat/models/message.dart';
import 'package:poc_chat/models/subscription_package.dart';
import 'package:poc_chat/models/time.dart';
import 'package:poc_chat/models/user.dart';
import 'package:poc_chat/page/action_sheet.dart' as action_sheet;
import 'package:poc_chat/page/chat/bloc/chat_page_bloc.dart';
import 'package:poc_chat/page/search/bloc/search_page_bloc.dart' as search_bloc;
import 'package:poc_chat/page/search/search_page.dart' as search_page;
import 'package:poc_chat/providers/isar_storage/isar_storage_provider.dart';
import 'package:poc_chat/repository/room_repository.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final textEditingController = TextEditingController();
  final scrollController = ScrollController();
  final package = SubscriptionPackage(
    id: '1',
    thumbnailUrl: 'thumbnailUrl',
    name: 'มอเตอร์ประตูรีโมท HomeXpert ประตูบานซ้อน 2 ติดตั้งแบบสลิง...',
  );

  void _onMessageSubmitted() {
    final bloc = context.read<ChatPageBloc>();

    bloc.add(BasicMessageSentEvent(textEditingController.text));

    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    FocusScope.of(context).unfocus();
    textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<ChatPageBloc, ChatPageState>(builder: (context, state) {
      final bloc = context.read<ChatPageBloc>();

      if (state is LoadSuccessState) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: colorScheme.inversePrimary,
            title: Text('Hello, ${state.currentUser.name}'),
            actions: [
              TextButton(
                onPressed: () {
                  final controller = TextEditingController();

                  AlertDialogConvenienceShowing.showAlertDialog(
                    context: context,
                    title: 'Search Message',
                    inputField: TextField(controller: controller),
                    actions: [
                      AlertAction(
                        'Search',
                        onPressed: () => navigationToSearchPage(
                          keyword: controller.text,
                          currentUser: state.currentUser,
                        ),
                      )
                    ],
                  );
                },
                child: Icon(
                  Icons.search,
                  color: Colors.grey.shade700,
                ),
              ),
              if (state.currentUser.id == '1')
                TextButton(
                  onPressed: () {
                    action_sheet.ActionSheet(
                      title: 'Share',
                      actions: [
                        action_sheet.Action(
                          'Subscription',
                          () => bloc.add(
                            ShareSubscriptionPackageEvent(
                              package: package,
                              isPurchased: false,
                            ),
                          ),
                        ),
                        action_sheet.Action(
                          'Appointment',
                          () {},
                        )
                      ],
                      cancel: action_sheet.Action(
                        'Cancel',
                        () {},
                      ),
                    ).show(context);
                  },
                  child: Icon(
                    Icons.share,
                    color: Colors.grey.shade700,
                  ),
                ),
            ],
          ),
          backgroundColor: Colors.grey.shade100,
          body: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ListView(
                      controller: scrollController,
                      shrinkWrap: true,
                      reverse: true,
                      children: state.room.messages.reversed.map((message) {
                        return _buildMessage(context, state, message: message);
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Container(
                color: colorScheme.inversePrimary,
                height: 100,
                width: double.maxFinite,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                      Expanded(
                        child: TextField(
                          controller: textEditingController,
                          decoration: const InputDecoration(hintText: 'Aa'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: GestureDetector(
                          onTap: _onMessageSubmitted,
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
      } else if (state is LoadFailureState) {
        return Scaffold(body: Center(child: Text(state.error.toString())));
      } else {
        return Scaffold(body: Container());
      }
    });
  }

  Widget _buildMessage(
    BuildContext context,
    LoadSuccessState state, {
    required Message message,
  }) {
    final isOwner = message.owner.id == state.currentUser.id;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Align(
        alignment: isOwner ? Alignment.topRight : Alignment.topLeft,
        child: Column(
          crossAxisAlignment:
              isOwner ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            _buildUser(context, state, message: message),
            if (message.deletedAt != null) ...[
              _buildMessageDeleted(context),
            ] else ...[
              if (message is BasicMessage)
                _buildBasicMessage(context, state, message: message),
              if (message is SubscriptionPackageMessage)
                _buildSubscriptionMessage(
                  context,
                  message: message,
                ),
              if (message is AppointmentMessage)
                _buildAppointmentMessage(
                  context,
                  message: message,
                ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildBasicMessage(
    BuildContext context,
    LoadSuccessState state, {
    required BasicMessage message,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final isOwner = message.owner.id == state.currentUser.id;
    final bloc = context.read<ChatPageBloc>();

    return GestureDetector(
      onLongPress: () => bloc.add(
        MessageOptionsRequestedEvent(context, message: message),
      ),
      child: Container(
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
      ),
    );
  }

  Widget _buildSubscriptionMessage(
    BuildContext context, {
    required SubscriptionPackageMessage message,
  }) {
    final bloc = context.read<ChatPageBloc>();

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
            child: Text(message.name),
          ),
          if (message.isPurchased)
            TextButton(onPressed: () {}, child: const Text('ชำระเงินแล้ว'))
          else
            TextButton(
              onPressed: () => bloc.add(
                ShareSubscriptionPackageEvent(
                  package: package,
                  isPurchased: true,
                ),
              ),
              child: const Text('ชำระเงิน'),
            )
        ],
      ),
    );
  }

  Widget _buildAppointmentMessage(
    BuildContext context, {
    required AppointmentMessage message,
  }) {
    final selectedDate = message.selectedDate;

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
          if (selectedDate != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                selectedDate.time.description() ?? '',
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

  Widget _buildMessageDeleted(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          'ยกเลิกการส่งข้อความ',
          style: TextStyle(fontSize: 16, color: Colors.grey.shade400),
        ),
      ),
    );
  }

  Widget _buildUser(
    BuildContext context,
    LoadSuccessState state, {
    required Message message,
  }) {
    final messages = state.room.messages.toList();
    final index = messages.indexOf(message);
    final previousMessage = index > 0 ? messages[index - 1] : null;

    if (previousMessage?.owner.id != message.owner.id) {
      final isOwner = message.owner.id == state.currentUser.id;

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
                    message.owner.name,
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

  void navigationToSearchPage({
    required String keyword,
    required User currentUser,
  }) {
    // Future.delayed(const Duration(milliseconds: 500), () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MultiRepositoryProvider(
          providers: [
            RepositoryProvider<RoomRepository>(
              create: (context) => RoomRepository(
                storageProvider: IsarStorageProvider.basic(),
              ),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<search_bloc.SearchPageBloc>(
                create: (context) => search_bloc.SearchPageBloc(
                  repository: context.read<RoomRepository>(),
                  user: currentUser,
                  keyword: keyword,
                )..add(search_bloc.StartedEvent()),
              ),
            ],
            child: const search_page.SearchPage(),
          ),
        ),
      ),
    );
    // });
  }
}
