// lib/features/home/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../sample/presentation/screens/sample_screen.dart';
import '../../../theme/presentation/bloc/theme_bloc.dart';
import '../../../theme/presentation/bloc/theme_event.dart';
import '../../../theme/presentation/screens/theme_settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customizable Theme'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              final themeBloc = context.read<ThemeBloc>();
              final currentThemeMode = themeBloc.state.themeModel.themeMode;

              if (currentThemeMode == ThemeMode.light) {
                themeBloc.add(const ChangeThemeModeEvent(ThemeMode.dark));
              } else if (currentThemeMode == ThemeMode.dark) {
                themeBloc.add(const ChangeThemeModeEvent(ThemeMode.system));
              } else {
                themeBloc.add(const ChangeThemeModeEvent(ThemeMode.light));
              }
            },
            tooltip: 'Toggle theme mode',
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                child: Icon(Icons.color_lens, size: 60),
              ),
              const SizedBox(height: 32),
              Text(
                'Welcome to Customizable Theme App',
                style: theme.textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'This app demonstrates a comprehensive theming system with BLoC pattern and AI chat integration.',
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                icon: const Icon(Icons.palette),
                label: const Text('Theme Settings'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThemeSettingsScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                icon: const Icon(Icons.preview),
                label: const Text('Sample Components'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SampleScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              TextButton.icon(
                icon: const Icon(Icons.chat),
                label: const Text('AI Theme Chat'),
                onPressed: () {
                  // We'll implement this in Phase 3
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('AI Chat will be implemented in Phase 3'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
