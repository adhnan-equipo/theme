// lib/features/theme/presentation/widgets/border_radius_slider.dart
import 'package:flutter/material.dart';

class BorderRadiusSlider extends StatefulWidget {
  final double borderRadius;
  final ValueChanged<double> onBorderRadiusChanged;
  
  const BorderRadiusSlider({
    Key? key,
    required this.borderRadius,
    required this.onBorderRadiusChanged,
  }) : super(key: key);
  
  @override
  State<BorderRadiusSlider> createState() => _BorderRadiusSliderState();
}

class _BorderRadiusSliderState extends State<BorderRadiusSlider> {
  late double _value;
  
  @override
  void initState() {
    super.initState();
    _value = widget.borderRadius;
  }
  
  @override
  void didUpdateWidget(covariant BorderRadiusSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.borderRadius != widget.borderRadius) {
      _value = widget.borderRadius;
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
                max: 32,
                divisions: 32,
                label: _value.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
                onChangeEnd: (value) {
                  widget.onBorderRadiusChanged(value);
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
            children: const [
              Text('Square'),
              Text('Rounded'),
              Text('Circular'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildRadiusPreview(4),
            _buildRadiusPreview(8),
            _buildRadiusPreview(16),
            _buildRadiusPreview(24),
            _buildRadiusPreview(32),
          ],
        ),
      ],
    );
  }
  
  Widget _buildRadiusPreview(double radius) {
    final isSelected = (_value.round() == radius.round());
    
    return Column(
      children: [
        InkWell(
          onTap: () => widget.onBorderRadiusChanged(radius),
          child: Container(
            width: 60,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(radius),
              border: isSelected 
                  ? Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 2,
                    )
                  : null,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text('${radius.round()}'),
      ],
    );
  }
}