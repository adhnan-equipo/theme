// lib/features/theme/presentation/widgets/custom_color_picker.dart
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class CustomColorPickerWidget extends StatefulWidget {
  final Color currentColor;
  final ValueChanged<Color> onColorChanged;
  final String title;
  final bool enableOpacity;
  final bool enableShadesSelection;

  const CustomColorPickerWidget({
    Key? key,
    required this.currentColor,
    required this.onColorChanged,
    this.title = 'Select Color',
    this.enableOpacity = true,
    this.enableShadesSelection = true,
  }) : super(key: key);

  @override
  State<CustomColorPickerWidget> createState() =>
      _CustomColorPickerWidgetState();
}

class _CustomColorPickerWidgetState extends State<CustomColorPickerWidget> {
  late Color pickerColor;

  @override
  void initState() {
    super.initState();
    pickerColor = widget.currentColor;
  }

  @override
  void didUpdateWidget(covariant CustomColorPickerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentColor != widget.currentColor) {
      pickerColor = widget.currentColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Material(
              color: pickerColor,
              borderRadius: BorderRadius.circular(15),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () => _openColorPicker(context),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            OutlinedButton(
              onPressed: () => _openColorPicker(context),
              child: const Text('Change'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          '${pickerColor.red}, ${pickerColor.green}, ${pickerColor.blue}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          '#${pickerColor.value.toRadixString(16).substring(2).toUpperCase()}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Future<void> _openColorPicker(BuildContext context) async {
    final Color? result = await showColorPickerDialog(
      context,
      pickerColor,
      title: Text(widget.title, style: Theme.of(context).textTheme.titleLarge),
      width: 40,
      height: 40,
      spacing: 0,
      runSpacing: 0,
      borderRadius: 4,
      wheelDiameter: 165,
      enableOpacity: widget.enableOpacity,
      showColorCode: true,
      colorCodeHasColor: true,
      pickersEnabled: <ColorPickerType, bool>{
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },
      // Fixed the custom color swatches map
      customColorSwatchesAndNames: {
        ColorTools.createPrimarySwatch(Colors.blue): 'Material',
        ColorTools.primarySwatch(Colors.blue): 'Flutter Primary',
        ColorTools.accentSwatch(Colors.blue): 'Flutter Accent',
      },
    );

    if (result != null) {
      setState(() {
        pickerColor = result;
      });
      widget.onColorChanged(result);
    }
  }
}
