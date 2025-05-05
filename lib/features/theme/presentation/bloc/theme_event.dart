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

class ChangeAppBarBackgroundColorEvent extends ThemeEvent {
  final Color appBarBackgroundColor;

  const ChangeAppBarBackgroundColorEvent(this.appBarBackgroundColor);

  @override
  List<Object?> get props => [appBarBackgroundColor];
}

class ChangeAppBarForegroundColorEvent extends ThemeEvent {
  final Color appBarForegroundColor;

  const ChangeAppBarForegroundColorEvent(this.appBarForegroundColor);

  @override
  List<Object?> get props => [appBarForegroundColor];
}

class ChangeAppBarCenterTitleEvent extends ThemeEvent {
  final bool appBarCenterTitle;

  const ChangeAppBarCenterTitleEvent(this.appBarCenterTitle);

  @override
  List<Object?> get props => [appBarCenterTitle];
}

// Icon Theming Events
class ChangePrimaryIconColorEvent extends ThemeEvent {
  final Color primaryIconColor;

  const ChangePrimaryIconColorEvent(this.primaryIconColor);

  @override
  List<Object?> get props => [primaryIconColor];
}

class ChangeAppBarIconColorEvent extends ThemeEvent {
  final Color appBarIconColor;

  const ChangeAppBarIconColorEvent(this.appBarIconColor);

  @override
  List<Object?> get props => [appBarIconColor];
}

class ChangeIconSizeEvent extends ThemeEvent {
  final double iconSize;

  const ChangeIconSizeEvent(this.iconSize);

  @override
  List<Object?> get props => [iconSize];
}

// Bottom Navigation Events
class ChangeBottomNavBackgroundColorEvent extends ThemeEvent {
  final Color bottomNavBackgroundColor;

  const ChangeBottomNavBackgroundColorEvent(this.bottomNavBackgroundColor);

  @override
  List<Object?> get props => [bottomNavBackgroundColor];
}

class ChangeBottomNavSelectedItemColorEvent extends ThemeEvent {
  final Color bottomNavSelectedItemColor;

  const ChangeBottomNavSelectedItemColorEvent(this.bottomNavSelectedItemColor);

  @override
  List<Object?> get props => [bottomNavSelectedItemColor];
}

class ChangeBottomNavUnselectedItemColorEvent extends ThemeEvent {
  final Color bottomNavUnselectedItemColor;

  const ChangeBottomNavUnselectedItemColorEvent(
    this.bottomNavUnselectedItemColor,
  );

  @override
  List<Object?> get props => [bottomNavUnselectedItemColor];
}

class ChangeBottomNavElevationEvent extends ThemeEvent {
  final double bottomNavElevation;

  const ChangeBottomNavElevationEvent(this.bottomNavElevation);

  @override
  List<Object?> get props => [bottomNavElevation];
}

class ChangeBottomNavShowSelectedLabelsEvent extends ThemeEvent {
  final bool bottomNavShowSelectedLabels;

  const ChangeBottomNavShowSelectedLabelsEvent(
    this.bottomNavShowSelectedLabels,
  );

  @override
  List<Object?> get props => [bottomNavShowSelectedLabels];
}

class ChangeBottomNavShowUnselectedLabelsEvent extends ThemeEvent {
  final bool bottomNavShowUnselectedLabels;

  const ChangeBottomNavShowUnselectedLabelsEvent(
    this.bottomNavShowUnselectedLabels,
  );

  @override
  List<Object?> get props => [bottomNavShowUnselectedLabels];
}

// Button Customization Events
class ChangeElevatedButtonBackgroundColorEvent extends ThemeEvent {
  final Color elevatedButtonBackgroundColor;

  const ChangeElevatedButtonBackgroundColorEvent(
    this.elevatedButtonBackgroundColor,
  );

  @override
  List<Object?> get props => [elevatedButtonBackgroundColor];
}

class ChangeElevatedButtonForegroundColorEvent extends ThemeEvent {
  final Color elevatedButtonForegroundColor;

  const ChangeElevatedButtonForegroundColorEvent(
    this.elevatedButtonForegroundColor,
  );

  @override
  List<Object?> get props => [elevatedButtonForegroundColor];
}

class ChangeElevatedButtonElevationEvent extends ThemeEvent {
  final double elevatedButtonElevation;

  const ChangeElevatedButtonElevationEvent(this.elevatedButtonElevation);

  @override
  List<Object?> get props => [elevatedButtonElevation];
}

class ChangeFilledButtonBackgroundColorEvent extends ThemeEvent {
  final Color filledButtonBackgroundColor;

  const ChangeFilledButtonBackgroundColorEvent(
    this.filledButtonBackgroundColor,
  );

  @override
  List<Object?> get props => [filledButtonBackgroundColor];
}

class ChangeFilledButtonForegroundColorEvent extends ThemeEvent {
  final Color filledButtonForegroundColor;

  const ChangeFilledButtonForegroundColorEvent(
    this.filledButtonForegroundColor,
  );

  @override
  List<Object?> get props => [filledButtonForegroundColor];
}

class ChangeTextButtonForegroundColorEvent extends ThemeEvent {
  final Color textButtonForegroundColor;

  const ChangeTextButtonForegroundColorEvent(this.textButtonForegroundColor);

  @override
  List<Object?> get props => [textButtonForegroundColor];
}

class ChangeOutlinedButtonForegroundColorEvent extends ThemeEvent {
  final Color outlinedButtonForegroundColor;

  const ChangeOutlinedButtonForegroundColorEvent(
    this.outlinedButtonForegroundColor,
  );

  @override
  List<Object?> get props => [outlinedButtonForegroundColor];
}

class ChangeOutlinedButtonBorderColorEvent extends ThemeEvent {
  final Color outlinedButtonBorderColor;

  const ChangeOutlinedButtonBorderColorEvent(this.outlinedButtonBorderColor);

  @override
  List<Object?> get props => [outlinedButtonBorderColor];
}

class ChangeOutlinedButtonBorderWidthEvent extends ThemeEvent {
  final double outlinedButtonBorderWidth;

  const ChangeOutlinedButtonBorderWidthEvent(this.outlinedButtonBorderWidth);

  @override
  List<Object?> get props => [outlinedButtonBorderWidth];
}

class ChangeFabBackgroundColorEvent extends ThemeEvent {
  final Color fabBackgroundColor;

  const ChangeFabBackgroundColorEvent(this.fabBackgroundColor);

  @override
  List<Object?> get props => [fabBackgroundColor];
}

class ChangeFabForegroundColorEvent extends ThemeEvent {
  final Color fabForegroundColor;

  const ChangeFabForegroundColorEvent(this.fabForegroundColor);

  @override
  List<Object?> get props => [fabForegroundColor];
}

class ChangeFabBorderRadiusEvent extends ThemeEvent {
  final double fabBorderRadius;

  const ChangeFabBorderRadiusEvent(this.fabBorderRadius);

  @override
  List<Object?> get props => [fabBorderRadius];
}

class ChangeFabElevationEvent extends ThemeEvent {
  final double fabElevation;

  const ChangeFabElevationEvent(this.fabElevation);

  @override
  List<Object?> get props => [fabElevation];
}

class ChangeFabExtendedEvent extends ThemeEvent {
  final bool fabExtended;

  const ChangeFabExtendedEvent(this.fabExtended);

  @override
  List<Object?> get props => [fabExtended];
}

// Input Controls Events
class ChangeTextFieldFillColorEvent extends ThemeEvent {
  final Color textFieldFillColor;

  const ChangeTextFieldFillColorEvent(this.textFieldFillColor);

  @override
  List<Object?> get props => [textFieldFillColor];
}

class ChangeTextFieldBorderColorEvent extends ThemeEvent {
  final Color textFieldBorderColor;

  const ChangeTextFieldBorderColorEvent(this.textFieldBorderColor);

  @override
  List<Object?> get props => [textFieldBorderColor];
}

class ChangeTextFieldFocusedBorderColorEvent extends ThemeEvent {
  final Color textFieldFocusedBorderColor;

  const ChangeTextFieldFocusedBorderColorEvent(
    this.textFieldFocusedBorderColor,
  );

  @override
  List<Object?> get props => [textFieldFocusedBorderColor];
}

class ChangeTextFieldLabelColorEvent extends ThemeEvent {
  final Color textFieldLabelColor;

  const ChangeTextFieldLabelColorEvent(this.textFieldLabelColor);

  @override
  List<Object?> get props => [textFieldLabelColor];
}

class ChangeTextFieldBorderWidthEvent extends ThemeEvent {
  final double textFieldBorderWidth;

  const ChangeTextFieldBorderWidthEvent(this.textFieldBorderWidth);

  @override
  List<Object?> get props => [textFieldBorderWidth];
}

class ChangeTextFieldFocusedBorderWidthEvent extends ThemeEvent {
  final double textFieldFocusedBorderWidth;

  const ChangeTextFieldFocusedBorderWidthEvent(
    this.textFieldFocusedBorderWidth,
  );

  @override
  List<Object?> get props => [textFieldFocusedBorderWidth];
}

class ChangeTextFieldIsFilledEvent extends ThemeEvent {
  final bool textFieldIsFilled;

  const ChangeTextFieldIsFilledEvent(this.textFieldIsFilled);

  @override
  List<Object?> get props => [textFieldIsFilled];
}

class ChangeTextFieldIsDenseEvent extends ThemeEvent {
  final bool textFieldIsDense;

  const ChangeTextFieldIsDenseEvent(this.textFieldIsDense);

  @override
  List<Object?> get props => [textFieldIsDense];
}

class ChangeCheckboxFillColorEvent extends ThemeEvent {
  final Color checkboxFillColor;

  const ChangeCheckboxFillColorEvent(this.checkboxFillColor);

  @override
  List<Object?> get props => [checkboxFillColor];
}

class ChangeCheckboxCheckColorEvent extends ThemeEvent {
  final Color checkboxCheckColor;

  const ChangeCheckboxCheckColorEvent(this.checkboxCheckColor);

  @override
  List<Object?> get props => [checkboxCheckColor];
}

class ChangeCheckboxBorderWidthEvent extends ThemeEvent {
  final double checkboxBorderWidth;

  const ChangeCheckboxBorderWidthEvent(this.checkboxBorderWidth);

  @override
  List<Object?> get props => [checkboxBorderWidth];
}

class ChangeCheckboxIsCircularEvent extends ThemeEvent {
  final bool checkboxIsCircular;

  const ChangeCheckboxIsCircularEvent(this.checkboxIsCircular);

  @override
  List<Object?> get props => [checkboxIsCircular];
}

class ChangeRadioFillColorEvent extends ThemeEvent {
  final Color radioFillColor;

  const ChangeRadioFillColorEvent(this.radioFillColor);

  @override
  List<Object?> get props => [radioFillColor];
}

class ChangeRadioSizeEvent extends ThemeEvent {
  final double radioSize;

  const ChangeRadioSizeEvent(this.radioSize);

  @override
  List<Object?> get props => [radioSize];
}

class ChangeSwitchThumbColorEvent extends ThemeEvent {
  final Color switchThumbColor;

  const ChangeSwitchThumbColorEvent(this.switchThumbColor);

  @override
  List<Object?> get props => [switchThumbColor];
}

class ChangeSwitchTrackColorEvent extends ThemeEvent {
  final Color switchTrackColor;

  const ChangeSwitchTrackColorEvent(this.switchTrackColor);

  @override
  List<Object?> get props => [switchTrackColor];
}

class ChangeSwitchActiveTrackColorEvent extends ThemeEvent {
  final Color switchActiveTrackColor;

  const ChangeSwitchActiveTrackColorEvent(this.switchActiveTrackColor);

  @override
  List<Object?> get props => [switchActiveTrackColor];
}

class ChangeSwitchIsMaterial3Event extends ThemeEvent {
  final bool switchIsMaterial3;

  const ChangeSwitchIsMaterial3Event(this.switchIsMaterial3);

  @override
  List<Object?> get props => [switchIsMaterial3];
}

// Lists and Dialogs Events
class ChangeListTileTextColorEvent extends ThemeEvent {
  final Color listTileTextColor;

  const ChangeListTileTextColorEvent(this.listTileTextColor);

  @override
  List<Object?> get props => [listTileTextColor];
}

class ChangeListTileSelectedColorEvent extends ThemeEvent {
  final Color listTileSelectedColor;

  const ChangeListTileSelectedColorEvent(this.listTileSelectedColor);

  @override
  List<Object?> get props => [listTileSelectedColor];
}

class ChangeListTileIconColorEvent extends ThemeEvent {
  final Color listTileIconColor;

  const ChangeListTileIconColorEvent(this.listTileIconColor);

  @override
  List<Object?> get props => [listTileIconColor];
}

class ChangeListTileHorizontalPaddingEvent extends ThemeEvent {
  final double listTileHorizontalPadding;

  const ChangeListTileHorizontalPaddingEvent(this.listTileHorizontalPadding);

  @override
  List<Object?> get props => [listTileHorizontalPadding];
}

class ChangeListTileVerticalPaddingEvent extends ThemeEvent {
  final double listTileVerticalPadding;

  const ChangeListTileVerticalPaddingEvent(this.listTileVerticalPadding);

  @override
  List<Object?> get props => [listTileVerticalPadding];
}

class ChangeListTileDenseEvent extends ThemeEvent {
  final bool listTileDense;

  const ChangeListTileDenseEvent(this.listTileDense);

  @override
  List<Object?> get props => [listTileDense];
}

class ChangeDialogBackgroundColorEvent extends ThemeEvent {
  final Color dialogBackgroundColor;

  const ChangeDialogBackgroundColorEvent(this.dialogBackgroundColor);

  @override
  List<Object?> get props => [dialogBackgroundColor];
}

class ChangeDialogBorderRadiusEvent extends ThemeEvent {
  final double dialogBorderRadius;

  const ChangeDialogBorderRadiusEvent(this.dialogBorderRadius);

  @override
  List<Object?> get props => [dialogBorderRadius];
}

class ChangeSnackBarBackgroundColorEvent extends ThemeEvent {
  final Color snackBarBackgroundColor;

  const ChangeSnackBarBackgroundColorEvent(this.snackBarBackgroundColor);

  @override
  List<Object?> get props => [snackBarBackgroundColor];
}

class ChangeSnackBarTextColorEvent extends ThemeEvent {
  final Color snackBarTextColor;

  const ChangeSnackBarTextColorEvent(this.snackBarTextColor);

  @override
  List<Object?> get props => [snackBarTextColor];
}

class ChangeSnackBarActionColorEvent extends ThemeEvent {
  final Color snackBarActionColor;

  const ChangeSnackBarActionColorEvent(this.snackBarActionColor);

  @override
  List<Object?> get props => [snackBarActionColor];
}

class ChangeSnackBarBorderRadiusEvent extends ThemeEvent {
  final double snackBarBorderRadius;

  const ChangeSnackBarBorderRadiusEvent(this.snackBarBorderRadius);

  @override
  List<Object?> get props => [snackBarBorderRadius];
}

class ChangeSnackBarElevationEvent extends ThemeEvent {
  final double snackBarElevation;

  const ChangeSnackBarElevationEvent(this.snackBarElevation);

  @override
  List<Object?> get props => [snackBarElevation];
}

class ChangeDividerColorEvent extends ThemeEvent {
  final Color dividerColor;

  const ChangeDividerColorEvent(this.dividerColor);

  @override
  List<Object?> get props => [dividerColor];
}

class ChangeDividerThicknessEvent extends ThemeEvent {
  final double dividerThickness;

  const ChangeDividerThicknessEvent(this.dividerThickness);

  @override
  List<Object?> get props => [dividerThickness];
}

class ChangeDividerIndentEvent extends ThemeEvent {
  final double dividerIndent;

  const ChangeDividerIndentEvent(this.dividerIndent);

  @override
  List<Object?> get props => [dividerIndent];
}

// Tabs and Navigation Events
class ChangeTabBarIndicatorColorEvent extends ThemeEvent {
  final Color tabBarIndicatorColor;

  const ChangeTabBarIndicatorColorEvent(this.tabBarIndicatorColor);

  @override
  List<Object?> get props => [tabBarIndicatorColor];
}

class ChangeTabBarLabelColorEvent extends ThemeEvent {
  final Color tabBarLabelColor;

  const ChangeTabBarLabelColorEvent(this.tabBarLabelColor);

  @override
  List<Object?> get props => [tabBarLabelColor];
}

class ChangeTabBarUnselectedLabelColorEvent extends ThemeEvent {
  final Color tabBarUnselectedLabelColor;

  const ChangeTabBarUnselectedLabelColorEvent(this.tabBarUnselectedLabelColor);

  @override
  List<Object?> get props => [tabBarUnselectedLabelColor];
}

class ChangeTabBarIndicatorWeightEvent extends ThemeEvent {
  final double tabBarIndicatorWeight;

  const ChangeTabBarIndicatorWeightEvent(this.tabBarIndicatorWeight);

  @override
  List<Object?> get props => [tabBarIndicatorWeight];
}

class ChangeTabBarIsScrollableEvent extends ThemeEvent {
  final bool tabBarIsScrollable;

  const ChangeTabBarIsScrollableEvent(this.tabBarIsScrollable);

  @override
  List<Object?> get props => [tabBarIsScrollable];
}

class ChangeNavigationRailBackgroundColorEvent extends ThemeEvent {
  final Color navigationRailBackgroundColor;

  const ChangeNavigationRailBackgroundColorEvent(
    this.navigationRailBackgroundColor,
  );

  @override
  List<Object?> get props => [navigationRailBackgroundColor];
}

class ChangeNavigationRailSelectedIconColorEvent extends ThemeEvent {
  final Color navigationRailSelectedIconColor;

  const ChangeNavigationRailSelectedIconColorEvent(
    this.navigationRailSelectedIconColor,
  );

  @override
  List<Object?> get props => [navigationRailSelectedIconColor];
}

class ChangeNavigationRailUnselectedIconColorEvent extends ThemeEvent {
  final Color navigationRailUnselectedIconColor;

  const ChangeNavigationRailUnselectedIconColorEvent(
    this.navigationRailUnselectedIconColor,
  );

  @override
  List<Object?> get props => [navigationRailUnselectedIconColor];
}

class ChangeNavigationRailSelectedLabelColorEvent extends ThemeEvent {
  final Color navigationRailSelectedLabelColor;

  const ChangeNavigationRailSelectedLabelColorEvent(
    this.navigationRailSelectedLabelColor,
  );

  @override
  List<Object?> get props => [navigationRailSelectedLabelColor];
}

class ChangeNavigationRailUnselectedLabelColorEvent extends ThemeEvent {
  final Color navigationRailUnselectedLabelColor;

  const ChangeNavigationRailUnselectedLabelColorEvent(
    this.navigationRailUnselectedLabelColor,
  );

  @override
  List<Object?> get props => [navigationRailUnselectedLabelColor];
}

class ChangeNavigationRailIndicatorColorEvent extends ThemeEvent {
  final Color navigationRailIndicatorColor;

  const ChangeNavigationRailIndicatorColorEvent(
    this.navigationRailIndicatorColor,
  );

  @override
  List<Object?> get props => [navigationRailIndicatorColor];
}

class ChangeNavigationRailElevationEvent extends ThemeEvent {
  final double navigationRailElevation;

  const ChangeNavigationRailElevationEvent(this.navigationRailElevation);

  @override
  List<Object?> get props => [navigationRailElevation];
}

class ChangeNavigationRailWidthEvent extends ThemeEvent {
  final double navigationRailWidth;

  const ChangeNavigationRailWidthEvent(this.navigationRailWidth);

  @override
  List<Object?> get props => [navigationRailWidth];
}

class ChangeNavigationRailLabelTypeEvent extends ThemeEvent {
  final bool navigationRailLabelType;

  const ChangeNavigationRailLabelTypeEvent(this.navigationRailLabelType);

  @override
  List<Object?> get props => [navigationRailLabelType];
}

class ChangeDrawerBackgroundColorEvent extends ThemeEvent {
  final Color drawerBackgroundColor;

  const ChangeDrawerBackgroundColorEvent(this.drawerBackgroundColor);

  @override
  List<Object?> get props => [drawerBackgroundColor];
}

class ChangeDrawerWidthEvent extends ThemeEvent {
  final double drawerWidth;

  const ChangeDrawerWidthEvent(this.drawerWidth);

  @override
  List<Object?> get props => [drawerWidth];
}

class ChangeDrawerBorderRadiusEvent extends ThemeEvent {
  final double drawerBorderRadius;

  const ChangeDrawerBorderRadiusEvent(this.drawerBorderRadius);

  @override
  List<Object?> get props => [drawerBorderRadius];
}
