// lib/features/theme/presentation/widgets/component_styling.dart
import 'package:flutter/material.dart';

class ComponentStylingWidget extends StatelessWidget {
  final double cardBorderRadius;
  final double buttonBorderRadius;
  final double textFieldBorderRadius;
  final double appBarElevation;
  final double cardElevation;
  final double dialogElevation;
  final bool adaptiveStyling;
  final ValueChanged<double> onCardBorderRadiusChanged;
  final ValueChanged<double> onButtonBorderRadiusChanged;
  final ValueChanged<double> onTextFieldBorderRadiusChanged;
  final ValueChanged<double> onAppBarElevationChanged;
  final ValueChanged<double> onCardElevationChanged;
  final ValueChanged<double> onDialogElevationChanged;
  final ValueChanged<bool> onAdaptiveStylingChanged;

  const ComponentStylingWidget({
    Key? key,
    required this.cardBorderRadius,
    required this.buttonBorderRadius,
    required this.textFieldBorderRadius,
    required this.appBarElevation,
    required this.cardElevation,
    required this.dialogElevation,
    required this.adaptiveStyling,
    required this.onCardBorderRadiusChanged,
    required this.onButtonBorderRadiusChanged,
    required this.onTextFieldBorderRadiusChanged,
    required this.onAppBarElevationChanged,
    required this.onCardElevationChanged,
    required this.onDialogElevationChanged,
    required this.onAdaptiveStylingChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Component Styling',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        // Border Radius Section
        Text('Border Radius', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        _buildSliderWithLabel(
          context,
          'Cards: ${cardBorderRadius.toStringAsFixed(1)}',
          cardBorderRadius,
          0,
          32,
          onCardBorderRadiusChanged,
        ),
        _buildSliderWithLabel(
          context,
          'Buttons: ${buttonBorderRadius.toStringAsFixed(1)}',
          buttonBorderRadius,
          0,
          32,
          onButtonBorderRadiusChanged,
        ),
        _buildSliderWithLabel(
          context,
          'Text Fields: ${textFieldBorderRadius.toStringAsFixed(1)}',
          textFieldBorderRadius,
          0,
          32,
          onTextFieldBorderRadiusChanged,
        ),

        const SizedBox(height: 24),

        // Elevation Section
        Text('Elevation', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        _buildSliderWithLabel(
          context,
          'App Bar: ${appBarElevation.toStringAsFixed(1)}',
          appBarElevation,
          0,
          16,
          onAppBarElevationChanged,
        ),
        _buildSliderWithLabel(
          context,
          'Cards: ${cardElevation.toStringAsFixed(1)}',
          cardElevation,
          0,
          16,
          onCardElevationChanged,
        ),
        _buildSliderWithLabel(
          context,
          'Dialogs: ${dialogElevation.toStringAsFixed(1)}',
          dialogElevation,
          0,
          24,
          onDialogElevationChanged,
        ),

        const SizedBox(height: 16),

        // Platform Adaptation
        SwitchListTile(
          title: const Text('Platform Adaptive Styling'),
          subtitle: const Text(
            'Adjust styling based on platform (iOS/Android)',
          ),
          value: adaptiveStyling,
          onChanged: onAdaptiveStylingChanged,
        ),
      ],
    );
  }

  Widget _buildSliderWithLabel(
    BuildContext context,
    String label,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: max.toInt(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
