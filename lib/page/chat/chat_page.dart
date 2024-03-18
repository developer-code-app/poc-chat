import 'package:dfunc/dfunc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:poc_chat/app/app_theme.dart';
import 'package:poc_chat/app/cubits/app_theme_cubit.dart';
import 'package:poc_chat/gen/colors.gen.dart';
import 'package:poc_chat/models/message.dart';
import 'package:poc_chat/models/subscription_package.dart';
import 'package:poc_chat/models/time.dart';
import 'package:poc_chat/page/action_sheet.dart' as action_sheet;
import 'package:poc_chat/page/chat/bloc/chat_page_bloc.dart';
import 'package:poc_chat/page/primary_button.dart';

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
    final theme = context.read<AppThemeCubit>().state;
    final background = Background.of(theme);

    return BlocBuilder<ChatPageBloc, ChatPageState>(builder: (context, state) {
      final bloc = context.read<ChatPageBloc>();

      if (state is LoadSuccessState) {
        return Container(
          decoration: background,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              shadowColor: Colors.transparent,
              backgroundColor: theme.neumorphic.baseColor,
              title: Text(
                'Hello, ${state.currentUser.name}',
                style: theme.typography.headline3,
              ),
              actions: [
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
                          return _buildMessage(context, state,
                              message: message);
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: theme.neumorphic.baseColor,
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
          ),
        );
      } else if (state is LoadFailureState) {
        return Container(
          decoration: background,
          child: Scaffold(body: Center(child: Text(state.error.toString()))),
        );
      } else {
        return Container(
          decoration: background,
          child: Scaffold(body: Container()),
        );
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
            if (message is BasicMessage)
              _buildBasicMessage(context, state, message: message),
            if (message is SubscriptionPackageMessage)
              _buildSubscriptionMessage(
                context,
                message: message,
                isOwner: isOwner,
              ),
            if (message is AppointmentMessage)
              _buildAppointmentMessage(
                context,
                message: message,
                isOwner: isOwner,
              ),
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
    final theme = context.read<AppThemeCubit>().state;

    return Container(
      decoration: BoxDecoration(
        color: isOwner ? colorScheme.inversePrimary : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          message.text,
          style: theme.typography.body1,
        ),
      ),
    );
  }

  Widget _buildSubscriptionMessage(
    BuildContext context, {
    required SubscriptionPackageMessage message,
    required bool isOwner,
  }) {
    final bloc = context.read<ChatPageBloc>();
    final theme = context.read<AppThemeCubit>().state;

    return Row(
      children: [
        if (isOwner) const Expanded(child: SizedBox()),
        Expanded(
          flex: 2,
          child: Neumorphic(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.network(message.imageUrl),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    message.name,
                    style: theme.typography.body2,
                  ),
                ),
                if (message.isPurchased)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 16, 16),
                    child: Text(
                      'ชำระเงินแล้ว',
                      style: theme.typography.buttonLabel.copyWith(
                        color: ColorName.greenBlue,
                      ),
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 16, 16),
                    child: PrimaryButton(
                      title: 'ชำระเงิน',
                      onPressed: () => bloc.add(
                        ShareSubscriptionPackageEvent(
                          package: package,
                          isPurchased: true,
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
        if (!isOwner) const Expanded(child: SizedBox()),
      ],
    );
  }

  Widget _buildAppointmentMessage(
    BuildContext context, {
    required AppointmentMessage message,
    required bool isOwner,
  }) {
    final selectedDate = message.selectedDate;
    final theme = context.read<AppThemeCubit>().state;

    return Row(
      children: [
        if (isOwner) const Expanded(child: SizedBox()),
        Expanded(
          flex: 10,
          child: Neumorphic(
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
                  child: Text(
                    message.packageName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
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
                    style: theme.typography.body1.copyWith(
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
                          child: NeumorphicButton(
                            onPressed: () {},
                            child: Text(
                              availableDate.time.description() ?? '',
                              style: theme.typography.buttonLabel,
                            ),
                          ),
                        );
                      })
                      .intersperse(const SizedBox(height: 10))
                      .toList(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        if (!isOwner) const Expanded(child: SizedBox()),
      ],
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
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        state.currentUser.imageUrl,
                        fit: BoxFit.cover,
                      ),
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
}
