// lib/features/theme/presentation/widgets/material3_options.dart
import 'package:flutter/material.dart';

class Material3OptionsWidget extends StatelessWidget {
  final bool useMaterial3;
  final bool swapLegacyColors;
  final bool useMaterial3ErrorColors;
  final bool adaptNavigationBar;
  final bool tintedDisabledControls;
  final ValueChanged<bool> onUseMaterial3Changed;
  final ValueChanged<bool> onSwapLegacyColorsChanged;
  final ValueChanged<bool> onUseMaterial3ErrorColorsChanged;
  final ValueChanged<bool> onAdaptNavigationBarChanged;
  final ValueChanged<bool> onTintedDisabledControlsChanged;

  const Material3OptionsWidget({
    Key? key,
    required this.useMaterial3,
    required this.swapLegacyColors,
    required this.useMaterial3ErrorColors,
    required this.adaptNavigationBar,
    required this.tintedDisabledControls,
    required this.onUseMaterial3Changed,
    required this.onSwapLegacyColorsChanged,
    required this.onUseMaterial3ErrorColorsChanged,
    required this.onAdaptNavigationBarChanged,
    required this.onTintedDisabledControlsChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Material 3 Options',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        SwitchListTile(
          title: const Text('Use Material 3'),
          subtitle: const Text('Enable Material 3 design system'),
          value: useMaterial3,
          onChanged: onUseMaterial3Changed,
        ),

        SwitchListTile(
          title: const Text('Swap Legacy Colors'),
          subtitle: const Text('Swap colors to match Material 3 semantics'),
          value: swapLegacyColors,
          onChanged: onSwapLegacyColorsChanged,
        ),

        SwitchListTile(
          title: const Text('Material 3 Error Colors'),
          subtitle: const Text('Use Material 3 error color palette'),
          value: useMaterial3ErrorColors,
          onChanged: onUseMaterial3ErrorColorsChanged,
        ),

        SwitchListTile(
          title: const Text('Adapt Navigation Bar'),
          subtitle: const Text('Adapt navigation bar to platform'),
          value: adaptNavigationBar,
          onChanged: onAdaptNavigationBarChanged,
        ),

        SwitchListTile(
          title: const Text('Tinted Disabled Controls'),
          subtitle: const Text('Apply theme colors to disabled controls'),
          value: tintedDisabledControls,
          onChanged: onTintedDisabledControlsChanged,
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
                  'Material 3 Information:',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Material 3 is the latest version of Google\'s design system. It introduces a more colorful, personalized approach with updated components and interaction patterns.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
