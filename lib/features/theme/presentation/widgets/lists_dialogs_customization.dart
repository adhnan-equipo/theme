// lib/features/theme/presentation/widgets/lists_dialogs_customization.dart
import 'package:flutter/material.dart';

import 'custom_color_picker.dart';

class ListsDialogsCustomizationWidget extends StatelessWidget {
  // ListTile properties
  final Color? listTileTextColor;
  final Color? listTileSelectedColor;
  final Color? listTileIconColor;
  final double listTileHorizontalPadding;
  final double listTileVerticalPadding;
  final bool listTileDense;

  // Dialog properties
  final Color? dialogBackgroundColor;
  final double dialogElevation;
  final double dialogBorderRadius;

  // SnackBar properties
  final Color? snackBarBackgroundColor;
  final Color? snackBarTextColor;
  final Color? snackBarActionColor;
  final double snackBarBorderRadius;
  final double snackBarElevation;

  // Divider properties
  final Color? dividerColor;
  final double dividerThickness;
  final double dividerIndent;

  // Callbacks
  final ValueChanged<Color> onListTileTextColorChanged;
  final ValueChanged<Color> onListTileSelectedColorChanged;
  final ValueChanged<Color> onListTileIconColorChanged;
  final ValueChanged<double> onListTileHorizontalPaddingChanged;
  final ValueChanged<double> onListTileVerticalPaddingChanged;
  final ValueChanged<bool> onListTileDenseChanged;

  final ValueChanged<Color> onDialogBackgroundColorChanged;
  final ValueChanged<double> onDialogElevationChanged;
  final ValueChanged<double> onDialogBorderRadiusChanged;

  final ValueChanged<Color> onSnackBarBackgroundColorChanged;
  final ValueChanged<Color> onSnackBarTextColorChanged;
  final ValueChanged<Color> onSnackBarActionColorChanged;
  final ValueChanged<double> onSnackBarBorderRadiusChanged;
  final ValueChanged<double> onSnackBarElevationChanged;

  final ValueChanged<Color> onDividerColorChanged;
  final ValueChanged<double> onDividerThicknessChanged;
  final ValueChanged<double> onDividerIndentChanged;

  const ListsDialogsCustomizationWidget({
    Key? key,
    this.listTileTextColor,
    this.listTileSelectedColor,
    this.listTileIconColor,
    required this.listTileHorizontalPadding,
    required this.listTileVerticalPadding,
    required this.listTileDense,
    this.dialogBackgroundColor,
    required this.dialogElevation,
    required this.dialogBorderRadius,
    this.snackBarBackgroundColor,
    this.snackBarTextColor,
    this.snackBarActionColor,
    required this.snackBarBorderRadius,
    required this.snackBarElevation,
    this.dividerColor,
    required this.dividerThickness,
    required this.dividerIndent,
    required this.onListTileTextColorChanged,
    required this.onListTileSelectedColorChanged,
    required this.onListTileIconColorChanged,
    required this.onListTileHorizontalPaddingChanged,
    required this.onListTileVerticalPaddingChanged,
    required this.onListTileDenseChanged,
    required this.onDialogBackgroundColorChanged,
    required this.onDialogElevationChanged,
    required this.onDialogBorderRadiusChanged,
    required this.onSnackBarBackgroundColorChanged,
    required this.onSnackBarTextColorChanged,
    required this.onSnackBarActionColorChanged,
    required this.onSnackBarBorderRadiusChanged,
    required this.onSnackBarElevationChanged,
    required this.onDividerColorChanged,
    required this.onDividerThicknessChanged,
    required this.onDividerIndentChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Get effective colors with fallbacks
    final effectiveListTileTextColor =
        listTileTextColor ?? theme.colorScheme.onSurface;
    final effectiveListTileSelectedColor =
        listTileSelectedColor ?? theme.colorScheme.primary;
    final effectiveListTileIconColor =
        listTileIconColor ?? theme.colorScheme.primary;

    final effectiveDialogBackgroundColor =
        dialogBackgroundColor ?? theme.colorScheme.surface;

    final effectiveSnackBarBackgroundColor =
        snackBarBackgroundColor ??
        Color.alphaBlend(
          theme.colorScheme.onSurface.withOpacity(0.7),
          theme.colorScheme.surface,
        );
    final effectiveSnackBarTextColor =
        snackBarTextColor ?? theme.colorScheme.onInverseSurface;
    final effectiveSnackBarActionColor =
        snackBarActionColor ?? theme.colorScheme.primary;

    final effectiveDividerColor =
        dividerColor ?? theme.colorScheme.outlineVariant;

    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lists & Dialogs',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Tab bar for different components
          const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'ListTile'),
              Tab(text: 'Dialog'),
              Tab(text: 'SnackBar'),
              Tab(text: 'Divider'),
            ],
          ),

          const SizedBox(height: 16),

          SizedBox(
            height: 450, // Fixed height for tab content
            child: TabBarView(
              children: [
                // ListTile Tab
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomColorPickerWidget(
                        title: 'Text Color',
                        currentColor: effectiveListTileTextColor,
                        onColorChanged: onListTileTextColorChanged,
                      ),
                      const SizedBox(height: 16),
                      CustomColorPickerWidget(
                        title: 'Selected Color',
                        currentColor: effectiveListTileSelectedColor,
                        onColorChanged: onListTileSelectedColorChanged,
                      ),
                      const SizedBox(height: 16),
                      CustomColorPickerWidget(
                        title: 'Icon Color',
                        currentColor: effectiveListTileIconColor,
                        onColorChanged: onListTileIconColorChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Horizontal Padding: ${listTileHorizontalPadding.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: listTileHorizontalPadding,
                        min: 0,
                        max: 32,
                        divisions: 32,
                        label: listTileHorizontalPadding.toStringAsFixed(1),
                        onChanged: onListTileHorizontalPaddingChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Vertical Padding: ${listTileVerticalPadding.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: listTileVerticalPadding,
                        min: 0,
                        max: 24,
                        divisions: 24,
                        label: listTileVerticalPadding.toStringAsFixed(1),
                        onChanged: onListTileVerticalPaddingChanged,
                      ),
                      const SizedBox(height: 16),
                      SwitchListTile(
                        title: const Text('Dense ListTile'),
                        value: listTileDense,
                        onChanged: onListTileDenseChanged,
                      ),
                      const SizedBox(height: 16),

                      // Preview
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: effectiveDividerColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            // Normal ListTile
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: listTileHorizontalPadding,
                                vertical: listTileVerticalPadding,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.inbox,
                                    color: effectiveListTileIconColor,
                                    size: listTileDense ? 20 : 24,
                                  ),
                                  SizedBox(width: listTileHorizontalPadding),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Normal ListTile',
                                          style: TextStyle(
                                            color: effectiveListTileTextColor,
                                            fontSize: listTileDense ? 14 : 16,
                                          ),
                                        ),
                                        if (!listTileDense)
                                          Text(
                                            'Secondary text',
                                            style: TextStyle(
                                              color: effectiveListTileTextColor
                                                  .withOpacity(0.6),
                                              fontSize: 14,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: effectiveListTileIconColor,
                                    size: listTileDense ? 20 : 24,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: effectiveDividerColor,
                              thickness: dividerThickness,
                              indent: dividerIndent,
                              endIndent: dividerIndent,
                            ),
                            // Selected ListTile
                            Container(
                              color: effectiveListTileSelectedColor.withOpacity(
                                0.1,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: listTileHorizontalPadding,
                                vertical: listTileVerticalPadding,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: effectiveListTileSelectedColor,
                                    size: listTileDense ? 20 : 24,
                                  ),
                                  SizedBox(width: listTileHorizontalPadding),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Selected ListTile',
                                          style: TextStyle(
                                            color:
                                                effectiveListTileSelectedColor,
                                            fontSize: listTileDense ? 14 : 16,
                                          ),
                                        ),
                                        if (!listTileDense)
                                          Text(
                                            'Secondary text',
                                            style: TextStyle(
                                              color:
                                                  effectiveListTileSelectedColor
                                                      .withOpacity(0.7),
                                              fontSize: 14,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.check,
                                    color: effectiveListTileSelectedColor,
                                    size: listTileDense ? 20 : 24,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Dialog Tab
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomColorPickerWidget(
                        title: 'Background Color',
                        currentColor: effectiveDialogBackgroundColor,
                        onColorChanged: onDialogBackgroundColorChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Elevation: ${dialogElevation.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: dialogElevation,
                        min: 0,
                        max: 24,
                        divisions: 24,
                        label: dialogElevation.toStringAsFixed(1),
                        onChanged: onDialogElevationChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Border Radius: ${dialogBorderRadius.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: dialogBorderRadius,
                        min: 0,
                        max: 32,
                        divisions: 32,
                        label: dialogBorderRadius.toStringAsFixed(1),
                        onChanged: onDialogBorderRadiusChanged,
                      ),
                      const SizedBox(height: 24),

                      // Preview
                      Center(
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                            color: effectiveDialogBackgroundColor,
                            borderRadius: BorderRadius.circular(
                              dialogBorderRadius,
                            ),
                            boxShadow:
                                dialogElevation > 0
                                    ? [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: dialogElevation,
                                        offset: Offset(0, dialogElevation / 2),
                                      ),
                                    ]
                                    : null,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  24,
                                  24,
                                  24,
                                  16,
                                ),
                                child: Text(
                                  'Dialog Title',
                                  style: theme.textTheme.headlineSmall,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  24,
                                  0,
                                  24,
                                  24,
                                ),
                                child: Text(
                                  'This is a preview of how the dialog will look with your custom settings. The content, buttons and other elements will follow your theme.',
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  8,
                                  0,
                                  16,
                                  16,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: null,
                                      child: Text(
                                        'CANCEL',
                                        style: TextStyle(
                                          color: theme.colorScheme.primary,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    TextButton(
                                      onPressed: null,
                                      child: Text(
                                        'OK',
                                        style: TextStyle(
                                          color: theme.colorScheme.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // SnackBar Tab
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomColorPickerWidget(
                        title: 'Background Color',
                        currentColor: effectiveSnackBarBackgroundColor,
                        onColorChanged: onSnackBarBackgroundColorChanged,
                      ),
                      const SizedBox(height: 16),
                      CustomColorPickerWidget(
                        title: 'Text Color',
                        currentColor: effectiveSnackBarTextColor,
                        onColorChanged: onSnackBarTextColorChanged,
                      ),
                      const SizedBox(height: 16),
                      CustomColorPickerWidget(
                        title: 'Action Color',
                        currentColor: effectiveSnackBarActionColor,
                        onColorChanged: onSnackBarActionColorChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Border Radius: ${snackBarBorderRadius.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: snackBarBorderRadius,
                        min: 0,
                        max: 32,
                        divisions: 32,
                        label: snackBarBorderRadius.toStringAsFixed(1),
                        onChanged: onSnackBarBorderRadiusChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Elevation: ${snackBarElevation.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: snackBarElevation,
                        min: 0,
                        max: 12,
                        divisions: 12,
                        label: snackBarElevation.toStringAsFixed(1),
                        onChanged: onSnackBarElevationChanged,
                      ),
                      const SizedBox(height: 24),

                      // Preview
                      Center(
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                            color: effectiveSnackBarBackgroundColor,
                            borderRadius: BorderRadius.circular(
                              snackBarBorderRadius,
                            ),
                            boxShadow:
                                snackBarElevation > 0
                                    ? [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: snackBarElevation,
                                        offset: Offset(
                                          0,
                                          snackBarElevation / 2,
                                        ),
                                      ),
                                    ]
                                    : null,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'SnackBar message preview',
                                  style: TextStyle(
                                    color: effectiveSnackBarTextColor,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: null,
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(64, 36),
                                ),
                                child: Text(
                                  'ACTION',
                                  style: TextStyle(
                                    color: effectiveSnackBarActionColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Divider Tab
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomColorPickerWidget(
                        title: 'Divider Color',
                        currentColor: effectiveDividerColor,
                        onColorChanged: onDividerColorChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Thickness: ${dividerThickness.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: dividerThickness,
                        min: 0.5,
                        max: 4,
                        divisions: 7,
                        label: dividerThickness.toStringAsFixed(1),
                        onChanged: onDividerThicknessChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Indent: ${dividerIndent.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: dividerIndent,
                        min: 0,
                        max: 32,
                        divisions: 32,
                        label: dividerIndent.toStringAsFixed(1),
                        onChanged: onDividerIndentChanged,
                      ),
                      const SizedBox(height: 24),

                      // Preview
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            child: const Text('Content above divider'),
                          ),
                          Divider(
                            color: effectiveDividerColor,
                            thickness: dividerThickness,
                            indent: dividerIndent,
                            endIndent: dividerIndent,
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            child: const Text('Content below divider'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Text('Left'),
                            ),
                          ),
                          VerticalDivider(
                            color: effectiveDividerColor,
                            thickness: dividerThickness,
                            indent: dividerIndent,
                            endIndent: dividerIndent,
                            width: dividerThickness + 16,
                          ),
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Text('Right'),
                            ),
                          ),
                        ],
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
