// lib/features/theme/presentation/screens/theme_settings_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/theme_bloc.dart';
import '../bloc/theme_event.dart';
import '../bloc/theme_state.dart';
import '../widgets/advanced_color_properties.dart';
import '../widgets/animation_options.dart';
import '../widgets/blend_level_slider.dart';
import '../widgets/color_scheme_selector.dart';
import '../widgets/component_styling.dart';
import '../widgets/dark_mode_options.dart';
import '../widgets/material3_options.dart';
import '../widgets/miscellaneous_options.dart';
import '../widgets/surface_customization.dart';
import '../widgets/surface_mode_selector.dart';
import '../widgets/theme_mode_selector.dart';
import '../widgets/typography_customization.dart';

class ThemeSettingsScreen extends StatefulWidget {
  const ThemeSettingsScreen({Key? key}) : super(key: key);

  @override
  State<ThemeSettingsScreen> createState() => _ThemeSettingsScreenState();
}

class _ThemeSettingsScreenState extends State<ThemeSettingsScreen> {
  final List<bool> _expandedSections = List.generate(8, (_) => true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Settings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Reset theme to defaults
              context.read<ThemeBloc>().add(ResetThemeEvent());

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Theme reset to defaults')),
              );
            },
            tooltip: 'Reset to defaults',
          ),
        ],
      ),
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final themeModel = state.themeModel;

          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              // Basic Theme Mode Section
              _buildSection(
                context: context,
                index: 0,
                title: 'Theme Mode',
                icon: Icons.brightness_medium,
                child: ThemeModeSelector(
                  selectedThemeMode: themeModel.themeMode,
                  onThemeModeChanged: (themeMode) {
                    context.read<ThemeBloc>().add(
                      ChangeThemeModeEvent(themeMode),
                    );
                  },
                ),
              ),

              const Divider(),

              // Color Scheme Section
              _buildSection(
                context: context,
                index: 1,
                title: 'Color Scheme',
                icon: Icons.palette,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ColorSchemeSelector(
                      selectedColorScheme: themeModel.colorScheme,
                      onColorSchemeChanged: (colorScheme) {
                        context.read<ThemeBloc>().add(
                          ChangeColorSchemeEvent(colorScheme),
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    AdvancedColorPropertiesWidget(
                      primaryColor:
                          themeModel.primaryColor ??
                          Theme.of(context).colorScheme.primary,
                      secondaryColor:
                          themeModel.secondaryColor ??
                          Theme.of(context).colorScheme.secondary,
                      tertiaryColor:
                          themeModel.tertiaryColor ??
                          Theme.of(context).colorScheme.tertiary,
                      onPrimaryColorChanged: (color) {
                        context.read<ThemeBloc>().add(
                          ChangePrimaryColorEvent(color),
                        );
                      },
                      onSecondaryColorChanged: (color) {
                        context.read<ThemeBloc>().add(
                          ChangeSecondaryColorEvent(color),
                        );
                      },
                      onTertiaryColorChanged: (color) {
                        context.read<ThemeBloc>().add(
                          ChangeTertiaryColorEvent(color),
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    SurfaceModeSelector(
                      selectedSurfaceMode: themeModel.surfaceMode,
                      onSurfaceModeChanged: (surfaceMode) {
                        context.read<ThemeBloc>().add(
                          ChangeSurfaceModeEvent(surfaceMode),
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    BlendLevelSlider(
                      blendLevel: themeModel.blendLevel,
                      onBlendLevelChanged: (blendLevel) {
                        context.read<ThemeBloc>().add(
                          ChangeBlendLevelEvent(blendLevel),
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    SurfaceCustomizationWidget(
                      backgroundColor:
                          themeModel.backgroundColor ??
                          Theme.of(context).colorScheme.background,
                      surfaceColor:
                          themeModel.surfaceColor ??
                          Theme.of(context).colorScheme.surface,
                      scaffoldBackgroundColor:
                          themeModel.scaffoldBackgroundColor ??
                          Theme.of(context).scaffoldBackgroundColor,
                      surfaceElevation: themeModel.surfaceElevation,
                      onBackgroundColorChanged: (color) {
                        context.read<ThemeBloc>().add(
                          ChangeBackgroundColorEvent(color),
                        );
                      },
                      onSurfaceColorChanged: (color) {
                        context.read<ThemeBloc>().add(
                          ChangeSurfaceColorEvent(color),
                        );
                      },
                      onScaffoldBackgroundColorChanged: (color) {
                        context.read<ThemeBloc>().add(
                          ChangeScaffoldBackgroundColorEvent(color),
                        );
                      },
                      onSurfaceElevationChanged: (elevation) {
                        context.read<ThemeBloc>().add(
                          ChangeSurfaceElevationEvent(elevation),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const Divider(),

              // Typography Section
              _buildSection(
                context: context,
                index: 2,
                title: 'Typography',
                icon: Icons.text_fields,
                child: TypographyCustomizationWidget(
                  fontFamily: themeModel.fontFamily,
                  textScaleFactor: themeModel.textScaleFactor,
                  useM3Typography: themeModel.useM3Typography,
                  useGoogleFonts: themeModel.useGoogleFonts,
                  titleFontWeight: themeModel.titleFontWeight,
                  bodyFontWeight: themeModel.bodyFontWeight,
                  onFontFamilyChanged: (fontFamily) {
                    context.read<ThemeBloc>().add(
                      ChangeFontFamilyEvent(fontFamily),
                    );
                  },
                  onTextScaleFactorChanged: (factor) {
                    context.read<ThemeBloc>().add(
                      ChangeTextScaleFactorEvent(factor),
                    );
                  },
                  onUseM3TypographyChanged: (useM3Typography) {
                    context.read<ThemeBloc>().add(
                      ChangeUseM3TypographyEvent(useM3Typography),
                    );
                  },
                  onUseGoogleFontsChanged: (useGoogleFonts) {
                    context.read<ThemeBloc>().add(
                      ChangeUseGoogleFontsEvent(useGoogleFonts),
                    );
                  },
                  onTitleFontWeightChanged: (weight) {
                    context.read<ThemeBloc>().add(
                      ChangeTitleFontWeightEvent(weight),
                    );
                  },
                  onBodyFontWeightChanged: (weight) {
                    context.read<ThemeBloc>().add(
                      ChangeBodyFontWeightEvent(weight),
                    );
                  },
                ),
              ),

              const Divider(),

              // Component Styling Section
              _buildSection(
                context: context,
                index: 3,
                title: 'Component Styling',
                icon: Icons.widgets,
                child: ComponentStylingWidget(
                  cardBorderRadius: themeModel.cardBorderRadius,
                  buttonBorderRadius: themeModel.buttonBorderRadius,
                  textFieldBorderRadius: themeModel.textFieldBorderRadius,
                  appBarElevation: themeModel.appBarElevation,
                  cardElevation: themeModel.cardElevation,
                  dialogElevation: themeModel.dialogElevation,
                  adaptiveStyling: themeModel.adaptiveStyling,
                  onCardBorderRadiusChanged: (radius) {
                    context.read<ThemeBloc>().add(
                      ChangeCardBorderRadiusEvent(radius),
                    );
                  },
                  onButtonBorderRadiusChanged: (radius) {
                    context.read<ThemeBloc>().add(
                      ChangeButtonBorderRadiusEvent(radius),
                    );
                  },
                  onTextFieldBorderRadiusChanged: (radius) {
                    context.read<ThemeBloc>().add(
                      ChangeTextFieldBorderRadiusEvent(radius),
                    );
                  },
                  onAppBarElevationChanged: (elevation) {
                    context.read<ThemeBloc>().add(
                      ChangeAppBarElevationEvent(elevation),
                    );
                  },
                  onCardElevationChanged: (elevation) {
                    context.read<ThemeBloc>().add(
                      ChangeCardElevationEvent(elevation),
                    );
                  },
                  onDialogElevationChanged: (elevation) {
                    context.read<ThemeBloc>().add(
                      ChangeDialogElevationEvent(elevation),
                    );
                  },
                  onAdaptiveStylingChanged: (adaptive) {
                    context.read<ThemeBloc>().add(
                      ChangeAdaptiveStylingEvent(adaptive),
                    );
                  },
                ),
              ),

              const Divider(),

              // Dark Mode Section
              _buildSection(
                context: context,
                index: 4,
                title: 'Dark Mode Options',
                icon: Icons.dark_mode,
                child: DarkModeOptionsWidget(
                  darkIsTrueBlack: themeModel.darkIsTrueBlack,
                  darkUsesLightSurface: themeModel.darkUsesLightSurface,
                  darkBlendLevel: themeModel.darkBlendLevel,
                  darkSurfaceOpacity: themeModel.darkSurfaceOpacity,
                  onDarkIsTrueBlackChanged: (value) {
                    context.read<ThemeBloc>().add(
                      ChangeDarkIsTrueBlackEvent(value),
                    );
                  },
                  onDarkUsesLightSurfaceChanged: (value) {
                    context.read<ThemeBloc>().add(
                      ChangeDarkUsesLightSurfaceEvent(value),
                    );
                  },
                  onDarkBlendLevelChanged: (value) {
                    context.read<ThemeBloc>().add(
                      ChangeDarkBlendLevelEvent(value),
                    );
                  },
                  onDarkSurfaceOpacityChanged: (value) {
                    context.read<ThemeBloc>().add(
                      ChangeDarkSurfaceOpacityEvent(value),
                    );
                  },
                ),
              ),

              const Divider(),

              // Material 3 Section
              _buildSection(
                context: context,
                index: 5,
                title: 'Material 3 Options',
                icon: Icons.design_services,
                child: Material3OptionsWidget(
                  useMaterial3: themeModel.useMaterial3,
                  swapLegacyColors: themeModel.swapLegacyColors,
                  useMaterial3ErrorColors: themeModel.useMaterial3ErrorColors,
                  adaptNavigationBar: themeModel.adaptNavigationBar,
                  tintedDisabledControls: themeModel.tintedDisabledControls,
                  onUseMaterial3Changed: (value) {
                    context.read<ThemeBloc>().add(
                      ChangeUseMaterial3Event(value),
                    );
                  },
                  onSwapLegacyColorsChanged: (value) {
                    context.read<ThemeBloc>().add(
                      ChangeSwapLegacyColorsEvent(value),
                    );
                  },
                  onUseMaterial3ErrorColorsChanged: (value) {
                    context.read<ThemeBloc>().add(
                      ChangeUseMaterial3ErrorColorsEvent(value),
                    );
                  },
                  onAdaptNavigationBarChanged: (value) {
                    context.read<ThemeBloc>().add(
                      ChangeAdaptNavigationBarEvent(value),
                    );
                  },
                  onTintedDisabledControlsChanged: (value) {
                    context.read<ThemeBloc>().add(
                      ChangeTintedDisabledControlsEvent(value),
                    );
                  },
                ),
              ),

              const Divider(),

              // Animation Section
              _buildSection(
                context: context,
                index: 6,
                title: 'Animation',
                icon: Icons.animation,
                child: AnimationOptionsWidget(
                  animationCurve: themeModel.animationCurve,
                  animationDuration: themeModel.animationDuration,
                  enableAnimations: themeModel.enableAnimations,
                  enablePageTransitions: themeModel.enablePageTransitions,
                  onAnimationCurveChanged: (curve) {
                    context.read<ThemeBloc>().add(
                      ChangeAnimationCurveEvent(curve),
                    );
                  },
                  onAnimationDurationChanged: (duration) {
                    context.read<ThemeBloc>().add(
                      ChangeAnimationDurationEvent(duration),
                    );
                  },
                  onEnableAnimationsChanged: (enable) {
                    context.read<ThemeBloc>().add(
                      ChangeEnableAnimationsEvent(enable),
                    );
                  },
                  onEnablePageTransitionsChanged: (enable) {
                    context.read<ThemeBloc>().add(
                      ChangeEnablePageTransitionsEvent(enable),
                    );
                  },
                ),
              ),

              const Divider(),

              // Miscellaneous Section
              _buildSection(
                context: context,
                index: 7,
                title: 'Miscellaneous',
                icon: Icons.more_horiz,
                child: MiscellaneousOptionsWidget(
                  tooltipsMatchBackground: themeModel.tooltipsMatchBackground,
                  transparentStatusBar: themeModel.transparentStatusBar,
                  applyElevationOverlayColor:
                      themeModel.applyElevationOverlayColor,
                  transparentNavigationBar: themeModel.transparentNavigationBar,
                  onTooltipsMatchBackgroundChanged: (value) {
                    context.read<ThemeBloc>().add(
                      ChangeTooltipsMatchBackgroundEvent(value),
                    );
                  },
                  onTransparentStatusBarChanged: (value) {
                    context.read<ThemeBloc>().add(
                      ChangeTransparentStatusBarEvent(value),
                    );
                  },
                  onApplyElevationOverlayColorChanged: (value) {
                    context.read<ThemeBloc>().add(
                      ChangeApplyElevationOverlayColorEvent(value),
                    );
                  },
                  onTransparentNavigationBarChanged: (value) {
                    context.read<ThemeBloc>().add(
                      ChangeTransparentNavigationBarEvent(value),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSection({
    required BuildContext context,
    required int index,
    required String title,
    required Widget child,
    required IconData icon,
  }) {
    return ExpansionPanelList(
      elevation: 1,
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (sectionIndex, isExpanded) {
        setState(() {
          _expandedSections[index] = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListTile(
              leading: Icon(icon),
              title: Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            );
          },
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            child: child,
          ),
          isExpanded: _expandedSections[index],
        ),
      ],
    );
  }
}
