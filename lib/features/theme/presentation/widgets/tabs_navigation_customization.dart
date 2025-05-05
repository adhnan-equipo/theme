// lib/features/theme/presentation/widgets/tabs_navigation_customization.dart
import 'package:flutter/material.dart';

import 'custom_color_picker.dart';

class TabsNavigationCustomizationWidget extends StatelessWidget {
  // TabBar properties
  final Color? tabBarIndicatorColor;
  final Color? tabBarLabelColor;
  final Color? tabBarUnselectedLabelColor;
  final double tabBarIndicatorWeight;
  final bool tabBarIsScrollable;

  // NavigationRail properties
  final Color? navigationRailBackgroundColor;
  final Color? navigationRailSelectedIconColor;
  final Color? navigationRailUnselectedIconColor;
  final Color? navigationRailSelectedLabelColor;
  final Color? navigationRailUnselectedLabelColor;
  final Color? navigationRailIndicatorColor;
  final double navigationRailElevation;
  final double navigationRailWidth;
  final bool navigationRailLabelType;

  // Drawer properties
  final Color? drawerBackgroundColor;
  final double drawerElevation;
  final double drawerWidth;
  final double drawerBorderRadius;

  // Callbacks
  final ValueChanged<Color> onTabBarIndicatorColorChanged;
  final ValueChanged<Color> onTabBarLabelColorChanged;
  final ValueChanged<Color> onTabBarUnselectedLabelColorChanged;
  final ValueChanged<double> onTabBarIndicatorWeightChanged;
  final ValueChanged<bool> onTabBarIsScrollableChanged;

  final ValueChanged<Color> onNavigationRailBackgroundColorChanged;
  final ValueChanged<Color> onNavigationRailSelectedIconColorChanged;
  final ValueChanged<Color> onNavigationRailUnselectedIconColorChanged;
  final ValueChanged<Color> onNavigationRailSelectedLabelColorChanged;
  final ValueChanged<Color> onNavigationRailUnselectedLabelColorChanged;
  final ValueChanged<Color> onNavigationRailIndicatorColorChanged;
  final ValueChanged<double> onNavigationRailElevationChanged;
  final ValueChanged<double> onNavigationRailWidthChanged;
  final ValueChanged<bool> onNavigationRailLabelTypeChanged;

  final ValueChanged<Color> onDrawerBackgroundColorChanged;
  final ValueChanged<double> onDrawerElevationChanged;
  final ValueChanged<double> onDrawerWidthChanged;
  final ValueChanged<double> onDrawerBorderRadiusChanged;

  const TabsNavigationCustomizationWidget({
    Key? key,
    this.tabBarIndicatorColor,
    this.tabBarLabelColor,
    this.tabBarUnselectedLabelColor,
    required this.tabBarIndicatorWeight,
    required this.tabBarIsScrollable,
    this.navigationRailBackgroundColor,
    this.navigationRailSelectedIconColor,
    this.navigationRailUnselectedIconColor,
    this.navigationRailSelectedLabelColor,
    this.navigationRailUnselectedLabelColor,
    this.navigationRailIndicatorColor,
    required this.navigationRailElevation,
    required this.navigationRailWidth,
    required this.navigationRailLabelType,
    this.drawerBackgroundColor,
    required this.drawerElevation,
    required this.drawerWidth,
    required this.drawerBorderRadius,
    required this.onTabBarIndicatorColorChanged,
    required this.onTabBarLabelColorChanged,
    required this.onTabBarUnselectedLabelColorChanged,
    required this.onTabBarIndicatorWeightChanged,
    required this.onTabBarIsScrollableChanged,
    required this.onNavigationRailBackgroundColorChanged,
    required this.onNavigationRailSelectedIconColorChanged,
    required this.onNavigationRailUnselectedIconColorChanged,
    required this.onNavigationRailSelectedLabelColorChanged,
    required this.onNavigationRailUnselectedLabelColorChanged,
    required this.onNavigationRailIndicatorColorChanged,
    required this.onNavigationRailElevationChanged,
    required this.onNavigationRailWidthChanged,
    required this.onNavigationRailLabelTypeChanged,
    required this.onDrawerBackgroundColorChanged,
    required this.onDrawerElevationChanged,
    required this.onDrawerWidthChanged,
    required this.onDrawerBorderRadiusChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Get effective colors with fallbacks
    final effectiveTabBarIndicatorColor =
        tabBarIndicatorColor ?? theme.colorScheme.primary;
    final effectiveTabBarLabelColor =
        tabBarLabelColor ?? theme.colorScheme.primary;
    final effectiveTabBarUnselectedLabelColor =
        tabBarUnselectedLabelColor ??
        theme.colorScheme.onSurface.withOpacity(0.6);

    final effectiveNavRailBgColor =
        navigationRailBackgroundColor ?? theme.colorScheme.surface;
    final effectiveNavRailSelectedIconColor =
        navigationRailSelectedIconColor ?? theme.colorScheme.primary;
    final effectiveNavRailUnselectedIconColor =
        navigationRailUnselectedIconColor ??
        theme.colorScheme.onSurface.withOpacity(0.6);
    final effectiveNavRailSelectedLabelColor =
        navigationRailSelectedLabelColor ?? theme.colorScheme.primary;
    final effectiveNavRailUnselectedLabelColor =
        navigationRailUnselectedLabelColor ??
        theme.colorScheme.onSurface.withOpacity(0.6);
    final effectiveNavRailIndicatorColor =
        navigationRailIndicatorColor ??
        theme.colorScheme.primary.withOpacity(0.1);

    final effectiveDrawerBgColor =
        drawerBackgroundColor ?? theme.colorScheme.surface;

    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tabs & Navigation',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Tab bar for different navigation components
          const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'TabBar'),
              Tab(text: 'NavigationRail'),
              Tab(text: 'Drawer'),
            ],
          ),

          const SizedBox(height: 16),

          SizedBox(
            height: 450, // Fixed height for tab content
            child: TabBarView(
              children: [
                // TabBar Tab
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomColorPickerWidget(
                        title: 'Indicator Color',
                        currentColor: effectiveTabBarIndicatorColor,
                        onColorChanged: onTabBarIndicatorColorChanged,
                      ),
                      const SizedBox(height: 16),
                      CustomColorPickerWidget(
                        title: 'Label Color',
                        currentColor: effectiveTabBarLabelColor,
                        onColorChanged: onTabBarLabelColorChanged,
                      ),
                      const SizedBox(height: 16),
                      CustomColorPickerWidget(
                        title: 'Unselected Label Color',
                        currentColor: effectiveTabBarUnselectedLabelColor,
                        onColorChanged: onTabBarUnselectedLabelColorChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Indicator Weight: ${tabBarIndicatorWeight.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: tabBarIndicatorWeight,
                        min: 1,
                        max: 6,
                        divisions: 10,
                        label: tabBarIndicatorWeight.toStringAsFixed(1),
                        onChanged: onTabBarIndicatorWeightChanged,
                      ),
                      const SizedBox(height: 16),
                      SwitchListTile(
                        title: const Text('Scrollable TabBar'),
                        value: tabBarIsScrollable,
                        onChanged: onTabBarIsScrollableChanged,
                      ),
                      const SizedBox(height: 24),

                      // Preview
                      Container(
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: theme.colorScheme.outline.withOpacity(0.2),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 48,
                              child: Row(
                                children: [
                                  if (!tabBarIsScrollable)
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Spacer(),
                                          Text(
                                            'Home',
                                            style: TextStyle(
                                              color: effectiveTabBarLabelColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: tabBarIndicatorWeight,
                                            color:
                                                effectiveTabBarIndicatorColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (!tabBarIsScrollable)
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Favorites',
                                            style: TextStyle(
                                              color:
                                                  effectiveTabBarUnselectedLabelColor,
                                            ),
                                          ),
                                          SizedBox(
                                            height: tabBarIndicatorWeight,
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (!tabBarIsScrollable)
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Profile',
                                            style: TextStyle(
                                              color:
                                                  effectiveTabBarUnselectedLabelColor,
                                            ),
                                          ),
                                          SizedBox(
                                            height: tabBarIndicatorWeight,
                                          ),
                                        ],
                                      ),
                                    ),

                                  if (tabBarIsScrollable) ...[
                                    SizedBox(
                                      width: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Spacer(),
                                          Text(
                                            'Home',
                                            style: TextStyle(
                                              color: effectiveTabBarLabelColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: tabBarIndicatorWeight,
                                            color:
                                                effectiveTabBarIndicatorColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Favorites',
                                            style: TextStyle(
                                              color:
                                                  effectiveTabBarUnselectedLabelColor,
                                            ),
                                          ),
                                          SizedBox(
                                            height: tabBarIndicatorWeight,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Profile',
                                            style: TextStyle(
                                              color:
                                                  effectiveTabBarUnselectedLabelColor,
                                            ),
                                          ),
                                          SizedBox(
                                            height: tabBarIndicatorWeight,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            const Divider(height: 1),
                            Container(
                              height: 100,
                              padding: const EdgeInsets.all(16),
                              alignment: Alignment.center,
                              child: const Text('Tab Content'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // NavigationRail Tab
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomColorPickerWidget(
                        title: 'Background Color',
                        currentColor: effectiveNavRailBgColor,
                        onColorChanged: onNavigationRailBackgroundColorChanged,
                      ),
                      const SizedBox(height: 16),
                      CustomColorPickerWidget(
                        title: 'Selected Icon Color',
                        currentColor: effectiveNavRailSelectedIconColor,
                        onColorChanged:
                            onNavigationRailSelectedIconColorChanged,
                      ),
                      const SizedBox(height: 16),
                      CustomColorPickerWidget(
                        title: 'Unselected Icon Color',
                        currentColor: effectiveNavRailUnselectedIconColor,
                        onColorChanged:
                            onNavigationRailUnselectedIconColorChanged,
                      ),
                      const SizedBox(height: 16),
                      CustomColorPickerWidget(
                        title: 'Selected Label Color',
                        currentColor: effectiveNavRailSelectedLabelColor,
                        onColorChanged:
                            onNavigationRailSelectedLabelColorChanged,
                      ),
                      const SizedBox(height: 16),
                      CustomColorPickerWidget(
                        title: 'Unselected Label Color',
                        currentColor: effectiveNavRailUnselectedLabelColor,
                        onColorChanged:
                            onNavigationRailUnselectedLabelColorChanged,
                      ),
                      const SizedBox(height: 16),
                      CustomColorPickerWidget(
                        title: 'Indicator Color',
                        currentColor: effectiveNavRailIndicatorColor,
                        onColorChanged: onNavigationRailIndicatorColorChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Elevation: ${navigationRailElevation.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: navigationRailElevation,
                        min: 0,
                        max: 16,
                        divisions: 16,
                        label: navigationRailElevation.toStringAsFixed(1),
                        onChanged: onNavigationRailElevationChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Width: ${navigationRailWidth.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: navigationRailWidth,
                        min: 56,
                        max: 120,
                        divisions: 16,
                        label: navigationRailWidth.toStringAsFixed(1),
                        onChanged: onNavigationRailWidthChanged,
                      ),
                      const SizedBox(height: 16),
                      SwitchListTile(
                        title: const Text('Show Labels'),
                        value: navigationRailLabelType,
                        onChanged: onNavigationRailLabelTypeChanged,
                      ),
                      const SizedBox(height: 24),

                      // Preview
                      Center(
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: theme.colorScheme.outline.withOpacity(0.2),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              // NavigationRail
                              Container(
                                width: navigationRailWidth,
                                decoration: BoxDecoration(
                                  color: effectiveNavRailBgColor,
                                  boxShadow:
                                      navigationRailElevation > 0
                                          ? [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                0.2,
                                              ),
                                              blurRadius:
                                                  navigationRailElevation,
                                              offset: Offset(
                                                navigationRailElevation / 2,
                                                0,
                                              ),
                                            ),
                                          ]
                                          : null,
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 16),
                                    // Selected item
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: effectiveNavRailIndicatorColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.home,
                                            color:
                                                effectiveNavRailSelectedIconColor,
                                          ),
                                          if (navigationRailLabelType &&
                                              navigationRailWidth >= 80) ...[
                                            const SizedBox(width: 8),
                                            Text(
                                              'Home',
                                              style: TextStyle(
                                                color:
                                                    effectiveNavRailSelectedLabelColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    // Unselected item 1
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.favorite,
                                            color:
                                                effectiveNavRailUnselectedIconColor,
                                          ),
                                          if (navigationRailLabelType &&
                                              navigationRailWidth >= 80) ...[
                                            const SizedBox(width: 8),
                                            Text(
                                              'Favorites',
                                              style: TextStyle(
                                                color:
                                                    effectiveNavRailUnselectedLabelColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    // Unselected item 2
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.person,
                                            color:
                                                effectiveNavRailUnselectedIconColor,
                                          ),
                                          if (navigationRailLabelType &&
                                              navigationRailWidth >= 80) ...[
                                            const SizedBox(width: 8),
                                            Text(
                                              'Profile',
                                              style: TextStyle(
                                                color:
                                                    effectiveNavRailUnselectedLabelColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Content
                              Expanded(
                                child: Container(
                                  color: theme.colorScheme.background,
                                  child: const Center(
                                    child: Text('Content Area'),
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

                // Drawer Tab
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomColorPickerWidget(
                        title: 'Background Color',
                        currentColor: effectiveDrawerBgColor,
                        onColorChanged: onDrawerBackgroundColorChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Elevation: ${drawerElevation.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: drawerElevation,
                        min: 0,
                        max: 24,
                        divisions: 24,
                        label: drawerElevation.toStringAsFixed(1),
                        onChanged: onDrawerElevationChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Width: ${drawerWidth.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: drawerWidth,
                        min: 180,
                        max: 360,
                        divisions: 18,
                        label: drawerWidth.toStringAsFixed(1),
                        onChanged: onDrawerWidthChanged,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Border Radius: ${drawerBorderRadius.toStringAsFixed(1)}',
                        style: theme.textTheme.titleSmall,
                      ),
                      Slider(
                        value: drawerBorderRadius,
                        min: 0,
                        max: 32,
                        divisions: 32,
                        label: drawerBorderRadius.toStringAsFixed(1),
                        onChanged: onDrawerBorderRadiusChanged,
                      ),
                      const SizedBox(height: 24),

                      // Preview
                      Center(
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: theme.colorScheme.outline.withOpacity(0.2),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              // Drawer
                              Container(
                                width: drawerWidth > 250 ? 250 : drawerWidth,
                                decoration: BoxDecoration(
                                  color: effectiveDrawerBgColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(
                                      drawerBorderRadius,
                                    ),
                                    bottomRight: Radius.circular(
                                      drawerBorderRadius,
                                    ),
                                  ),
                                  boxShadow:
                                      drawerElevation > 0
                                          ? [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                0.2,
                                              ),
                                              blurRadius: drawerElevation,
                                              offset: Offset(
                                                drawerElevation / 2,
                                                0,
                                              ),
                                            ),
                                          ]
                                          : null,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        16,
                                        48,
                                        16,
                                        16,
                                      ),
                                      child: Text(
                                        'Drawer Header',
                                        style: theme.textTheme.titleMedium,
                                      ),
                                    ),
                                    const Divider(),
                                    ListTile(
                                      leading: Icon(
                                        Icons.home,
                                        color: theme.colorScheme.primary,
                                      ),
                                      title: const Text('Home'),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.favorite,
                                        color: theme.colorScheme.primary,
                                      ),
                                      title: const Text('Favorites'),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.settings,
                                        color: theme.colorScheme.primary,
                                      ),
                                      title: const Text('Settings'),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.help,
                                        color: theme.colorScheme.primary,
                                      ),
                                      title: const Text('Help'),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
