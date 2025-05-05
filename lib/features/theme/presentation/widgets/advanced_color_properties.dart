// lib/features/theme/presentation/widgets/advanced_color_properties.dart
import 'package:flutter/material.dart';

import '../widgets/custom_color_picker.dart';

class AdvancedColorPropertiesWidget extends StatelessWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final ValueChanged<Color> onPrimaryColorChanged;
  final ValueChanged<Color> onSecondaryColorChanged;
  final ValueChanged<Color> onTertiaryColorChanged;

  const AdvancedColorPropertiesWidget({
    Key? key,
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.onPrimaryColorChanged,
    required this.onSecondaryColorChanged,
    required this.onTertiaryColorChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Custom Colors',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        CustomColorPickerWidget(
          title: 'Primary Color',
          currentColor: primaryColor,
          onColorChanged: onPrimaryColorChanged,
        ),
        const SizedBox(height: 16),
        CustomColorPickerWidget(
          title: 'Secondary Color',
          currentColor: secondaryColor,
          onColorChanged: onSecondaryColorChanged,
        ),
        const SizedBox(height: 16),
        CustomColorPickerWidget(
          title: 'Tertiary Color',
          currentColor: tertiaryColor,
          onColorChanged: onTertiaryColorChanged,
        ),
        const SizedBox(height: 16),
        const Text(
          'Note: Custom colors will override the selected color scheme',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}
