// lib/features/theme/presentation/widgets/color_scheme_selector.dart
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class ColorSchemeSelector extends StatelessWidget {
  final FlexScheme selectedColorScheme;
  final ValueChanged<FlexScheme> onColorSchemeChanged;

  const ColorSchemeSelector({
    Key? key,
    required this.selectedColorScheme,
    required this.onColorSchemeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: _buildSchemeButtons(context),
        ),
        const SizedBox(height: 8),
        Text(
          selectedColorScheme.name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  List<Widget> _buildSchemeButtons(BuildContext context) {
    const schemesToShow = [
      FlexScheme.material,
      FlexScheme.materialHc,
      FlexScheme.blue,
      FlexScheme.indigo,
      FlexScheme.hippieBlue,
      FlexScheme.aquaBlue,
      FlexScheme.brandBlue,
      FlexScheme.deepBlue,
      FlexScheme.sakura,
      FlexScheme.mandyRed,
      FlexScheme.red,
      FlexScheme.redWine,
      FlexScheme.purpleBrown,
      FlexScheme.green,
      FlexScheme.money,
      FlexScheme.jungle,
      FlexScheme.greyLaw,
      FlexScheme.wasabi,
      FlexScheme.gold,
      FlexScheme.mango,
      FlexScheme.amber,
      FlexScheme.vesuviusBurn,
      FlexScheme.deepPurple,
      FlexScheme.ebonyClay,
    ];

    return schemesToShow.map((scheme) {
      final isSelected = scheme == selectedColorScheme;

      // Get the color scheme data for both light and dark variants
      final lightScheme = FlexThemeData.light(scheme: scheme).colorScheme;
      final darkScheme = FlexThemeData.dark(scheme: scheme).colorScheme;

      return InkWell(
        onTap: () => onColorSchemeChanged(scheme),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color:
                  isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
              width: 2,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [lightScheme.primary, darkScheme.primary],
              ),
            ),
          ),
        ),
      );
    }).toList();
  }
}
