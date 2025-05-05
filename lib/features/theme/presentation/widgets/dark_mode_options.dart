// lib/features/theme/presentation/widgets/dark_mode_options.dart
import 'package:flutter/material.dart';

class DarkModeOptionsWidget extends StatelessWidget {
  final bool darkIsTrueBlack;
  final bool darkUsesLightSurface;
  final int darkBlendLevel;
  final double darkSurfaceOpacity;
  final ValueChanged<bool> onDarkIsTrueBlackChanged;
  final ValueChanged<bool> onDarkUsesLightSurfaceChanged;
  final ValueChanged<int> onDarkBlendLevelChanged;
  final ValueChanged<double> onDarkSurfaceOpacityChanged;

  const DarkModeOptionsWidget({
    Key? key,
    required this.darkIsTrueBlack,
    required this.darkUsesLightSurface,
    required this.darkBlendLevel,
    required this.darkSurfaceOpacity,
    required this.onDarkIsTrueBlackChanged,
    required this.onDarkUsesLightSurfaceChanged,
    required this.onDarkBlendLevelChanged,
    required this.onDarkSurfaceOpacityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dark Mode Options',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        SwitchListTile(
          title: const Text('True Black'),
          subtitle: const Text('Use pure black for dark theme background'),
          value: darkIsTrueBlack,
          onChanged: onDarkIsTrueBlackChanged,
        ),

        SwitchListTile(
          title: const Text('Light Surfaces'),
          subtitle: const Text('Use lighter surfaces in dark mode'),
          value: darkUsesLightSurface,
          onChanged: onDarkUsesLightSurfaceChanged,
        ),

        const SizedBox(height: 16),

        Text(
          'Dark Blend Level: $darkBlendLevel',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Slider(
          value: darkBlendLevel.toDouble(),
          min: 0,
          max: 40,
          divisions: 40,
          label: darkBlendLevel.toString(),
          onChanged: (value) => onDarkBlendLevelChanged(value.toInt()),
        ),

        const SizedBox(height: 16),

        Text(
          'Surface Opacity: ${(darkSurfaceOpacity * 100).toInt()}%',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Slider(
          value: darkSurfaceOpacity,
          min: 0.0,
          max: 1.0,
          divisions: 20,
          label: '${(darkSurfaceOpacity * 100).toInt()}%',
          onChanged: onDarkSurfaceOpacityChanged,
        ),

        const SizedBox(height: 16),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Note:',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'These options only affect the dark theme. Switch to dark mode to see their effect.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
