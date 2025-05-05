// lib/features/theme/presentation/widgets/button_customization.dart
import 'package:flutter/material.dart';

import 'custom_color_picker.dart';

class ButtonCustomizationWidget extends StatelessWidget {
  // Elevated Button properties
  final Color? elevatedButtonBackgroundColor;
  final Color? elevatedButtonForegroundColor;
  final double elevatedButtonBorderRadius;
  final double elevatedButtonElevation;

  // Filled Button properties
  final Color? filledButtonBackgroundColor;
  final Color? filledButtonForegroundColor;
  final double filledButtonBorderRadius;

  // Text Button properties
  final Color? textButtonForegroundColor;
  final double textButtonBorderRadius;

  // Outlined Button properties
  final Color? outlinedButtonForegroundColor;
  final Color? outlinedButtonBorderColor;
  final double outlinedButtonBorderRadius;
  final double outlinedButtonBorderWidth;

  // FAB properties
  final Color? fabBackgroundColor;
  final Color? fabForegroundColor;
  final double fabBorderRadius;
  final double fabElevation;
  final bool fabExtended;

  // Callbacks
  final ValueChanged<Color> onElevatedButtonBackgroundColorChanged;
  final ValueChanged<Color> onElevatedButtonForegroundColorChanged;
  final ValueChanged<double> onElevatedButtonBorderRadiusChanged;
  final ValueChanged<double> onElevatedButtonElevationChanged;

  final ValueChanged<Color> onFilledButtonBackgroundColorChanged;
  final ValueChanged<Color> onFilledButtonForegroundColorChanged;
  final ValueChanged<double> onFilledButtonBorderRadiusChanged;

  final ValueChanged<Color> onTextButtonForegroundColorChanged;
  final ValueChanged<double> onTextButtonBorderRadiusChanged;

  final ValueChanged<Color> onOutlinedButtonForegroundColorChanged;
  final ValueChanged<Color> onOutlinedButtonBorderColorChanged;
  final ValueChanged<double> onOutlinedButtonBorderRadiusChanged;
  final ValueChanged<double> onOutlinedButtonBorderWidthChanged;

  final ValueChanged<Color> onFabBackgroundColorChanged;
  final ValueChanged<Color> onFabForegroundColorChanged;
  final ValueChanged<double> onFabBorderRadiusChanged;
  final ValueChanged<double> onFabElevationChanged;
  final ValueChanged<bool> onFabExtendedChanged;

  const ButtonCustomizationWidget({
    Key? key,
    this.elevatedButtonBackgroundColor,
    this.elevatedButtonForegroundColor,
    required this.elevatedButtonBorderRadius,
    required this.elevatedButtonElevation,
    this.filledButtonBackgroundColor,
    this.filledButtonForegroundColor,
    required this.filledButtonBorderRadius,
    this.textButtonForegroundColor,
    required this.textButtonBorderRadius,
    this.outlinedButtonForegroundColor,
    this.outlinedButtonBorderColor,
    required this.outlinedButtonBorderRadius,
    required this.outlinedButtonBorderWidth,
    this.fabBackgroundColor,
    this.fabForegroundColor,
    required this.fabBorderRadius,
    required this.fabElevation,
    required this.fabExtended,
    required this.onElevatedButtonBackgroundColorChanged,
    required this.onElevatedButtonForegroundColorChanged,
    required this.onElevatedButtonBorderRadiusChanged,
    required this.onElevatedButtonElevationChanged,
    required this.onFilledButtonBackgroundColorChanged,
    required this.onFilledButtonForegroundColorChanged,
    required this.onFilledButtonBorderRadiusChanged,
    required this.onTextButtonForegroundColorChanged,
    required this.onTextButtonBorderRadiusChanged,
    required this.onOutlinedButtonForegroundColorChanged,
    required this.onOutlinedButtonBorderColorChanged,
    required this.onOutlinedButtonBorderRadiusChanged,
    required this.onOutlinedButtonBorderWidthChanged,
    required this.onFabBackgroundColorChanged,
    required this.onFabForegroundColorChanged,
    required this.onFabBorderRadiusChanged,
    required this.onFabElevationChanged,
    required this.onFabExtendedChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Get effective colors with fallbacks
    final effectiveElevatedBgColor =
        elevatedButtonBackgroundColor ?? theme.colorScheme.primary;
    final effectiveElevatedFgColor =
        elevatedButtonForegroundColor ?? theme.colorScheme.onPrimary;

    final effectiveFilledBgColor =
        filledButtonBackgroundColor ?? theme.colorScheme.primary;
    final effectiveFilledFgColor =
        filledButtonForegroundColor ?? theme.colorScheme.onPrimary;

    final effectiveTextFgColor =
        textButtonForegroundColor ?? theme.colorScheme.primary;

    final effectiveOutlinedFgColor =
        outlinedButtonForegroundColor ?? theme.colorScheme.primary;
    final effectiveOutlinedBorderColor =
        outlinedButtonBorderColor ?? theme.colorScheme.outline;

    final effectiveFabBgColor =
        fabBackgroundColor ?? theme.colorScheme.primaryContainer;
    final effectiveFabFgColor =
        fabForegroundColor ?? theme.colorScheme.onPrimaryContainer;

    return DefaultTabController(
      length: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Button Customization',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Tab bar for different button types
          const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Elevated'),
              Tab(text: 'Filled'),
              Tab(text: 'Text'),
              Tab(text: 'Outlined'),
              Tab(text: 'FAB'),
            ],
          ),

          const SizedBox(height: 16),

          SizedBox(
            height: 450, // Fixed height for tab content
            child: TabBarView(
              children: [
                // Elevated Button Tab
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomColorPickerWidget(
                        title: 'Background Color',
                        currentColor: effectiveElevatedBgColor,
                        onColorChanged: onElevatedButtonBackgroundColorChanged,
                      ),
                      const SizedBox(height: 16),
                      CustomColorPickerWidget(
                        title: 'Text Color',
                        currentColor: effectiveElevatedFgColor,
                        onColorChanged: onElevatedButtonForegroundColorChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Border Radius: ${elevatedButtonBorderRadius.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: elevatedButtonBorderRadius,
                        min: 0,
                        max: 32,
                        divisions: 32,
                        label: elevatedButtonBorderRadius.toStringAsFixed(1),
                        onChanged: onElevatedButtonBorderRadiusChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Elevation: ${elevatedButtonElevation.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: elevatedButtonElevation,
                        min: 0,
                        max: 16,
                        divisions: 16,
                        label: elevatedButtonElevation.toStringAsFixed(1),
                        onChanged: onElevatedButtonElevationChanged,
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: effectiveElevatedBgColor,
                            borderRadius: BorderRadius.circular(
                              elevatedButtonBorderRadius,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: elevatedButtonElevation,
                                offset: Offset(0, elevatedButtonElevation / 2),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          child: Text(
                            'Elevated Button',
                            style: TextStyle(
                              color: effectiveElevatedFgColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Filled Button Tab
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomColorPickerWidget(
                        title: 'Background Color',
                        currentColor: effectiveFilledBgColor,
                        onColorChanged: onFilledButtonBackgroundColorChanged,
                      ),
                      const SizedBox(height: 16),
                      CustomColorPickerWidget(
                        title: 'Text Color',
                        currentColor: effectiveFilledFgColor,
                        onColorChanged: onFilledButtonForegroundColorChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Border Radius: ${filledButtonBorderRadius.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: filledButtonBorderRadius,
                        min: 0,
                        max: 32,
                        divisions: 32,
                        label: filledButtonBorderRadius.toStringAsFixed(1),
                        onChanged: onFilledButtonBorderRadiusChanged,
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: effectiveFilledBgColor,
                            borderRadius: BorderRadius.circular(
                              filledButtonBorderRadius,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          child: Text(
                            'Filled Button',
                            style: TextStyle(
                              color: effectiveFilledFgColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Text Button Tab
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomColorPickerWidget(
                        title: 'Text Color',
                        currentColor: effectiveTextFgColor,
                        onColorChanged: onTextButtonForegroundColorChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Border Radius: ${textButtonBorderRadius.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: textButtonBorderRadius,
                        min: 0,
                        max: 32,
                        divisions: 32,
                        label: textButtonBorderRadius.toStringAsFixed(1),
                        onChanged: onTextButtonBorderRadiusChanged,
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              textButtonBorderRadius,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          child: Text(
                            'Text Button',
                            style: TextStyle(
                              color: effectiveTextFgColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Outlined Button Tab
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomColorPickerWidget(
                        title: 'Text Color',
                        currentColor: effectiveOutlinedFgColor,
                        onColorChanged: onOutlinedButtonForegroundColorChanged,
                      ),
                      const SizedBox(height: 16),
                      CustomColorPickerWidget(
                        title: 'Border Color',
                        currentColor: effectiveOutlinedBorderColor,
                        onColorChanged: onOutlinedButtonBorderColorChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Border Radius: ${outlinedButtonBorderRadius.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: outlinedButtonBorderRadius,
                        min: 0,
                        max: 32,
                        divisions: 32,
                        label: outlinedButtonBorderRadius.toStringAsFixed(1),
                        onChanged: onOutlinedButtonBorderRadiusChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Border Width: ${outlinedButtonBorderWidth.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: outlinedButtonBorderWidth,
                        min: 0.5,
                        max: 4,
                        divisions: 7,
                        label: outlinedButtonBorderWidth.toStringAsFixed(1),
                        onChanged: onOutlinedButtonBorderWidthChanged,
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              outlinedButtonBorderRadius,
                            ),
                            border: Border.all(
                              color: effectiveOutlinedBorderColor,
                              width: outlinedButtonBorderWidth,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          child: Text(
                            'Outlined Button',
                            style: TextStyle(
                              color: effectiveOutlinedFgColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // FAB Tab
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomColorPickerWidget(
                        title: 'Background Color',
                        currentColor: effectiveFabBgColor,
                        onColorChanged: onFabBackgroundColorChanged,
                      ),
                      const SizedBox(height: 16),
                      CustomColorPickerWidget(
                        title: 'Icon Color',
                        currentColor: effectiveFabFgColor,
                        onColorChanged: onFabForegroundColorChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Border Radius: ${fabBorderRadius.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: fabBorderRadius,
                        min: 8,
                        max: 32,
                        divisions: 24,
                        label: fabBorderRadius.toStringAsFixed(1),
                        onChanged: onFabBorderRadiusChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Elevation: ${fabElevation.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: fabElevation,
                        min: 0,
                        max: 12,
                        divisions: 12,
                        label: fabElevation.toStringAsFixed(1),
                        onChanged: onFabElevationChanged,
                      ),
                      const SizedBox(height: 16),
                      SwitchListTile(
                        title: const Text('Extended FAB'),
                        subtitle: const Text(
                          'Show extended floating action button',
                        ),
                        value: fabExtended,
                        onChanged: onFabExtendedChanged,
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          height: fabExtended ? 56 : 56,
                          width: fabExtended ? 140 : 56,
                          decoration: BoxDecoration(
                            color: effectiveFabBgColor,
                            borderRadius: BorderRadius.circular(
                              fabBorderRadius,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: fabElevation,
                                offset: Offset(0, fabElevation / 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child:
                                fabExtended
                                    ? Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: effectiveFabFgColor,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Create',
                                          style: TextStyle(
                                            color: effectiveFabFgColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )
                                    : Icon(
                                      Icons.add,
                                      color: effectiveFabFgColor,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
