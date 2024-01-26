import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:poc_chat/page/chat_page.dart';
import 'package:poc_chat/repository/user_repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final repository = UserRepository();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.inversePrimary,
        title: const Text('POC Chat'),
      ),
      body: FutureBuilder(
        future: repository.fetchUsers(),
        builder: (context, snapshot) {
          final users = snapshot.data;

          if (users == null) return Container();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Accounts',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ...users
                    .map<Widget>(
                      (user) => Row(
                        children: [
                          Text(
                            user.name,
                            style: const TextStyle(fontSize: 16),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChatPage(user: user),
                                  ),
                                );
                              },
                              child: const Text('Login'))
                        ],
                      ),
                    )
                    .intersperse(const Divider())
                    .toList()
              ],
            ),
          );
        },
      ),
    );
  }
}
