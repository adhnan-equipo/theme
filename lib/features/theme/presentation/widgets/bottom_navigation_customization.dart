// lib/features/theme/presentation/widgets/bottom_navigation_customization.dart
import 'package:flutter/material.dart';

import 'custom_color_picker.dart';

class BottomNavigationCustomizationWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final double elevation;
  final bool showSelectedLabels;
  final bool showUnselectedLabels;
  final ValueChanged<Color> onBackgroundColorChanged;
  final ValueChanged<Color> onSelectedItemColorChanged;
  final ValueChanged<Color> onUnselectedItemColorChanged;
  final ValueChanged<double> onElevationChanged;
  final ValueChanged<bool> onShowSelectedLabelsChanged;
  final ValueChanged<bool> onShowUnselectedLabelsChanged;

  const BottomNavigationCustomizationWidget({
    Key? key,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    required this.elevation,
    required this.showSelectedLabels,
    required this.showUnselectedLabels,
    required this.onBackgroundColorChanged,
    required this.onSelectedItemColorChanged,
    required this.onUnselectedItemColorChanged,
    required this.onElevationChanged,
    required this.onShowSelectedLabelsChanged,
    required this.onShowUnselectedLabelsChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBackgroundColor =
        backgroundColor ?? theme.colorScheme.surface;
    final effectiveSelectedItemColor =
        selectedItemColor ?? theme.colorScheme.primary;
    final effectiveUnselectedItemColor =
        unselectedItemColor ?? theme.colorScheme.onSurface.withOpacity(0.6);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bottom Navigation',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        // Background Color
        CustomColorPickerWidget(
          title: 'Background Color',
          currentColor: effectiveBackgroundColor,
          onColorChanged: onBackgroundColorChanged,
        ),

        const SizedBox(height: 16),

        // Selected Item Color
        CustomColorPickerWidget(
          title: 'Selected Item Color',
          currentColor: effectiveSelectedItemColor,
          onColorChanged: onSelectedItemColorChanged,
        ),

        const SizedBox(height: 16),

        // Unselected Item Color
        CustomColorPickerWidget(
          title: 'Unselected Item Color',
          currentColor: effectiveUnselectedItemColor,
          onColorChanged: onUnselectedItemColorChanged,
        ),

        const SizedBox(height: 16),

        // Elevation Slider
        Text(
          'Elevation: ${elevation.toStringAsFixed(1)}',
          style: theme.textTheme.titleSmall,
        ),
        Slider(
          value: elevation,
          min: 0.0,
          max: 16.0,
          divisions: 16,
          label: elevation.toStringAsFixed(1),
          onChanged: onElevationChanged,
        ),

        // Label options
        SwitchListTile(
          title: const Text('Show Selected Labels'),
          value: showSelectedLabels,
          onChanged: onShowSelectedLabelsChanged,
        ),

        SwitchListTile(
          title: const Text('Show Unselected Labels'),
          value: showUnselectedLabels,
          onChanged: onShowUnselectedLabelsChanged,
        ),

        // Preview
        const SizedBox(height: 16),
        Text('Preview:', style: theme.textTheme.titleSmall),
        const SizedBox(height: 8),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: effectiveBackgroundColor,
            boxShadow:
                elevation > 0
                    ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: elevation,
                        offset: const Offset(0, -1),
                      ),
                    ]
                    : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.home,
                label: 'Home',
                isSelected: true,
                selectedColor: effectiveSelectedItemColor,
                unselectedColor: effectiveUnselectedItemColor,
                showSelectedLabels: showSelectedLabels,
                showUnselectedLabels: showUnselectedLabels,
              ),
              _buildNavItem(
                icon: Icons.favorite,
                label: 'Favorites',
                isSelected: false,
                selectedColor: effectiveSelectedItemColor,
                unselectedColor: effectiveUnselectedItemColor,
                showSelectedLabels: showSelectedLabels,
                showUnselectedLabels: showUnselectedLabels,
              ),
              _buildNavItem(
                icon: Icons.person,
                label: 'Profile',
                isSelected: false,
                selectedColor: effectiveSelectedItemColor,
                unselectedColor: effectiveUnselectedItemColor,
                showSelectedLabels: showSelectedLabels,
                showUnselectedLabels: showUnselectedLabels,
              ),
              _buildNavItem(
                icon: Icons.settings,
                label: 'Settings',
                isSelected: false,
                selectedColor: effectiveSelectedItemColor,
                unselectedColor: effectiveUnselectedItemColor,
                showSelectedLabels: showSelectedLabels,
                showUnselectedLabels: showUnselectedLabels,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required Color selectedColor,
    required Color unselectedColor,
    required bool showSelectedLabels,
    required bool showUnselectedLabels,
  }) {
    final Color color = isSelected ? selectedColor : unselectedColor;
    final bool showLabel =
        isSelected ? showSelectedLabels : showUnselectedLabels;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        if (showLabel)
          Text(label, style: TextStyle(color: color, fontSize: 12)),
      ],
    );
  }
}
