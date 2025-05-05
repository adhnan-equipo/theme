// lib/features/theme/presentation/widgets/surface_customization.dart
import 'package:flutter/material.dart';

import '../widgets/custom_color_picker.dart';

class SurfaceCustomizationWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color surfaceColor;
  final Color scaffoldBackgroundColor;
  final double surfaceElevation;
  final ValueChanged<Color> onBackgroundColorChanged;
  final ValueChanged<Color> onSurfaceColorChanged;
  final ValueChanged<Color> onScaffoldBackgroundColorChanged;
  final ValueChanged<double> onSurfaceElevationChanged;

  const SurfaceCustomizationWidget({
    Key? key,
    required this.backgroundColor,
    required this.surfaceColor,
    required this.scaffoldBackgroundColor,
    required this.surfaceElevation,
    required this.onBackgroundColorChanged,
    required this.onSurfaceColorChanged,
    required this.onScaffoldBackgroundColorChanged,
    required this.onSurfaceElevationChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Surface Colors',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        CustomColorPickerWidget(
          title: 'Background Color',
          currentColor: backgroundColor,
          onColorChanged: onBackgroundColorChanged,
        ),
        const SizedBox(height: 16),
        CustomColorPickerWidget(
          title: 'Surface Color',
          currentColor: surfaceColor,
          onColorChanged: onSurfaceColorChanged,
        ),
        const SizedBox(height: 16),
        CustomColorPickerWidget(
          title: 'Scaffold Background Color',
          currentColor: scaffoldBackgroundColor,
          onColorChanged: onScaffoldBackgroundColorChanged,
        ),
        const SizedBox(height: 24),
        Text(
          'Surface Elevation: ${surfaceElevation.toStringAsFixed(1)}',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Slider(
          value: surfaceElevation,
          min: 0,
          max: 24,
          divisions: 24,
          label: surfaceElevation.toStringAsFixed(1),
          onChanged: onSurfaceElevationChanged,
        ),
      ],
    );
  }
}
