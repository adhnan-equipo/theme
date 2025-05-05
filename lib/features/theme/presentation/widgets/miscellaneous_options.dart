// lib/features/theme/presentation/widgets/miscellaneous_options.dart
import 'package:flutter/material.dart';

class MiscellaneousOptionsWidget extends StatelessWidget {
  final bool tooltipsMatchBackground;
  final bool transparentStatusBar;
  final bool applyElevationOverlayColor;
  final bool transparentNavigationBar;
  final ValueChanged<bool> onTooltipsMatchBackgroundChanged;
  final ValueChanged<bool> onTransparentStatusBarChanged;
  final ValueChanged<bool> onApplyElevationOverlayColorChanged;
  final ValueChanged<bool> onTransparentNavigationBarChanged;

  const MiscellaneousOptionsWidget({
    Key? key,
    required this.tooltipsMatchBackground,
    required this.transparentStatusBar,
    required this.applyElevationOverlayColor,
    required this.transparentNavigationBar,
    required this.onTooltipsMatchBackgroundChanged,
    required this.onTransparentStatusBarChanged,
    required this.onApplyElevationOverlayColorChanged,
    required this.onTransparentNavigationBarChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Miscellaneous Options',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        SwitchListTile(
          title: const Text('Tooltips Match Background'),
          subtitle: const Text(
            'Tooltips use background color instead of default',
          ),
          value: tooltipsMatchBackground,
          onChanged: onTooltipsMatchBackgroundChanged,
        ),

        SwitchListTile(
          title: const Text('Transparent Status Bar'),
          subtitle: const Text('Make the status bar transparent (mobile only)'),
          value: transparentStatusBar,
          onChanged: onTransparentStatusBarChanged,
        ),

        SwitchListTile(
          title: const Text('Apply Elevation Overlay Color'),
          subtitle: const Text('Add overlay to elevated surfaces in dark mode'),
          value: applyElevationOverlayColor,
          onChanged: onApplyElevationOverlayColorChanged,
        ),

        SwitchListTile(
          title: const Text('Transparent Navigation Bar'),
          subtitle: const Text(
            'Make the system navigation bar transparent (mobile only)',
          ),
          value: transparentNavigationBar,
          onChanged: onTransparentNavigationBarChanged,
        ),
      ],
    );
  }
}
