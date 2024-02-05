import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat/page/login/bloc/login_page_bloc.dart';
import 'package:poc_chat/page/login/login_page.dart';
import 'package:poc_chat/providers/isar_storage/isar_storage_provider.dart';
import 'package:poc_chat/repository/user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<UserRepository>(
            create: (context) => UserRepository(
              storageProvider: IsarStorageProvider.basic(),
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<LoginPageBloc>(
              create: (context) => LoginPageBloc(
                repository: context.read<UserRepository>(),
              )..add(StartedEvent()),
            ),
          ],
          child: const LoginPage(),
        ),
      ),
    );
  }
}
