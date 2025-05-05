// lib/features/theme/presentation/widgets/input_controls_customization.dart
import 'package:flutter/material.dart';

import 'custom_color_picker.dart';

class InputControlsCustomizationWidget extends StatelessWidget {
  // TextField properties
  final Color? textFieldFillColor;
  final Color? textFieldBorderColor;
  final Color? textFieldFocusedBorderColor;
  final Color? textFieldLabelColor;
  final double textFieldBorderRadius;
  final double textFieldBorderWidth;
  final double textFieldFocusedBorderWidth;
  final bool textFieldIsFilled;
  final bool textFieldIsDense;

  // Checkbox properties
  final Color? checkboxFillColor;
  final Color? checkboxCheckColor;
  final double checkboxBorderWidth;
  final bool checkboxIsCircular;

  // Radio properties
  final Color? radioFillColor;
  final double radioSize;

  // Switch properties
  final Color? switchThumbColor;
  final Color? switchTrackColor;
  final Color? switchActiveTrackColor;
  final bool switchIsMaterial3;

  // Callbacks
  final ValueChanged<Color> onTextFieldFillColorChanged;
  final ValueChanged<Color> onTextFieldBorderColorChanged;
  final ValueChanged<Color> onTextFieldFocusedBorderColorChanged;
  final ValueChanged<Color> onTextFieldLabelColorChanged;
  final ValueChanged<double> onTextFieldBorderRadiusChanged;
  final ValueChanged<double> onTextFieldBorderWidthChanged;
  final ValueChanged<double> onTextFieldFocusedBorderWidthChanged;
  final ValueChanged<bool> onTextFieldIsFilledChanged;
  final ValueChanged<bool> onTextFieldIsDenseChanged;

  final ValueChanged<Color> onCheckboxFillColorChanged;
  final ValueChanged<Color> onCheckboxCheckColorChanged;
  final ValueChanged<double> onCheckboxBorderWidthChanged;
  final ValueChanged<bool> onCheckboxIsCircularChanged;

  final ValueChanged<Color> onRadioFillColorChanged;
  final ValueChanged<double> onRadioSizeChanged;

  final ValueChanged<Color> onSwitchThumbColorChanged;
  final ValueChanged<Color> onSwitchTrackColorChanged;
  final ValueChanged<Color> onSwitchActiveTrackColorChanged;
  final ValueChanged<bool> onSwitchIsMaterial3Changed;

  const InputControlsCustomizationWidget({
    Key? key,
    this.textFieldFillColor,
    this.textFieldBorderColor,
    this.textFieldFocusedBorderColor,
    this.textFieldLabelColor,
    required this.textFieldBorderRadius,
    required this.textFieldBorderWidth,
    required this.textFieldFocusedBorderWidth,
    required this.textFieldIsFilled,
    required this.textFieldIsDense,
    this.checkboxFillColor,
    this.checkboxCheckColor,
    required this.checkboxBorderWidth,
    required this.checkboxIsCircular,
    this.radioFillColor,
    required this.radioSize,
    this.switchThumbColor,
    this.switchTrackColor,
    this.switchActiveTrackColor,
    required this.switchIsMaterial3,
    required this.onTextFieldFillColorChanged,
    required this.onTextFieldBorderColorChanged,
    required this.onTextFieldFocusedBorderColorChanged,
    required this.onTextFieldLabelColorChanged,
    required this.onTextFieldBorderRadiusChanged,
    required this.onTextFieldBorderWidthChanged,
    required this.onTextFieldFocusedBorderWidthChanged,
    required this.onTextFieldIsFilledChanged,
    required this.onTextFieldIsDenseChanged,
    required this.onCheckboxFillColorChanged,
    required this.onCheckboxCheckColorChanged,
    required this.onCheckboxBorderWidthChanged,
    required this.onCheckboxIsCircularChanged,
    required this.onRadioFillColorChanged,
    required this.onRadioSizeChanged,
    required this.onSwitchThumbColorChanged,
    required this.onSwitchTrackColorChanged,
    required this.onSwitchActiveTrackColorChanged,
    required this.onSwitchIsMaterial3Changed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Get effective colors with fallbacks
    final effectiveTextFieldFillColor =
        textFieldFillColor ?? theme.colorScheme.surfaceContainer;
    final effectiveTextFieldBorderColor =
        textFieldBorderColor ?? theme.colorScheme.outline;
    final effectiveTextFieldFocusedBorderColor =
        textFieldFocusedBorderColor ?? theme.colorScheme.primary;
    final effectiveTextFieldLabelColor =
        textFieldLabelColor ?? theme.colorScheme.onSurface;

    final effectiveCheckboxFillColor =
        checkboxFillColor ?? theme.colorScheme.primary;
    final effectiveCheckboxCheckColor =
        checkboxCheckColor ?? theme.colorScheme.onPrimary;

    final effectiveRadioFillColor = radioFillColor ?? theme.colorScheme.primary;

    final effectiveSwitchThumbColor =
        switchThumbColor ?? theme.colorScheme.onPrimary;
    final effectiveSwitchTrackColor =
        switchTrackColor ?? theme.colorScheme.surfaceContainer;
    final effectiveSwitchActiveTrackColor =
        switchActiveTrackColor ?? theme.colorScheme.primary;

    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Input Controls',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Tab bar for different input types
          const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'TextField'),
              Tab(text: 'Checkbox'),
              Tab(text: 'Radio'),
              Tab(text: 'Switch'),
            ],
          ),

          const SizedBox(height: 16),

          SizedBox(
            height: 450, // Fixed height for tab content
            child: TabBarView(
              children: [
                // TextField Tab
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomColorPickerWidget(
                        title: 'Fill Color',
                        currentColor: effectiveTextFieldFillColor,
                        onColorChanged: onTextFieldFillColorChanged,
                      ),
                      const SizedBox(height: 16),
                      CustomColorPickerWidget(
                        title: 'Border Color',
                        currentColor: effectiveTextFieldBorderColor,
                        onColorChanged: onTextFieldBorderColorChanged,
                      ),
                      const SizedBox(height: 16),
                      CustomColorPickerWidget(
                        title: 'Focused Border Color',
                        currentColor: effectiveTextFieldFocusedBorderColor,
                        onColorChanged: onTextFieldFocusedBorderColorChanged,
                      ),
                      const SizedBox(height: 16),
                      CustomColorPickerWidget(
                        title: 'Label Color',
                        currentColor: effectiveTextFieldLabelColor,
                        onColorChanged: onTextFieldLabelColorChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Border Radius: ${textFieldBorderRadius.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: textFieldBorderRadius,
                        min: 0,
                        max: 32,
                        divisions: 32,
                        label: textFieldBorderRadius.toStringAsFixed(1),
                        onChanged: onTextFieldBorderRadiusChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Border Width: ${textFieldBorderWidth.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: textFieldBorderWidth,
                        min: 0.5,
                        max: 4,
                        divisions: 7,
                        label: textFieldBorderWidth.toStringAsFixed(1),
                        onChanged: onTextFieldBorderWidthChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Focused Border Width: ${textFieldFocusedBorderWidth.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: textFieldFocusedBorderWidth,
                        min: 1,
                        max: 4,
                        divisions: 6,
                        label: textFieldFocusedBorderWidth.toStringAsFixed(1),
                        onChanged: onTextFieldFocusedBorderWidthChanged,
                      ),
                      const SizedBox(height: 16),
                      SwitchListTile(
                        title: const Text('Filled TextField'),
                        value: textFieldIsFilled,
                        onChanged: onTextFieldIsFilledChanged,
                      ),
                      SwitchListTile(
                        title: const Text('Dense TextField'),
                        value: textFieldIsDense,
                        onChanged: onTextFieldIsDenseChanged,
                      ),
                      const SizedBox(height: 16),

                      // Preview
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            textFieldBorderRadius,
                          ),
                          border: Border.all(
                            color: effectiveTextFieldBorderColor,
                            width: textFieldBorderWidth,
                          ),
                          color:
                              textFieldIsFilled
                                  ? effectiveTextFieldFillColor
                                  : Colors.transparent,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: textFieldIsDense ? 8 : 16,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Username',
                                    style: TextStyle(
                                      color: effectiveTextFieldLabelColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text('johndoe'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            textFieldBorderRadius,
                          ),
                          border: Border.all(
                            color: effectiveTextFieldFocusedBorderColor,
                            width: textFieldFocusedBorderWidth,
                          ),
                          color:
                              textFieldIsFilled
                                  ? effectiveTextFieldFillColor
                                  : Colors.transparent,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: textFieldIsDense ? 8 : 16,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Password',
                                    style: TextStyle(
                                      color:
                                          effectiveTextFieldFocusedBorderColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text('********'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Checkbox Tab
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomColorPickerWidget(
                        title: 'Fill Color',
                        currentColor: effectiveCheckboxFillColor,
                        onColorChanged: onCheckboxFillColorChanged,
                      ),
                      const SizedBox(height: 16),
                      CustomColorPickerWidget(
                        title: 'Check Color',
                        currentColor: effectiveCheckboxCheckColor,
                        onColorChanged: onCheckboxCheckColorChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Border Width: ${checkboxBorderWidth.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: checkboxBorderWidth,
                        min: 1,
                        max: 4,
                        divisions: 6,
                        label: checkboxBorderWidth.toStringAsFixed(1),
                        onChanged: onCheckboxBorderWidthChanged,
                      ),
                      const SizedBox(height: 16),
                      SwitchListTile(
                        title: const Text('Circular Checkbox'),
                        value: checkboxIsCircular,
                        onChanged: onCheckboxIsCircularChanged,
                      ),
                      const SizedBox(height: 32),

                      // Preview
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Unchecked
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                checkboxIsCircular ? 12 : 2,
                              ),
                              border: Border.all(
                                color: effectiveCheckboxFillColor,
                                width: checkboxBorderWidth,
                              ),
                            ),
                          ),
                          const SizedBox(width: 32),
                          // Checked
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                checkboxIsCircular ? 12 : 2,
                              ),
                              color: effectiveCheckboxFillColor,
                            ),
                            child: Icon(
                              checkboxIsCircular ? Icons.circle : Icons.check,
                              size: 18,
                              color: effectiveCheckboxCheckColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      const Center(child: Text('Checkbox Preview')),
                    ],
                  ),
                ),

                // Radio Tab
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomColorPickerWidget(
                        title: 'Fill Color',
                        currentColor: effectiveRadioFillColor,
                        onColorChanged: onRadioFillColorChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Size: ${radioSize.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: radioSize,
                        min: 16,
                        max: 32,
                        divisions: 16,
                        label: radioSize.toStringAsFixed(1),
                        onChanged: onRadioSizeChanged,
                      ),
                      const SizedBox(height: 32),

                      // Preview
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Unselected
                          Container(
                            width: radioSize,
                            height: radioSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: effectiveRadioFillColor,
                                width: 2,
                              ),
                            ),
                          ),
                          const SizedBox(width: 32),
                          // Selected
                          Container(
                            width: radioSize,
                            height: radioSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: effectiveRadioFillColor,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Container(
                                width: radioSize / 2,
                                height: radioSize / 2,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: effectiveRadioFillColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      const Center(child: Text('Radio Button Preview')),
                    ],
                  ),
                ),

                // Switch Tab
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomColorPickerWidget(
                        title: 'Thumb Color',
                        currentColor: effectiveSwitchThumbColor,
                        onColorChanged: onSwitchThumbColorChanged,
                      ),
                      const SizedBox(height: 16),
                      CustomColorPickerWidget(
                        title: 'Track Color',
                        currentColor: effectiveSwitchTrackColor,
                        onColorChanged: onSwitchTrackColorChanged,
                      ),
                      const SizedBox(height: 16),
                      CustomColorPickerWidget(
                        title: 'Active Track Color',
                        currentColor: effectiveSwitchActiveTrackColor,
                        onColorChanged: onSwitchActiveTrackColorChanged,
                      ),
                      const SizedBox(height: 16),
                      SwitchListTile(
                        title: const Text('Material 3 Style'),
                        value: switchIsMaterial3,
                        onChanged: onSwitchIsMaterial3Changed,
                      ),
                      const SizedBox(height: 32),

                      // Preview
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Off
                          Container(
                            width: 60,
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: effectiveSwitchTrackColor,
                            ),
                            padding: const EdgeInsets.all(2),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: effectiveSwitchThumbColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 2,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 32),
                          // On
                          Container(
                            width: 60,
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: effectiveSwitchActiveTrackColor,
                            ),
                            padding: const EdgeInsets.all(2),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: effectiveSwitchThumbColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 2,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (switchIsMaterial3) ...[
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // M3 Off
                            Container(
                              width: 60,
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: effectiveSwitchTrackColor.withOpacity(
                                    0.6,
                                  ),
                                  width: 2,
                                ),
                                color: Colors.transparent,
                              ),
                              padding: const EdgeInsets.all(2),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: effectiveSwitchThumbColor,
                                    border: Border.all(
                                      color: effectiveSwitchTrackColor
                                          .withOpacity(0.6),
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 32),
                            // M3 On
                            Container(
                              width: 60,
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: effectiveSwitchActiveTrackColor
                                    .withOpacity(0.5),
                              ),
                              padding: const EdgeInsets.all(2),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: effectiveSwitchActiveTrackColor,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Center(child: Text('Material 3 Style')),
                      ],
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
