// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/presentation/screens/home_screen.dart';
import 'features/theme/data/repositories/theme_repository.dart';
import 'features/theme/domain/services/theme_service.dart';
import 'features/theme/presentation/bloc/theme_bloc.dart';
import 'features/theme/presentation/bloc/theme_event.dart';
import 'features/theme/presentation/bloc/theme_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ThemeRepository>(
          create: (context) => ThemeRepository(),
        ),
        RepositoryProvider<ThemeService>(create: (context) => ThemeService()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeBloc>(
            create:
                (context) => ThemeBloc(
                  themeRepository: context.read<ThemeRepository>(),
                  themeService: context.read<ThemeService>(),
                )..add(InitializeThemeEvent()),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        if (state.status == ThemeStatus.initial ||
            state.status == ThemeStatus.loading) {
          return MaterialApp(
            title: 'Flutter Theme App',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: ThemeMode.system,
            home: const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        return MaterialApp(
          title: 'Flutter Theme App',
          theme: state.lightTheme,
          darkTheme: state.darkTheme,
          themeMode: state.themeModel.themeMode,
          home: const HomeScreen(),
        );
      },
    );
  }
}
