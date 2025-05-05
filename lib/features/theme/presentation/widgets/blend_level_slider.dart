// lib/features/theme/presentation/widgets/blend_level_slider.dart
import 'package:flutter/material.dart';

class BlendLevelSlider extends StatefulWidget {
  final int blendLevel;
  final ValueChanged<int> onBlendLevelChanged;

  const BlendLevelSlider({
    Key? key,
    required this.blendLevel,
    required this.onBlendLevelChanged,
  }) : super(key: key);

  @override
  State<BlendLevelSlider> createState() => _BlendLevelSliderState();
}

class _BlendLevelSliderState extends State<BlendLevelSlider> {
  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.blendLevel.toDouble();
  }

  @override
  void didUpdateWidget(covariant BlendLevelSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.blendLevel != widget.blendLevel) {
      _value = widget.blendLevel.toDouble();
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
              child: Slider(
                value: _value,
                min: 0,
                max: 40,
                divisions: 40,
                label: _value.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
                onChangeEnd: (value) {
                  widget.onBlendLevelChanged(value.round());
                },
              ),
            ),
            SizedBox(
              width: 48,
              child: Text(
                '${_value.round()}',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('None'),
              const Text('Low'),
              const Text('Medium'),
              const Text('High'),
              const Text('Max'),
            ],
          ),
        ),
      ],
    );
  }
}
