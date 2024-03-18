import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:poc_chat/app/app_theme.dart';
import 'package:poc_chat/app/cubits/app_theme_cubit.dart';
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
    final appTheme = SupportedThemeContructor.fromString(
        // prefs.getString(PreferenceKeys.appTheme) ?? '',
        'marble').appTheme;

    return MultiBlocProvider(
      providers: [
        BlocProvider<AppThemeCubit>(
          create: (context) => AppThemeCubit(
            theme: appTheme,
          ),
        ),
      ],
      child: BlocBuilder<AppThemeCubit, AppTheme>(
        builder: (context, appTheme) {
          return NeumorphicApp(
            title: 'Flutter Demo',
            themeMode: appTheme.mode,
            theme: appTheme.neumorphic,
            materialTheme: appTheme.material,
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
        },
      ),
    );
  }
}
