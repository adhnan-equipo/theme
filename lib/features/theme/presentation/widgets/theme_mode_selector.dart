// lib/features/theme/presentation/widgets/theme_mode_selector.dart
import 'package:flutter/material.dart';

class ThemeModeSelector extends StatelessWidget {
  final ThemeMode selectedThemeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  const ThemeModeSelector({
    Key? key,
    required this.selectedThemeMode,
    required this.onThemeModeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<ThemeMode>(
      segments: const [
        ButtonSegment<ThemeMode>(
          value: ThemeMode.light,
          icon: Icon(Icons.light_mode),
          label: Text('Light'),
        ),
        ButtonSegment<ThemeMode>(
          value: ThemeMode.dark,
          icon: Icon(Icons.dark_mode),
          label: Text('Dark'),
        ),
        ButtonSegment<ThemeMode>(
          value: ThemeMode.system,
          icon: Icon(Icons.auto_mode),
          label: Text('System'),
        ),
      ],
      selected: {selectedThemeMode},
      onSelectionChanged: (Set<ThemeMode> selected) {
        if (selected.isNotEmpty) {
          onThemeModeChanged(selected.first);
        }
      },
    );
  }
}
