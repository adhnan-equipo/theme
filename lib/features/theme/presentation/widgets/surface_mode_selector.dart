// lib/features/theme/presentation/widgets/surface_mode_selector.dart
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class SurfaceModeSelector extends StatelessWidget {
  final FlexSurfaceMode selectedSurfaceMode;
  final ValueChanged<FlexSurfaceMode> onSurfaceModeChanged;

  const SurfaceModeSelector({
    Key? key,
    required this.selectedSurfaceMode,
    required this.onSurfaceModeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildModeChip(
              context,
              FlexSurfaceMode.level,
              'Level',
              'Flat surface colors with no blends',
            ),
            _buildModeChip(
              context,
              FlexSurfaceMode.highBackgroundLowScaffold,
              'High Background',
              'Higher primary blend on background',
            ),
            _buildModeChip(
              context,
              FlexSurfaceMode.highSurfaceLowScaffold,
              'High Surface',
              'Higher primary blend on surface',
            ),
            _buildModeChip(
              context,
              FlexSurfaceMode.highScaffoldLowSurface,
              'High Scaffold',
              'Higher primary blend on scaffold',
            ),
            _buildModeChip(
              context,
              FlexSurfaceMode.highScaffoldLevelSurface,
              'High Scaffold Level',
              'Higher blend on scaffold, level on surface',
            ),
            _buildModeChip(
              context,
              FlexSurfaceMode.levelSurfacesLowScaffold,
              'Level Surfaces',
              'Level surface colors with low scaffold',
            ),
            _buildModeChip(
              context,
              FlexSurfaceMode.highScaffoldLowSurfaces,
              'High Scaffold Low',
              'High scaffold with low surface colors',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildModeChip(
    BuildContext context,
    FlexSurfaceMode mode,
    String label,
    String tooltip,
  ) {
    final isSelected = mode == selectedSurfaceMode;
    final theme = Theme.of(context);

    return Tooltip(
      message: tooltip,
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          if (selected) {
            onSurfaceModeChanged(mode);
          }
        },
        selectedColor: theme.colorScheme.primary,
        labelStyle: TextStyle(
          color:
              isSelected
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onSurface,
        ),
      ),
    );
  }
}
