// lib/features/theme/presentation/widgets/app_bar_customization.dart
import 'package:flutter/material.dart';

import 'custom_color_picker.dart';

class AppBarCustomizationWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool centerTitle;
  final double elevation;
  final ValueChanged<Color> onBackgroundColorChanged;
  final ValueChanged<Color> onForegroundColorChanged;
  final ValueChanged<bool> onCenterTitleChanged;
  final ValueChanged<double> onElevationChanged;

  const AppBarCustomizationWidget({
    Key? key,
    this.backgroundColor,
    this.foregroundColor,
    required this.centerTitle,
    required this.elevation,
    required this.onBackgroundColorChanged,
    required this.onForegroundColorChanged,
    required this.onCenterTitleChanged,
    required this.onElevationChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBackgroundColor =
        backgroundColor ?? theme.colorScheme.primary;
    final effectiveForegroundColor =
        foregroundColor ?? theme.colorScheme.onPrimary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'App Bar',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        CustomColorPickerWidget(
          title: 'Background Color',
          currentColor: effectiveBackgroundColor,
          onColorChanged: onBackgroundColorChanged,
        ),
        const SizedBox(height: 16),
        CustomColorPickerWidget(
          title: 'Foreground Color',
          currentColor: effectiveForegroundColor,
          onColorChanged: onForegroundColorChanged,
        ),
        const SizedBox(height: 16),
        SwitchListTile(
          title: const Text('Center Title'),
          subtitle: const Text('Center the title in the app bar'),
          value: centerTitle,
          onChanged: onCenterTitleChanged,
        ),
        const SizedBox(height: 16),
        Text(
          'Elevation: ${elevation.toStringAsFixed(1)}',
          style: theme.textTheme.titleSmall,
        ),
        Slider(
          value: elevation,
          min: 0,
          max: 16,
          divisions: 16,
          label: elevation.toStringAsFixed(1),
          onChanged: onElevationChanged,
        ),
        // Preview of how the AppBar will look
        const SizedBox(height: 24),
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: effectiveBackgroundColor,
            boxShadow:
                elevation > 0
                    ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: elevation,
                        offset: const Offset(0, 1),
                      ),
                    ]
                    : null,
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),
              Icon(Icons.menu, color: effectiveForegroundColor),
              const SizedBox(width: 16),
              if (centerTitle)
                Expanded(
                  child: Center(
                    child: Text(
                      'App Bar Preview',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: effectiveForegroundColor,
                      ),
                    ),
                  ),
                )
              else
                Text(
                  'App Bar Preview',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: effectiveForegroundColor,
                  ),
                ),
              const Spacer(),
              Icon(Icons.more_vert, color: effectiveForegroundColor),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ],
    );
  }
}
