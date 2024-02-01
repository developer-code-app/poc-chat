import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat/models/user.dart';
import 'package:poc_chat/page/chat/bloc/chat_page_bloc.dart' as chat_bloc;
import 'package:poc_chat/page/chat/chat_page.dart' as chat_page;
import 'package:poc_chat/page/login/bloc/login_page_bloc.dart';
import 'package:poc_chat/providers/service/isar_service.dart';
import 'package:poc_chat/repository/room_repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<LoginPageBloc, LoginPageState>(
        builder: (context, state) {
      final bloc = context.read<LoginPageBloc>();

      if (state is LoadSuccessState) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: colorScheme.inversePrimary,
            title: const Text('POC Chat'),
            actions: [
              TextButton(
                onPressed: () => bloc.add(SetupMockDataEvent()),
                child: const Text('Set Mock'),
              ),
              TextButton(
                onPressed: () => bloc.add(ClearDatabaseEvent()),
                child: const Text('Clear db'),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Accounts',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ...state.users
                    .map<Widget>(
                      (user) => Row(
                        children: [
                          Text(
                            user.name,
                            style: const TextStyle(fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () => navigationToChatPage(user: user),
                            child: const Text('Login'),
                          )
                        ],
                      ),
                    )
                    .intersperse(const Divider())
                    .toList()
              ],
            ),
          ),
        );
      } else if (state is LoadFailureState) {
        return Scaffold(body: Center(child: Text(state.error.toString())));
      } else {
        return Scaffold(body: Container());
      }
    });
  }

  void navigationToChatPage({required User user}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MultiRepositoryProvider(
          providers: [
            RepositoryProvider<RoomRepository>(
              create: (context) => RoomRepository(isar: IsarService()),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<chat_bloc.ChatPageBloc>(
                create: (context) => chat_bloc.ChatPageBloc(
                  repository: context.read<RoomRepository>(),
                  user: user,
                )..add(chat_bloc.StartedEvent()),
              ),
            ],
            child: const chat_page.ChatPage(),
          ),
        ),
      ),
    );
  }
}
