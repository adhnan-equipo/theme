// lib/features/theme/presentation/widgets/icon_theme_customization.dart
import 'package:flutter/material.dart';

import 'custom_color_picker.dart';

class IconThemeCustomizationWidget extends StatelessWidget {
  final Color? primaryIconColor;
  final Color? appBarIconColor;
  final double iconSize;
  final ValueChanged<Color> onPrimaryIconColorChanged;
  final ValueChanged<Color> onAppBarIconColorChanged;
  final ValueChanged<double> onIconSizeChanged;

  const IconThemeCustomizationWidget({
    Key? key,
    this.primaryIconColor,
    this.appBarIconColor,
    required this.iconSize,
    required this.onPrimaryIconColorChanged,
    required this.onAppBarIconColorChanged,
    required this.onIconSizeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectivePrimaryIconColor =
        primaryIconColor ?? theme.colorScheme.onSurface;
    final effectiveAppBarIconColor =
        appBarIconColor ?? theme.colorScheme.onPrimary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Icon Theming',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        // Primary Icon Color
        CustomColorPickerWidget(
          title: 'Primary Icon Color',
          currentColor: effectivePrimaryIconColor,
          onColorChanged: onPrimaryIconColorChanged,
        ),

        const SizedBox(height: 16),

        // AppBar Icon Color
        CustomColorPickerWidget(
          title: 'AppBar Icon Color',
          currentColor: effectiveAppBarIconColor,
          onColorChanged: onAppBarIconColorChanged,
        ),

        const SizedBox(height: 16),

        // Icon Size Slider
        Text(
          'Icon Size: ${iconSize.toStringAsFixed(1)}',
          style: theme.textTheme.titleSmall,
        ),
        Slider(
          value: iconSize,
          min: 16.0,
          max: 32.0,
          divisions: 16,
          label: iconSize.toStringAsFixed(1),
          onChanged: onIconSizeChanged,
        ),

        // Icon preview
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text('Primary Icons', style: theme.textTheme.titleSmall),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: effectivePrimaryIconColor,
                      size: iconSize,
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.settings,
                      color: effectivePrimaryIconColor,
                      size: iconSize,
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.favorite,
                      color: effectivePrimaryIconColor,
                      size: iconSize,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(width: 32),
            Column(
              children: [
                Text('AppBar Icons', style: theme.textTheme.titleSmall),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.menu,
                      color: effectiveAppBarIconColor,
                      size: iconSize,
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.search,
                      color: effectiveAppBarIconColor,
                      size: iconSize,
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.more_vert,
                      color: effectiveAppBarIconColor,
                      size: iconSize,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
