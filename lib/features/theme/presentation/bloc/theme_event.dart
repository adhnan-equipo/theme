// lib/features/theme/presentation/bloc/theme_event.dart
import 'package:equatable/equatable.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class InitializeThemeEvent extends ThemeEvent {}

class ChangeThemeModeEvent extends ThemeEvent {
  final ThemeMode themeMode;

  const ChangeThemeModeEvent(this.themeMode);

  @override
  List<Object?> get props => [themeMode];
}

class ChangeColorSchemeEvent extends ThemeEvent {
  final FlexScheme colorScheme;

  const ChangeColorSchemeEvent(this.colorScheme);

  @override
  List<Object?> get props => [colorScheme];
}

class ChangeSurfaceModeEvent extends ThemeEvent {
  final FlexSurfaceMode surfaceMode;

  const ChangeSurfaceModeEvent(this.surfaceMode);

  @override
  List<Object?> get props => [surfaceMode];
}

class ChangeBlendLevelEvent extends ThemeEvent {
  final int blendLevel;

  const ChangeBlendLevelEvent(this.blendLevel);

  @override
  List<Object?> get props => [blendLevel];
}

class ChangePrimaryColorEvent extends ThemeEvent {
  final Color primaryColor;

  const ChangePrimaryColorEvent(this.primaryColor);

  @override
  List<Object?> get props => [primaryColor];
}

class ChangeSecondaryColorEvent extends ThemeEvent {
  final Color secondaryColor;

  const ChangeSecondaryColorEvent(this.secondaryColor);

  @override
  List<Object?> get props => [secondaryColor];
}

class ChangeTertiaryColorEvent extends ThemeEvent {
  final Color tertiaryColor;

  const ChangeTertiaryColorEvent(this.tertiaryColor);

  @override
  List<Object?> get props => [tertiaryColor];
}

class ChangeBackgroundColorEvent extends ThemeEvent {
  final Color backgroundColor;

  const ChangeBackgroundColorEvent(this.backgroundColor);

  @override
  List<Object?> get props => [backgroundColor];
}

class ChangeSurfaceColorEvent extends ThemeEvent {
  final Color surfaceColor;

  const ChangeSurfaceColorEvent(this.surfaceColor);

  @override
  List<Object?> get props => [surfaceColor];
}

class ChangeScaffoldBackgroundColorEvent extends ThemeEvent {
  final Color scaffoldBackgroundColor;

  const ChangeScaffoldBackgroundColorEvent(this.scaffoldBackgroundColor);

  @override
  List<Object?> get props => [scaffoldBackgroundColor];
}

class ChangeSurfaceElevationEvent extends ThemeEvent {
  final double surfaceElevation;

  const ChangeSurfaceElevationEvent(this.surfaceElevation);

  @override
  List<Object?> get props => [surfaceElevation];
}

class ChangeFontFamilyEvent extends ThemeEvent {
  final String fontFamily;

  const ChangeFontFamilyEvent(this.fontFamily);

  @override
  List<Object?> get props => [fontFamily];
}

class ChangeTextScaleFactorEvent extends ThemeEvent {
  final double textScaleFactor;

  const ChangeTextScaleFactorEvent(this.textScaleFactor);

  @override
  List<Object?> get props => [textScaleFactor];
}

class ChangeUseM3TypographyEvent extends ThemeEvent {
  final bool useM3Typography;

  const ChangeUseM3TypographyEvent(this.useM3Typography);

  @override
  List<Object?> get props => [useM3Typography];
}

class ChangeUseGoogleFontsEvent extends ThemeEvent {
  final bool useGoogleFonts;

  const ChangeUseGoogleFontsEvent(this.useGoogleFonts);

  @override
  List<Object?> get props => [useGoogleFonts];
}

class ChangeTitleFontWeightEvent extends ThemeEvent {
  final FontWeight titleFontWeight;

  const ChangeTitleFontWeightEvent(this.titleFontWeight);

  @override
  List<Object?> get props => [titleFontWeight];
}

class ChangeBodyFontWeightEvent extends ThemeEvent {
  final FontWeight bodyFontWeight;

  const ChangeBodyFontWeightEvent(this.bodyFontWeight);

  @override
  List<Object?> get props => [bodyFontWeight];
}

class ChangeBorderRadiusEvent extends ThemeEvent {
  final double borderRadius;

  const ChangeBorderRadiusEvent(this.borderRadius);

  @override
  List<Object?> get props => [borderRadius];
}

class ChangeCardBorderRadiusEvent extends ThemeEvent {
  final double cardBorderRadius;

  const ChangeCardBorderRadiusEvent(this.cardBorderRadius);

  @override
  List<Object?> get props => [cardBorderRadius];
}

class ChangeButtonBorderRadiusEvent extends ThemeEvent {
  final double buttonBorderRadius;

  const ChangeButtonBorderRadiusEvent(this.buttonBorderRadius);

  @override
  List<Object?> get props => [buttonBorderRadius];
}

class ChangeTextFieldBorderRadiusEvent extends ThemeEvent {
  final double textFieldBorderRadius;

  const ChangeTextFieldBorderRadiusEvent(this.textFieldBorderRadius);

  @override
  List<Object?> get props => [textFieldBorderRadius];
}

class ChangeAppBarElevationEvent extends ThemeEvent {
  final double appBarElevation;

  const ChangeAppBarElevationEvent(this.appBarElevation);

  @override
  List<Object?> get props => [appBarElevation];
}

class ChangeCardElevationEvent extends ThemeEvent {
  final double cardElevation;

  const ChangeCardElevationEvent(this.cardElevation);

  @override
  List<Object?> get props => [cardElevation];
}

class ChangeDialogElevationEvent extends ThemeEvent {
  final double dialogElevation;

  const ChangeDialogElevationEvent(this.dialogElevation);

  @override
  List<Object?> get props => [dialogElevation];
}

class ChangeAdaptiveStylingEvent extends ThemeEvent {
  final bool adaptiveStyling;

  const ChangeAdaptiveStylingEvent(this.adaptiveStyling);

  @override
  List<Object?> get props => [adaptiveStyling];
}

class ChangeDarkIsTrueBlackEvent extends ThemeEvent {
  final bool darkIsTrueBlack;

  const ChangeDarkIsTrueBlackEvent(this.darkIsTrueBlack);

  @override
  List<Object?> get props => [darkIsTrueBlack];
}

class ChangeDarkUsesLightSurfaceEvent extends ThemeEvent {
  final bool darkUsesLightSurface;

  const ChangeDarkUsesLightSurfaceEvent(this.darkUsesLightSurface);

  @override
  List<Object?> get props => [darkUsesLightSurface];
}

class ChangeDarkBlendLevelEvent extends ThemeEvent {
  final int darkBlendLevel;

  const ChangeDarkBlendLevelEvent(this.darkBlendLevel);

  @override
  List<Object?> get props => [darkBlendLevel];
}

class ChangeDarkSurfaceOpacityEvent extends ThemeEvent {
  final double darkSurfaceOpacity;

  const ChangeDarkSurfaceOpacityEvent(this.darkSurfaceOpacity);

  @override
  List<Object?> get props => [darkSurfaceOpacity];
}

class ChangeUseMaterial3Event extends ThemeEvent {
  final bool useMaterial3;

  const ChangeUseMaterial3Event(this.useMaterial3);

  @override
  List<Object?> get props => [useMaterial3];
}

class ChangeSwapLegacyColorsEvent extends ThemeEvent {
  final bool swapLegacyColors;

  const ChangeSwapLegacyColorsEvent(this.swapLegacyColors);

  @override
  List<Object?> get props => [swapLegacyColors];
}

class ChangeUseMaterial3ErrorColorsEvent extends ThemeEvent {
  final bool useMaterial3ErrorColors;

  const ChangeUseMaterial3ErrorColorsEvent(this.useMaterial3ErrorColors);

  @override
  List<Object?> get props => [useMaterial3ErrorColors];
}

class ChangeAdaptNavigationBarEvent extends ThemeEvent {
  final bool adaptNavigationBar;

  const ChangeAdaptNavigationBarEvent(this.adaptNavigationBar);

  @override
  List<Object?> get props => [adaptNavigationBar];
}

class ChangeTintedDisabledControlsEvent extends ThemeEvent {
  final bool tintedDisabledControls;

  const ChangeTintedDisabledControlsEvent(this.tintedDisabledControls);

  @override
  List<Object?> get props => [tintedDisabledControls];
}

class ChangeAnimationCurveEvent extends ThemeEvent {
  final Curve animationCurve;

  const ChangeAnimationCurveEvent(this.animationCurve);

  @override
  List<Object?> get props => [animationCurve];
}

class ChangeAnimationDurationEvent extends ThemeEvent {
  final Duration animationDuration;

  const ChangeAnimationDurationEvent(this.animationDuration);

  @override
  List<Object?> get props => [animationDuration];
}

class ChangeEnableAnimationsEvent extends ThemeEvent {
  final bool enableAnimations;

  const ChangeEnableAnimationsEvent(this.enableAnimations);

  @override
  List<Object?> get props => [enableAnimations];
}

class ChangeEnablePageTransitionsEvent extends ThemeEvent {
  final bool enablePageTransitions;

  const ChangeEnablePageTransitionsEvent(this.enablePageTransitions);

  @override
  List<Object?> get props => [enablePageTransitions];
}

class ChangeTooltipsMatchBackgroundEvent extends ThemeEvent {
  final bool tooltipsMatchBackground;

  const ChangeTooltipsMatchBackgroundEvent(this.tooltipsMatchBackground);

  @override
  List<Object?> get props => [tooltipsMatchBackground];
}

class ChangeTransparentStatusBarEvent extends ThemeEvent {
  final bool transparentStatusBar;

  const ChangeTransparentStatusBarEvent(this.transparentStatusBar);

  @override
  List<Object?> get props => [transparentStatusBar];
}

class ChangeApplyElevationOverlayColorEvent extends ThemeEvent {
  final bool applyElevationOverlayColor;

  const ChangeApplyElevationOverlayColorEvent(this.applyElevationOverlayColor);

  @override
  List<Object?> get props => [applyElevationOverlayColor];
}

class ChangeTransparentNavigationBarEvent extends ThemeEvent {
  final bool transparentNavigationBar;

  const ChangeTransparentNavigationBarEvent(this.transparentNavigationBar);

  @override
  List<Object?> get props => [transparentNavigationBar];
}

class ResetThemeEvent extends ThemeEvent {}
