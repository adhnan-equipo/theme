// lib/features/theme/presentation/widgets/animation_settings.dart
import 'package:flutter/material.dart';

class AnimationSettings extends StatelessWidget {
  final Curve curve;
  final Duration duration;
  final ValueChanged<Curve> onCurveChanged;
  final ValueChanged<Duration> onDurationChanged;

  const AnimationSettings({
    Key? key,
    required this.curve,
    required this.duration,
    required this.onCurveChanged,
    required this.onDurationChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCurveSelector(context),
        const SizedBox(height: 16),
        _buildDurationSelector(context),
        const SizedBox(height: 16),
        _buildAnimationPreview(context),
      ],
    );
  }

  Widget _buildCurveSelector(BuildContext context) {
    final curves = <String, Curve>{
      'Linear': Curves.linear,
      'Ease In': Curves.easeIn,
      'Ease Out': Curves.easeOut,
      'Ease In Out': Curves.easeInOut,
      'Decelerate': Curves.decelerate,
      'Fast Out Slow In': Curves.fastOutSlowIn,
      'Bounce In': Curves.bounceIn,
      'Bounce Out': Curves.bounceOut,
      'Elastic In': Curves.elasticIn,
      'Elastic Out': Curves.elasticOut,
    };

    String currentCurveName = 'Ease In Out';
    for (final entry in curves.entries) {
      if (entry.value == curve) {
        currentCurveName = entry.key;
        break;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Animation Curve', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: currentCurveName,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          items:
              curves.keys.map((name) {
                return DropdownMenuItem<String>(value: name, child: Text(name));
              }).toList(),
          onChanged: (value) {
            if (value != null && curves.containsKey(value)) {
              onCurveChanged(curves[value]!);
            }
          },
        ),
      ],
    );
  }

  Widget _buildDurationSelector(BuildContext context) {
    final durationMs = duration.inMilliseconds;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Animation Duration: ${durationMs}ms',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        Slider(
          value: durationMs.toDouble(),
          min: 100,
          max: 1000,
          divisions: 9,
          label: '${durationMs}ms',
          onChanged: (value) {
            onDurationChanged(Duration(milliseconds: value.round()));
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [Text('Fast'), Text('Medium'), Text('Slow')],
          ),
        ),
      ],
    );
  }

  Widget _buildAnimationPreview(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        icon: const Icon(Icons.play_arrow),
        label: const Text('Preview Animation'),
        onPressed: () {
          showDialog(
            context: context,
            builder:
                (context) =>
                    _AnimationPreviewDialog(curve: curve, duration: duration),
          );
        },
      ),
    );
  }
}

class _AnimationPreviewDialog extends StatefulWidget {
  final Curve curve;
  final Duration duration;

  const _AnimationPreviewDialog({
    Key? key,
    required this.curve,
    required this.duration,
  }) : super(key: key);

  @override
  State<_AnimationPreviewDialog> createState() =>
      _AnimationPreviewDialogState();
}

class _AnimationPreviewDialogState extends State<_AnimationPreviewDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);

    _slideAnimation = Tween<double>(begin: -1.0, end: 0.0).animate(_animation);

    // Start the animation automatically
    _controller.forward();

    // Loop the animation
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Animation Preview',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Curve: ${_getCurveName(widget.curve)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Duration: ${widget.duration.inMilliseconds}ms',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: 200,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Column(
                    children: [
                      LinearProgressIndicator(
                        value: _animation.value,
                        minHeight: 10,
                      ),
                      const SizedBox(height: 24),
                      Transform.scale(
                        scale: _animation.value,
                        child: const FlutterLogo(size: 80),
                      ),
                      const SizedBox(height: 24),
                      SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1.0, 0.0),
                          end: Offset.zero,
                        ).animate(_animation),
                        child: const Card(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text('Sliding Animation'),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }

  String _getCurveName(Curve curve) {
    if (curve == Curves.linear) return 'Linear';
    if (curve == Curves.easeIn) return 'Ease In';
    if (curve == Curves.easeOut) return 'Ease Out';
    if (curve == Curves.easeInOut) return 'Ease In Out';
    if (curve == Curves.decelerate) return 'Decelerate';
    if (curve == Curves.fastOutSlowIn) return 'Fast Out Slow In';
    if (curve == Curves.bounceIn) return 'Bounce In';
    if (curve == Curves.bounceOut) return 'Bounce Out';
    if (curve == Curves.elasticIn) return 'Elastic In';
    if (curve == Curves.elasticOut) return 'Elastic Out';
    return 'Custom';
  }
}
