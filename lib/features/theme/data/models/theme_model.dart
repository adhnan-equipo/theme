// lib/features/theme/data/models/theme_model.dart
import 'package:equatable/equatable.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class ThemeModel extends Equatable {
  // Basic theme properties
  final ThemeMode themeMode;
  final FlexScheme colorScheme;
  final FlexSurfaceMode surfaceMode;
  final int blendLevel;

  // Custom colors
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? tertiaryColor;

  // Surfaces
  final Color? backgroundColor;
  final Color? surfaceColor;
  final Color? scaffoldBackgroundColor;
  final double surfaceElevation;

  // Typography
  final String fontFamily;
  final double textScaleFactor;
  final bool useM3Typography;
  final bool useGoogleFonts;
  final FontWeight titleFontWeight;
  final FontWeight bodyFontWeight;

  // Component styling
  final double borderRadius;
  final double cardBorderRadius;
  final double buttonBorderRadius;
  final double textFieldBorderRadius;
  final double appBarElevation;
  final double cardElevation;
  final double dialogElevation;
  final bool adaptiveStyling;

  // Dark mode options
  final bool darkIsTrueBlack;
  final bool darkUsesLightSurface;
  final int darkBlendLevel;
  final double darkSurfaceOpacity;

  // Material 3 options
  final bool useMaterial3;
  final bool swapLegacyColors;
  final bool useMaterial3ErrorColors;
  final bool adaptNavigationBar;
  final bool tintedDisabledControls;

  // Animation options
  final Curve animationCurve;
  final Duration animationDuration;
  final bool enableAnimations;
  final bool enablePageTransitions;

  // Miscellaneous options
  final bool tooltipsMatchBackground;
  final bool transparentStatusBar;
  final bool applyElevationOverlayColor;
  final bool transparentNavigationBar;

  // AppBar Options
  final Color? appBarBackgroundColor;
  final Color? appBarForegroundColor;
  final bool appBarCenterTitle;

  // Icon Theming
  final Color? primaryIconColor;
  final Color? appBarIconColor;
  final double iconSize;

  // Bottom Navigation
  final Color? bottomNavBackgroundColor;
  final Color? bottomNavSelectedItemColor;
  final Color? bottomNavUnselectedItemColor;
  final double bottomNavElevation;
  final bool bottomNavShowSelectedLabels;
  final bool bottomNavShowUnselectedLabels;

  // Button Customization
  final Color? elevatedButtonBackgroundColor;
  final Color? elevatedButtonForegroundColor;
  final double elevatedButtonElevation;

  final Color? filledButtonBackgroundColor;
  final Color? filledButtonForegroundColor;

  final Color? textButtonForegroundColor;

  final Color? outlinedButtonForegroundColor;
  final Color? outlinedButtonBorderColor;
  final double outlinedButtonBorderWidth;

  final Color? fabBackgroundColor;
  final Color? fabForegroundColor;
  final double fabBorderRadius;
  final double fabElevation;
  final bool fabExtended;

  // Input Controls
  final Color? textFieldFillColor;
  final Color? textFieldBorderColor;
  final Color? textFieldFocusedBorderColor;
  final Color? textFieldLabelColor;
  final double textFieldBorderWidth;
  final double textFieldFocusedBorderWidth;
  final bool textFieldIsFilled;
  final bool textFieldIsDense;

  final Color? checkboxFillColor;
  final Color? checkboxCheckColor;
  final double checkboxBorderWidth;
  final bool checkboxIsCircular;

  final Color? radioFillColor;
  final double radioSize;

  final Color? switchThumbColor;
  final Color? switchTrackColor;
  final Color? switchActiveTrackColor;
  final bool switchIsMaterial3;

  // Lists and Dialogs
  final Color? listTileTextColor;
  final Color? listTileSelectedColor;
  final Color? listTileIconColor;
  final double listTileHorizontalPadding;
  final double listTileVerticalPadding;
  final bool listTileDense;

  final Color? dialogBackgroundColor;
  final double dialogBorderRadius;

  final Color? snackBarBackgroundColor;
  final Color? snackBarTextColor;
  final Color? snackBarActionColor;
  final double snackBarBorderRadius;
  final double snackBarElevation;

  final Color? dividerColor;
  final double dividerThickness;
  final double dividerIndent;

  // Tabs and Navigation
  final Color? tabBarIndicatorColor;
  final Color? tabBarLabelColor;
  final Color? tabBarUnselectedLabelColor;
  final double tabBarIndicatorWeight;
  final bool tabBarIsScrollable;

  final Color? navigationRailBackgroundColor;
  final Color? navigationRailSelectedIconColor;
  final Color? navigationRailUnselectedIconColor;
  final Color? navigationRailSelectedLabelColor;
  final Color? navigationRailUnselectedLabelColor;
  final Color? navigationRailIndicatorColor;
  final double navigationRailElevation;
  final double navigationRailWidth;
  final bool navigationRailLabelType;

  final Color? drawerBackgroundColor;
  final double drawerWidth;
  final double drawerBorderRadius;

  const ThemeModel({
    // Default values for all properties
    this.themeMode = ThemeMode.system,
    this.colorScheme = FlexScheme.blumineBlue,
    this.surfaceMode = FlexSurfaceMode.level,
    this.blendLevel = 7,

    this.primaryColor,
    this.secondaryColor,
    this.tertiaryColor,

    this.backgroundColor,
    this.surfaceColor,
    this.scaffoldBackgroundColor,
    this.surfaceElevation = 1.0,

    this.fontFamily = 'Roboto',
    this.textScaleFactor = 1.0,
    this.useM3Typography = true,
    this.useGoogleFonts = true,
    this.titleFontWeight = FontWeight.bold,
    this.bodyFontWeight = FontWeight.normal,

    this.borderRadius = 8.0,
    this.cardBorderRadius = 12.0,
    this.buttonBorderRadius = 20.0,
    this.textFieldBorderRadius = 4.0,
    this.appBarElevation = 0.0,
    this.cardElevation = 1.0,
    this.dialogElevation = 3.0,
    this.adaptiveStyling = true,

    this.darkIsTrueBlack = false,
    this.darkUsesLightSurface = false,
    this.darkBlendLevel = 13,
    this.darkSurfaceOpacity = 0.2,

    this.useMaterial3 = true,
    this.swapLegacyColors = true,
    this.useMaterial3ErrorColors = true,
    this.adaptNavigationBar = true,
    this.tintedDisabledControls = true,

    this.animationCurve = Curves.easeInOut,
    this.animationDuration = const Duration(milliseconds: 300),
    this.enableAnimations = true,
    this.enablePageTransitions = true,

    this.tooltipsMatchBackground = false,
    this.transparentStatusBar = true,
    this.applyElevationOverlayColor = true,
    this.transparentNavigationBar = true,

    this.appBarBackgroundColor,
    this.appBarForegroundColor,
    this.appBarCenterTitle = false,

    // Icon Theming
    this.primaryIconColor,
    this.appBarIconColor,
    this.iconSize = 24.0,

    // Bottom Navigation
    this.bottomNavBackgroundColor,
    this.bottomNavSelectedItemColor,
    this.bottomNavUnselectedItemColor,
    this.bottomNavElevation = 8.0,
    this.bottomNavShowSelectedLabels = true,
    this.bottomNavShowUnselectedLabels = true,

    // Button Customization
    this.elevatedButtonBackgroundColor,
    this.elevatedButtonForegroundColor,
    this.elevatedButtonElevation = 2.0,

    this.filledButtonBackgroundColor,
    this.filledButtonForegroundColor,

    this.textButtonForegroundColor,

    this.outlinedButtonForegroundColor,
    this.outlinedButtonBorderColor,
    this.outlinedButtonBorderWidth = 1.0,

    this.fabBackgroundColor,
    this.fabForegroundColor,
    this.fabBorderRadius = 16.0,
    this.fabElevation = 6.0,
    this.fabExtended = false,

    // Input Controls
    this.textFieldFillColor,
    this.textFieldBorderColor,
    this.textFieldFocusedBorderColor,
    this.textFieldLabelColor,
    this.textFieldBorderWidth = 1.0,
    this.textFieldFocusedBorderWidth = 2.0,
    this.textFieldIsFilled = true,
    this.textFieldIsDense = false,

    this.checkboxFillColor,
    this.checkboxCheckColor,
    this.checkboxBorderWidth = 2.0,
    this.checkboxIsCircular = false,

    this.radioFillColor,
    this.radioSize = 20.0,

    this.switchThumbColor,
    this.switchTrackColor,
    this.switchActiveTrackColor,
    this.switchIsMaterial3 = true,

    // Lists and Dialogs
    this.listTileTextColor,
    this.listTileSelectedColor,
    this.listTileIconColor,
    this.listTileHorizontalPadding = 16.0,
    this.listTileVerticalPadding = 8.0,
    this.listTileDense = false,

    this.dialogBackgroundColor,
    this.dialogBorderRadius = 8.0,

    this.snackBarBackgroundColor,
    this.snackBarTextColor,
    this.snackBarActionColor,
    this.snackBarBorderRadius = 4.0,
    this.snackBarElevation = 6.0,

    this.dividerColor,
    this.dividerThickness = 1.0,
    this.dividerIndent = 0.0,

    // Tabs and Navigation
    this.tabBarIndicatorColor,
    this.tabBarLabelColor,
    this.tabBarUnselectedLabelColor,
    this.tabBarIndicatorWeight = 2.0,
    this.tabBarIsScrollable = false,

    this.navigationRailBackgroundColor,
    this.navigationRailSelectedIconColor,
    this.navigationRailUnselectedIconColor,
    this.navigationRailSelectedLabelColor,
    this.navigationRailUnselectedLabelColor,
    this.navigationRailIndicatorColor,
    this.navigationRailElevation = 0.0,
    this.navigationRailWidth = 72.0,
    this.navigationRailLabelType = false,

    this.drawerBackgroundColor,
    this.drawerWidth = 304.0,
    this.drawerBorderRadius = 0.0,
  });

  // Create a copy with any changed properties
  ThemeModel copyWith({
    ThemeMode? themeMode,
    FlexScheme? colorScheme,
    FlexSurfaceMode? surfaceMode,
    int? blendLevel,
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? backgroundColor,
    Color? surfaceColor,
    Color? scaffoldBackgroundColor,
    double? surfaceElevation,
    String? fontFamily,
    double? textScaleFactor,
    bool? useM3Typography,
    bool? useGoogleFonts,
    FontWeight? titleFontWeight,
    FontWeight? bodyFontWeight,
    double? borderRadius,
    double? cardBorderRadius,
    double? buttonBorderRadius,
    double? textFieldBorderRadius,
    double? appBarElevation,
    double? cardElevation,
    double? dialogElevation,
    bool? adaptiveStyling,
    bool? darkIsTrueBlack,
    bool? darkUsesLightSurface,
    int? darkBlendLevel,
    double? darkSurfaceOpacity,
    bool? useMaterial3,
    bool? swapLegacyColors,
    bool? useMaterial3ErrorColors,
    bool? adaptNavigationBar,
    bool? tintedDisabledControls,
    Curve? animationCurve,
    Duration? animationDuration,
    bool? enableAnimations,
    bool? enablePageTransitions,
    bool? tooltipsMatchBackground,
    bool? transparentStatusBar,
    bool? applyElevationOverlayColor,
    bool? transparentNavigationBar,

    Color? appBarBackgroundColor,
    Color? appBarForegroundColor,
    bool? appBarCenterTitle,

    // Icon Theming
    Color? primaryIconColor,
    Color? appBarIconColor,
    double? iconSize,

    // Bottom Navigation
    Color? bottomNavBackgroundColor,
    Color? bottomNavSelectedItemColor,
    Color? bottomNavUnselectedItemColor,
    double? bottomNavElevation,
    bool? bottomNavShowSelectedLabels,
    bool? bottomNavShowUnselectedLabels,

    // Button Customization
    Color? elevatedButtonBackgroundColor,
    Color? elevatedButtonForegroundColor,
    double? elevatedButtonElevation,

    Color? filledButtonBackgroundColor,
    Color? filledButtonForegroundColor,

    Color? textButtonForegroundColor,

    Color? outlinedButtonForegroundColor,
    Color? outlinedButtonBorderColor,
    double? outlinedButtonBorderWidth,

    Color? fabBackgroundColor,
    Color? fabForegroundColor,
    double? fabBorderRadius,
    double? fabElevation,
    bool? fabExtended,

    // Input Controls
    Color? textFieldFillColor,
    Color? textFieldBorderColor,
    Color? textFieldFocusedBorderColor,
    Color? textFieldLabelColor,
    double? textFieldBorderWidth,
    double? textFieldFocusedBorderWidth,
    bool? textFieldIsFilled,
    bool? textFieldIsDense,

    Color? checkboxFillColor,
    Color? checkboxCheckColor,
    double? checkboxBorderWidth,
    bool? checkboxIsCircular,

    Color? radioFillColor,
    double? radioSize,

    Color? switchThumbColor,
    Color? switchTrackColor,
    Color? switchActiveTrackColor,
    bool? switchIsMaterial3,

    // Lists and Dialogs
    Color? listTileTextColor,
    Color? listTileSelectedColor,
    Color? listTileIconColor,
    double? listTileHorizontalPadding,
    double? listTileVerticalPadding,
    bool? listTileDense,

    Color? dialogBackgroundColor,
    double? dialogBorderRadius,

    Color? snackBarBackgroundColor,
    Color? snackBarTextColor,
    Color? snackBarActionColor,
    double? snackBarBorderRadius,
    double? snackBarElevation,

    Color? dividerColor,
    double? dividerThickness,
    double? dividerIndent,

    // Tabs and Navigation
    Color? tabBarIndicatorColor,
    Color? tabBarLabelColor,
    Color? tabBarUnselectedLabelColor,
    double? tabBarIndicatorWeight,
    bool? tabBarIsScrollable,

    Color? navigationRailBackgroundColor,
    Color? navigationRailSelectedIconColor,
    Color? navigationRailUnselectedIconColor,
    Color? navigationRailSelectedLabelColor,
    Color? navigationRailUnselectedLabelColor,
    Color? navigationRailIndicatorColor,
    double? navigationRailElevation,
    double? navigationRailWidth,
    bool? navigationRailLabelType,

    Color? drawerBackgroundColor,
    double? drawerWidth,
    double? drawerBorderRadius,
  }) {
    return ThemeModel(
      themeMode: themeMode ?? this.themeMode,
      colorScheme: colorScheme ?? this.colorScheme,
      surfaceMode: surfaceMode ?? this.surfaceMode,
      blendLevel: blendLevel ?? this.blendLevel,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      scaffoldBackgroundColor:
          scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
      surfaceElevation: surfaceElevation ?? this.surfaceElevation,
      fontFamily: fontFamily ?? this.fontFamily,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      useM3Typography: useM3Typography ?? this.useM3Typography,
      useGoogleFonts: useGoogleFonts ?? this.useGoogleFonts,
      titleFontWeight: titleFontWeight ?? this.titleFontWeight,
      bodyFontWeight: bodyFontWeight ?? this.bodyFontWeight,
      borderRadius: borderRadius ?? this.borderRadius,
      cardBorderRadius: cardBorderRadius ?? this.cardBorderRadius,
      buttonBorderRadius: buttonBorderRadius ?? this.buttonBorderRadius,
      textFieldBorderRadius:
          textFieldBorderRadius ?? this.textFieldBorderRadius,
      appBarElevation: appBarElevation ?? this.appBarElevation,
      cardElevation: cardElevation ?? this.cardElevation,
      dialogElevation: dialogElevation ?? this.dialogElevation,
      adaptiveStyling: adaptiveStyling ?? this.adaptiveStyling,
      darkIsTrueBlack: darkIsTrueBlack ?? this.darkIsTrueBlack,
      darkUsesLightSurface: darkUsesLightSurface ?? this.darkUsesLightSurface,
      darkBlendLevel: darkBlendLevel ?? this.darkBlendLevel,
      darkSurfaceOpacity: darkSurfaceOpacity ?? this.darkSurfaceOpacity,
      useMaterial3: useMaterial3 ?? this.useMaterial3,
      swapLegacyColors: swapLegacyColors ?? this.swapLegacyColors,
      useMaterial3ErrorColors:
          useMaterial3ErrorColors ?? this.useMaterial3ErrorColors,
      adaptNavigationBar: adaptNavigationBar ?? this.adaptNavigationBar,
      tintedDisabledControls:
          tintedDisabledControls ?? this.tintedDisabledControls,
      animationCurve: animationCurve ?? this.animationCurve,
      animationDuration: animationDuration ?? this.animationDuration,
      enableAnimations: enableAnimations ?? this.enableAnimations,
      enablePageTransitions:
          enablePageTransitions ?? this.enablePageTransitions,
      tooltipsMatchBackground:
          tooltipsMatchBackground ?? this.tooltipsMatchBackground,
      transparentStatusBar: transparentStatusBar ?? this.transparentStatusBar,
      applyElevationOverlayColor:
          applyElevationOverlayColor ?? this.applyElevationOverlayColor,
      transparentNavigationBar:
          transparentNavigationBar ?? this.transparentNavigationBar,

      appBarBackgroundColor:
          appBarBackgroundColor ?? this.appBarBackgroundColor,
      appBarForegroundColor:
          appBarForegroundColor ?? this.appBarForegroundColor,
      appBarCenterTitle: appBarCenterTitle ?? this.appBarCenterTitle,

      // Icon Theming
      primaryIconColor: primaryIconColor ?? this.primaryIconColor,
      appBarIconColor: appBarIconColor ?? this.appBarIconColor,
      iconSize: iconSize ?? this.iconSize,

      // Bottom Navigation
      bottomNavBackgroundColor:
          bottomNavBackgroundColor ?? this.bottomNavBackgroundColor,
      bottomNavSelectedItemColor:
          bottomNavSelectedItemColor ?? this.bottomNavSelectedItemColor,
      bottomNavUnselectedItemColor:
          bottomNavUnselectedItemColor ?? this.bottomNavUnselectedItemColor,
      bottomNavElevation: bottomNavElevation ?? this.bottomNavElevation,
      bottomNavShowSelectedLabels:
          bottomNavShowSelectedLabels ?? this.bottomNavShowSelectedLabels,
      bottomNavShowUnselectedLabels:
          bottomNavShowUnselectedLabels ?? this.bottomNavShowUnselectedLabels,

      // Button Customization
      elevatedButtonBackgroundColor:
          elevatedButtonBackgroundColor ?? this.elevatedButtonBackgroundColor,
      elevatedButtonForegroundColor:
          elevatedButtonForegroundColor ?? this.elevatedButtonForegroundColor,
      elevatedButtonElevation:
          elevatedButtonElevation ?? this.elevatedButtonElevation,

      filledButtonBackgroundColor:
          filledButtonBackgroundColor ?? this.filledButtonBackgroundColor,
      filledButtonForegroundColor:
          filledButtonForegroundColor ?? this.filledButtonForegroundColor,

      textButtonForegroundColor:
          textButtonForegroundColor ?? this.textButtonForegroundColor,

      outlinedButtonForegroundColor:
          outlinedButtonForegroundColor ?? this.outlinedButtonForegroundColor,
      outlinedButtonBorderColor:
          outlinedButtonBorderColor ?? this.outlinedButtonBorderColor,
      outlinedButtonBorderWidth:
          outlinedButtonBorderWidth ?? this.outlinedButtonBorderWidth,

      fabBackgroundColor: fabBackgroundColor ?? this.fabBackgroundColor,
      fabForegroundColor: fabForegroundColor ?? this.fabForegroundColor,
      fabBorderRadius: fabBorderRadius ?? this.fabBorderRadius,
      fabElevation: fabElevation ?? this.fabElevation,
      fabExtended: fabExtended ?? this.fabExtended,

      // Input Controls
      textFieldFillColor: textFieldFillColor ?? this.textFieldFillColor,
      textFieldBorderColor: textFieldBorderColor ?? this.textFieldBorderColor,
      textFieldFocusedBorderColor:
          textFieldFocusedBorderColor ?? this.textFieldFocusedBorderColor,
      textFieldLabelColor: textFieldLabelColor ?? this.textFieldLabelColor,
      textFieldBorderWidth: textFieldBorderWidth ?? this.textFieldBorderWidth,
      textFieldFocusedBorderWidth:
          textFieldFocusedBorderWidth ?? this.textFieldFocusedBorderWidth,
      textFieldIsFilled: textFieldIsFilled ?? this.textFieldIsFilled,
      textFieldIsDense: textFieldIsDense ?? this.textFieldIsDense,

      checkboxFillColor: checkboxFillColor ?? this.checkboxFillColor,
      checkboxCheckColor: checkboxCheckColor ?? this.checkboxCheckColor,
      checkboxBorderWidth: checkboxBorderWidth ?? this.checkboxBorderWidth,
      checkboxIsCircular: checkboxIsCircular ?? this.checkboxIsCircular,

      radioFillColor: radioFillColor ?? this.radioFillColor,
      radioSize: radioSize ?? this.radioSize,

      switchThumbColor: switchThumbColor ?? this.switchThumbColor,
      switchTrackColor: switchTrackColor ?? this.switchTrackColor,
      switchActiveTrackColor:
          switchActiveTrackColor ?? this.switchActiveTrackColor,
      switchIsMaterial3: switchIsMaterial3 ?? this.switchIsMaterial3,

      // Lists and Dialogs
      listTileTextColor: listTileTextColor ?? this.listTileTextColor,
      listTileSelectedColor:
          listTileSelectedColor ?? this.listTileSelectedColor,
      listTileIconColor: listTileIconColor ?? this.listTileIconColor,
      listTileHorizontalPadding:
          listTileHorizontalPadding ?? this.listTileHorizontalPadding,
      listTileVerticalPadding:
          listTileVerticalPadding ?? this.listTileVerticalPadding,
      listTileDense: listTileDense ?? this.listTileDense,

      dialogBackgroundColor:
          dialogBackgroundColor ?? this.dialogBackgroundColor,
      dialogBorderRadius: dialogBorderRadius ?? this.dialogBorderRadius,

      snackBarBackgroundColor:
          snackBarBackgroundColor ?? this.snackBarBackgroundColor,
      snackBarTextColor: snackBarTextColor ?? this.snackBarTextColor,
      snackBarActionColor: snackBarActionColor ?? this.snackBarActionColor,
      snackBarBorderRadius: snackBarBorderRadius ?? this.snackBarBorderRadius,
      snackBarElevation: snackBarElevation ?? this.snackBarElevation,

      dividerColor: dividerColor ?? this.dividerColor,
      dividerThickness: dividerThickness ?? this.dividerThickness,
      dividerIndent: dividerIndent ?? this.dividerIndent,

      // Tabs and Navigation
      tabBarIndicatorColor: tabBarIndicatorColor ?? this.tabBarIndicatorColor,
      tabBarLabelColor: tabBarLabelColor ?? this.tabBarLabelColor,
      tabBarUnselectedLabelColor:
          tabBarUnselectedLabelColor ?? this.tabBarUnselectedLabelColor,
      tabBarIndicatorWeight:
          tabBarIndicatorWeight ?? this.tabBarIndicatorWeight,
      tabBarIsScrollable: tabBarIsScrollable ?? this.tabBarIsScrollable,

      navigationRailBackgroundColor:
          navigationRailBackgroundColor ?? this.navigationRailBackgroundColor,
      navigationRailSelectedIconColor:
          navigationRailSelectedIconColor ??
          this.navigationRailSelectedIconColor,
      navigationRailUnselectedIconColor:
          navigationRailUnselectedIconColor ??
          this.navigationRailUnselectedIconColor,
      navigationRailSelectedLabelColor:
          navigationRailSelectedLabelColor ??
          this.navigationRailSelectedLabelColor,
      navigationRailUnselectedLabelColor:
          navigationRailUnselectedLabelColor ??
          this.navigationRailUnselectedLabelColor,
      navigationRailIndicatorColor:
          navigationRailIndicatorColor ?? this.navigationRailIndicatorColor,
      navigationRailElevation:
          navigationRailElevation ?? this.navigationRailElevation,
      navigationRailWidth: navigationRailWidth ?? this.navigationRailWidth,
      navigationRailLabelType:
          navigationRailLabelType ?? this.navigationRailLabelType,

      drawerBackgroundColor:
          drawerBackgroundColor ?? this.drawerBackgroundColor,
      drawerWidth: drawerWidth ?? this.drawerWidth,
      drawerBorderRadius: drawerBorderRadius ?? this.drawerBorderRadius,
    );
  }

  @override
  List<Object?> get props => [
    themeMode,
    colorScheme,
    surfaceMode,
    blendLevel,
    primaryColor,
    secondaryColor,
    tertiaryColor,
    backgroundColor,
    surfaceColor,
    scaffoldBackgroundColor,
    surfaceElevation,
    fontFamily,
    textScaleFactor,
    useM3Typography,
    useGoogleFonts,
    titleFontWeight,
    bodyFontWeight,
    borderRadius,
    cardBorderRadius,
    buttonBorderRadius,
    textFieldBorderRadius,
    appBarElevation,
    cardElevation,
    dialogElevation,
    adaptiveStyling,
    darkIsTrueBlack,
    darkUsesLightSurface,
    darkBlendLevel,
    darkSurfaceOpacity,
    useMaterial3,
    swapLegacyColors,
    useMaterial3ErrorColors,
    adaptNavigationBar,
    tintedDisabledControls,
    animationCurve,
    animationDuration,
    enableAnimations,
    enablePageTransitions,
    tooltipsMatchBackground,
    transparentStatusBar,
    applyElevationOverlayColor,
    transparentNavigationBar,

    appBarBackgroundColor,
    appBarForegroundColor,
    appBarCenterTitle,

    // Icon Theming
    primaryIconColor,
    appBarIconColor,
    iconSize,

    // Bottom Navigation
    bottomNavBackgroundColor,
    bottomNavSelectedItemColor,
    bottomNavUnselectedItemColor,
    bottomNavElevation,
    bottomNavShowSelectedLabels,
    bottomNavShowUnselectedLabels,

    // Button Customization
    elevatedButtonBackgroundColor,
    elevatedButtonForegroundColor,
    elevatedButtonElevation,

    filledButtonBackgroundColor,
    filledButtonForegroundColor,

    textButtonForegroundColor,

    outlinedButtonForegroundColor,
    outlinedButtonBorderColor,
    outlinedButtonBorderWidth,

    fabBackgroundColor,
    fabForegroundColor,
    fabBorderRadius,
    fabElevation,
    fabExtended,

    // Input Controls
    textFieldFillColor,
    textFieldBorderColor,
    textFieldFocusedBorderColor,
    textFieldLabelColor,
    textFieldBorderWidth,
    textFieldFocusedBorderWidth,
    textFieldIsFilled,
    textFieldIsDense,

    checkboxFillColor,
    checkboxCheckColor,
    checkboxBorderWidth,
    checkboxIsCircular,

    radioFillColor,
    radioSize,

    switchThumbColor,
    switchTrackColor,
    switchActiveTrackColor,
    switchIsMaterial3,

    // Lists and Dialogs
    listTileTextColor,
    listTileSelectedColor,
    listTileIconColor,
    listTileHorizontalPadding,
    listTileVerticalPadding,
    listTileDense,

    dialogBackgroundColor,
    dialogBorderRadius,

    snackBarBackgroundColor,
    snackBarTextColor,
    snackBarActionColor,
    snackBarBorderRadius,
    snackBarElevation,

    dividerColor,
    dividerThickness,
    dividerIndent,

    // Tabs and Navigation
    tabBarIndicatorColor,
    tabBarLabelColor,
    tabBarUnselectedLabelColor,
    tabBarIndicatorWeight,
    tabBarIsScrollable,

    navigationRailBackgroundColor,
    navigationRailSelectedIconColor,
    navigationRailUnselectedIconColor,
    navigationRailSelectedLabelColor,
    navigationRailUnselectedLabelColor,
    navigationRailIndicatorColor,
    navigationRailElevation,
    navigationRailWidth,
    navigationRailLabelType,

    drawerBackgroundColor,
    drawerWidth,
    drawerBorderRadius,
  ];

  // Convert to/from JSON for persistence
  Map<String, dynamic> toJson() {
    return {
      'themeMode': themeMode.index,
      'colorScheme': colorScheme.index,
      'surfaceMode': surfaceMode.index,
      'blendLevel': blendLevel,

      'primaryColor': primaryColor?.value,
      'secondaryColor': secondaryColor?.value,
      'tertiaryColor': tertiaryColor?.value,

      'backgroundColor': backgroundColor?.value,
      'surfaceColor': surfaceColor?.value,
      'scaffoldBackgroundColor': scaffoldBackgroundColor?.value,
      'surfaceElevation': surfaceElevation,

      'fontFamily': fontFamily,
      'textScaleFactor': textScaleFactor,
      'useM3Typography': useM3Typography,
      'useGoogleFonts': useGoogleFonts,
      'titleFontWeight': titleFontWeight.index,
      'bodyFontWeight': bodyFontWeight.index,

      'borderRadius': borderRadius,
      'cardBorderRadius': cardBorderRadius,
      'buttonBorderRadius': buttonBorderRadius,
      'textFieldBorderRadius': textFieldBorderRadius,
      'appBarElevation': appBarElevation,
      'cardElevation': cardElevation,
      'dialogElevation': dialogElevation,
      'adaptiveStyling': adaptiveStyling,

      'darkIsTrueBlack': darkIsTrueBlack,
      'darkUsesLightSurface': darkUsesLightSurface,
      'darkBlendLevel': darkBlendLevel,
      'darkSurfaceOpacity': darkSurfaceOpacity,

      'useMaterial3': useMaterial3,
      'swapLegacyColors': swapLegacyColors,
      'useMaterial3ErrorColors': useMaterial3ErrorColors,
      'adaptNavigationBar': adaptNavigationBar,
      'tintedDisabledControls': tintedDisabledControls,

      'animationCurve': _curveToString(animationCurve),
      'animationDuration': animationDuration.inMilliseconds,
      'enableAnimations': enableAnimations,
      'enablePageTransitions': enablePageTransitions,

      'tooltipsMatchBackground': tooltipsMatchBackground,
      'transparentStatusBar': transparentStatusBar,
      'applyElevationOverlayColor': applyElevationOverlayColor,
      'transparentNavigationBar': transparentNavigationBar,

      'appBarBackgroundColor': appBarBackgroundColor?.value,
      'appBarForegroundColor': appBarForegroundColor?.value,
      'appBarCenterTitle': appBarCenterTitle,

      // Icon Theming
      'primaryIconColor': primaryIconColor?.value,
      'appBarIconColor': appBarIconColor?.value,
      'iconSize': iconSize,

      // Bottom Navigation
      'bottomNavBackgroundColor': bottomNavBackgroundColor?.value,
      'bottomNavSelectedItemColor': bottomNavSelectedItemColor?.value,
      'bottomNavUnselectedItemColor': bottomNavUnselectedItemColor?.value,
      'bottomNavElevation': bottomNavElevation,
      'bottomNavShowSelectedLabels': bottomNavShowSelectedLabels,
      'bottomNavShowUnselectedLabels': bottomNavShowUnselectedLabels,

      // Button Customization
      'elevatedButtonBackgroundColor': elevatedButtonBackgroundColor?.value,
      'elevatedButtonForegroundColor': elevatedButtonForegroundColor?.value,
      'elevatedButtonElevation': elevatedButtonElevation,

      'filledButtonBackgroundColor': filledButtonBackgroundColor?.value,
      'filledButtonForegroundColor': filledButtonForegroundColor?.value,

      'textButtonForegroundColor': textButtonForegroundColor?.value,

      'outlinedButtonForegroundColor': outlinedButtonForegroundColor?.value,
      'outlinedButtonBorderColor': outlinedButtonBorderColor?.value,
      'outlinedButtonBorderWidth': outlinedButtonBorderWidth,

      'fabBackgroundColor': fabBackgroundColor?.value,
      'fabForegroundColor': fabForegroundColor?.value,
      'fabBorderRadius': fabBorderRadius,
      'fabElevation': fabElevation,
      'fabExtended': fabExtended,

      // Input Controls
      'textFieldFillColor': textFieldFillColor?.value,
      'textFieldBorderColor': textFieldBorderColor?.value,
      'textFieldFocusedBorderColor': textFieldFocusedBorderColor?.value,
      'textFieldLabelColor': textFieldLabelColor?.value,
      'textFieldBorderWidth': textFieldBorderWidth,
      'textFieldFocusedBorderWidth': textFieldFocusedBorderWidth,
      'textFieldIsFilled': textFieldIsFilled,
      'textFieldIsDense': textFieldIsDense,

      'checkboxFillColor': checkboxFillColor?.value,
      'checkboxCheckColor': checkboxCheckColor?.value,
      'checkboxBorderWidth': checkboxBorderWidth,
      'checkboxIsCircular': checkboxIsCircular,

      'radioFillColor': radioFillColor?.value,
      'radioSize': radioSize,

      'switchThumbColor': switchThumbColor?.value,
      'switchTrackColor': switchTrackColor?.value,
      'switchActiveTrackColor': switchActiveTrackColor?.value,
      'switchIsMaterial3': switchIsMaterial3,

      // Lists and Dialogs
      'listTileTextColor': listTileTextColor?.value,
      'listTileSelectedColor': listTileSelectedColor?.value,
      'listTileIconColor': listTileIconColor?.value,
      'listTileHorizontalPadding': listTileHorizontalPadding,
      'listTileVerticalPadding': listTileVerticalPadding,
      'listTileDense': listTileDense,

      'dialogBackgroundColor': dialogBackgroundColor?.value,
      'dialogBorderRadius': dialogBorderRadius,

      'snackBarBackgroundColor': snackBarBackgroundColor?.value,
      'snackBarTextColor': snackBarTextColor?.value,
      'snackBarActionColor': snackBarActionColor?.value,
      'snackBarBorderRadius': snackBarBorderRadius,
      'snackBarElevation': snackBarElevation,

      'dividerColor': dividerColor?.value,
      'dividerThickness': dividerThickness,
      'dividerIndent': dividerIndent,

      // Tabs and Navigation
      'tabBarIndicatorColor': tabBarIndicatorColor?.value,
      'tabBarLabelColor': tabBarLabelColor?.value,
      'tabBarUnselectedLabelColor': tabBarUnselectedLabelColor?.value,
      'tabBarIndicatorWeight': tabBarIndicatorWeight,
      'tabBarIsScrollable': tabBarIsScrollable,

      'navigationRailBackgroundColor': navigationRailBackgroundColor?.value,
      'navigationRailSelectedIconColor': navigationRailSelectedIconColor?.value,
      'navigationRailUnselectedIconColor':
          navigationRailUnselectedIconColor?.value,
      'navigationRailSelectedLabelColor':
          navigationRailSelectedLabelColor?.value,
      'navigationRailUnselectedLabelColor':
          navigationRailUnselectedLabelColor?.value,
      'navigationRailIndicatorColor': navigationRailIndicatorColor?.value,
      'navigationRailElevation': navigationRailElevation,
      'navigationRailWidth': navigationRailWidth,
      'navigationRailLabelType': navigationRailLabelType,

      'drawerBackgroundColor': drawerBackgroundColor?.value,
      'drawerWidth': drawerWidth,
      'drawerBorderRadius': drawerBorderRadius,
    };
  }

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(
      themeMode: ThemeMode.values[json['themeMode'] ?? 0],
      colorScheme: FlexScheme.values[json['colorScheme'] ?? 0],
      surfaceMode: FlexSurfaceMode.values[json['surfaceMode'] ?? 0],
      blendLevel: json['blendLevel'] ?? 7,

      primaryColor:
          json['primaryColor'] != null ? Color(json['primaryColor']) : null,
      secondaryColor:
          json['secondaryColor'] != null ? Color(json['secondaryColor']) : null,
      tertiaryColor:
          json['tertiaryColor'] != null ? Color(json['tertiaryColor']) : null,

      backgroundColor:
          json['backgroundColor'] != null
              ? Color(json['backgroundColor'])
              : null,
      surfaceColor:
          json['surfaceColor'] != null ? Color(json['surfaceColor']) : null,
      scaffoldBackgroundColor:
          json['scaffoldBackgroundColor'] != null
              ? Color(json['scaffoldBackgroundColor'])
              : null,
      surfaceElevation: (json['surfaceElevation'] as num?)?.toDouble() ?? 1.0,

      fontFamily: json['fontFamily'] ?? 'Roboto',
      textScaleFactor: (json['textScaleFactor'] as num?)?.toDouble() ?? 1.0,
      useM3Typography: json['useM3Typography'] ?? true,
      useGoogleFonts: json['useGoogleFonts'] ?? true,
      titleFontWeight:
          json['titleFontWeight'] != null
              ? FontWeight.values[json['titleFontWeight']]
              : FontWeight.bold,
      bodyFontWeight:
          json['bodyFontWeight'] != null
              ? FontWeight.values[json['bodyFontWeight']]
              : FontWeight.normal,

      borderRadius: (json['borderRadius'] as num?)?.toDouble() ?? 8.0,
      cardBorderRadius: (json['cardBorderRadius'] as num?)?.toDouble() ?? 12.0,
      buttonBorderRadius:
          (json['buttonBorderRadius'] as num?)?.toDouble() ?? 20.0,
      textFieldBorderRadius:
          (json['textFieldBorderRadius'] as num?)?.toDouble() ?? 4.0,
      appBarElevation: (json['appBarElevation'] as num?)?.toDouble() ?? 0.0,
      cardElevation: (json['cardElevation'] as num?)?.toDouble() ?? 1.0,
      dialogElevation: (json['dialogElevation'] as num?)?.toDouble() ?? 3.0,
      adaptiveStyling: json['adaptiveStyling'] ?? true,

      darkIsTrueBlack: json['darkIsTrueBlack'] ?? false,
      darkUsesLightSurface: json['darkUsesLightSurface'] ?? false,
      darkBlendLevel: json['darkBlendLevel'] ?? 13,
      darkSurfaceOpacity:
          (json['darkSurfaceOpacity'] as num?)?.toDouble() ?? 0.2,

      useMaterial3: json['useMaterial3'] ?? true,
      swapLegacyColors: json['swapLegacyColors'] ?? true,
      useMaterial3ErrorColors: json['useMaterial3ErrorColors'] ?? true,
      adaptNavigationBar: json['adaptNavigationBar'] ?? true,
      tintedDisabledControls: json['tintedDisabledControls'] ?? true,

      animationCurve: _stringToCurve(json['animationCurve']),
      animationDuration: Duration(
        milliseconds: json['animationDuration'] ?? 300,
      ),
      enableAnimations: json['enableAnimations'] ?? true,
      enablePageTransitions: json['enablePageTransitions'] ?? true,

      tooltipsMatchBackground: json['tooltipsMatchBackground'] ?? false,
      transparentStatusBar: json['transparentStatusBar'] ?? true,
      applyElevationOverlayColor: json['applyElevationOverlayColor'] ?? true,
      transparentNavigationBar: json['transparentNavigationBar'] ?? true,

      appBarBackgroundColor:
          json['appBarBackgroundColor'] != null
              ? Color(json['appBarBackgroundColor'])
              : null,
      appBarForegroundColor:
          json['appBarForegroundColor'] != null
              ? Color(json['appBarForegroundColor'])
              : null,
      appBarCenterTitle: json['appBarCenterTitle'] ?? false,

      primaryIconColor:
          json['primaryIconColor'] != null
              ? Color(json['primaryIconColor'])
              : null,
      appBarIconColor:
          json['appBarIconColor'] != null
              ? Color(json['appBarIconColor'])
              : null,
      iconSize: (json['iconSize'] as num?)?.toDouble() ?? 24.0,

      // Bottom Navigation
      bottomNavBackgroundColor:
          json['bottomNavBackgroundColor'] != null
              ? Color(json['bottomNavBackgroundColor'])
              : null,
      bottomNavSelectedItemColor:
          json['bottomNavSelectedItemColor'] != null
              ? Color(json['bottomNavSelectedItemColor'])
              : null,
      bottomNavUnselectedItemColor:
          json['bottomNavUnselectedItemColor'] != null
              ? Color(json['bottomNavUnselectedItemColor'])
              : null,
      bottomNavElevation:
          (json['bottomNavElevation'] as num?)?.toDouble() ?? 8.0,
      bottomNavShowSelectedLabels: json['bottomNavShowSelectedLabels'] ?? true,
      bottomNavShowUnselectedLabels:
          json['bottomNavShowUnselectedLabels'] ?? true,

      // Button Customization
      elevatedButtonBackgroundColor:
          json['elevatedButtonBackgroundColor'] != null
              ? Color(json['elevatedButtonBackgroundColor'])
              : null,
      elevatedButtonForegroundColor:
          json['elevatedButtonForegroundColor'] != null
              ? Color(json['elevatedButtonForegroundColor'])
              : null,
      elevatedButtonElevation:
          (json['elevatedButtonElevation'] as num?)?.toDouble() ?? 2.0,

      filledButtonBackgroundColor:
          json['filledButtonBackgroundColor'] != null
              ? Color(json['filledButtonBackgroundColor'])
              : null,
      filledButtonForegroundColor:
          json['filledButtonForegroundColor'] != null
              ? Color(json['filledButtonForegroundColor'])
              : null,

      textButtonForegroundColor:
          json['textButtonForegroundColor'] != null
              ? Color(json['textButtonForegroundColor'])
              : null,

      outlinedButtonForegroundColor:
          json['outlinedButtonForegroundColor'] != null
              ? Color(json['outlinedButtonForegroundColor'])
              : null,
      outlinedButtonBorderColor:
          json['outlinedButtonBorderColor'] != null
              ? Color(json['outlinedButtonBorderColor'])
              : null,
      outlinedButtonBorderWidth:
          (json['outlinedButtonBorderWidth'] as num?)?.toDouble() ?? 1.0,

      fabBackgroundColor:
          json['fabBackgroundColor'] != null
              ? Color(json['fabBackgroundColor'])
              : null,
      fabForegroundColor:
          json['fabForegroundColor'] != null
              ? Color(json['fabForegroundColor'])
              : null,
      fabBorderRadius: (json['fabBorderRadius'] as num?)?.toDouble() ?? 16.0,
      fabElevation: (json['fabElevation'] as num?)?.toDouble() ?? 6.0,
      fabExtended: json['fabExtended'] ?? false,

      // Input Controls
      textFieldFillColor:
          json['textFieldFillColor'] != null
              ? Color(json['textFieldFillColor'])
              : null,
      textFieldBorderColor:
          json['textFieldBorderColor'] != null
              ? Color(json['textFieldBorderColor'])
              : null,
      textFieldFocusedBorderColor:
          json['textFieldFocusedBorderColor'] != null
              ? Color(json['textFieldFocusedBorderColor'])
              : null,
      textFieldLabelColor:
          json['textFieldLabelColor'] != null
              ? Color(json['textFieldLabelColor'])
              : null,
      textFieldBorderWidth:
          (json['textFieldBorderWidth'] as num?)?.toDouble() ?? 1.0,
      textFieldFocusedBorderWidth:
          (json['textFieldFocusedBorderWidth'] as num?)?.toDouble() ?? 2.0,
      textFieldIsFilled: json['textFieldIsFilled'] ?? true,
      textFieldIsDense: json['textFieldIsDense'] ?? false,

      checkboxFillColor:
          json['checkboxFillColor'] != null
              ? Color(json['checkboxFillColor'])
              : null,
      checkboxCheckColor:
          json['checkboxCheckColor'] != null
              ? Color(json['checkboxCheckColor'])
              : null,
      checkboxBorderWidth:
          (json['checkboxBorderWidth'] as num?)?.toDouble() ?? 2.0,
      checkboxIsCircular: json['checkboxIsCircular'] ?? false,

      radioFillColor:
          json['radioFillColor'] != null ? Color(json['radioFillColor']) : null,
      radioSize: (json['radioSize'] as num?)?.toDouble() ?? 20.0,

      switchThumbColor:
          json['switchThumbColor'] != null
              ? Color(json['switchThumbColor'])
              : null,
      switchTrackColor:
          json['switchTrackColor'] != null
              ? Color(json['switchTrackColor'])
              : null,
      switchActiveTrackColor:
          json['switchActiveTrackColor'] != null
              ? Color(json['switchActiveTrackColor'])
              : null,
      switchIsMaterial3: json['switchIsMaterial3'] ?? true,

      // Lists and Dialogs
      listTileTextColor:
          json['listTileTextColor'] != null
              ? Color(json['listTileTextColor'])
              : null,
      listTileSelectedColor:
          json['listTileSelectedColor'] != null
              ? Color(json['listTileSelectedColor'])
              : null,
      listTileIconColor:
          json['listTileIconColor'] != null
              ? Color(json['listTileIconColor'])
              : null,
      listTileHorizontalPadding:
          (json['listTileHorizontalPadding'] as num?)?.toDouble() ?? 16.0,
      listTileVerticalPadding:
          (json['listTileVerticalPadding'] as num?)?.toDouble() ?? 8.0,
      listTileDense: json['listTileDense'] ?? false,

      dialogBackgroundColor:
          json['dialogBackgroundColor'] != null
              ? Color(json['dialogBackgroundColor'])
              : null,
      dialogBorderRadius:
          (json['dialogBorderRadius'] as num?)?.toDouble() ?? 8.0,

      snackBarBackgroundColor:
          json['snackBarBackgroundColor'] != null
              ? Color(json['snackBarBackgroundColor'])
              : null,
      snackBarTextColor:
          json['snackBarTextColor'] != null
              ? Color(json['snackBarTextColor'])
              : null,
      snackBarActionColor:
          json['snackBarActionColor'] != null
              ? Color(json['snackBarActionColor'])
              : null,
      snackBarBorderRadius:
          (json['snackBarBorderRadius'] as num?)?.toDouble() ?? 4.0,
      snackBarElevation: (json['snackBarElevation'] as num?)?.toDouble() ?? 6.0,

      dividerColor:
          json['dividerColor'] != null ? Color(json['dividerColor']) : null,
      dividerThickness: (json['dividerThickness'] as num?)?.toDouble() ?? 1.0,
      dividerIndent: (json['dividerIndent'] as num?)?.toDouble() ?? 0.0,

      // Tabs and Navigation
      tabBarIndicatorColor:
          json['tabBarIndicatorColor'] != null
              ? Color(json['tabBarIndicatorColor'])
              : null,
      tabBarLabelColor:
          json['tabBarLabelColor'] != null
              ? Color(json['tabBarLabelColor'])
              : null,
      tabBarUnselectedLabelColor:
          json['tabBarUnselectedLabelColor'] != null
              ? Color(json['tabBarUnselectedLabelColor'])
              : null,
      tabBarIndicatorWeight:
          (json['tabBarIndicatorWeight'] as num?)?.toDouble() ?? 2.0,
      tabBarIsScrollable: json['tabBarIsScrollable'] ?? false,

      navigationRailBackgroundColor:
          json['navigationRailBackgroundColor'] != null
              ? Color(json['navigationRailBackgroundColor'])
              : null,
      navigationRailSelectedIconColor:
          json['navigationRailSelectedIconColor'] != null
              ? Color(json['navigationRailSelectedIconColor'])
              : null,
      navigationRailUnselectedIconColor:
          json['navigationRailUnselectedIconColor'] != null
              ? Color(json['navigationRailUnselectedIconColor'])
              : null,
      navigationRailSelectedLabelColor:
          json['navigationRailSelectedLabelColor'] != null
              ? Color(json['navigationRailSelectedLabelColor'])
              : null,
      navigationRailUnselectedLabelColor:
          json['navigationRailUnselectedLabelColor'] != null
              ? Color(json['navigationRailUnselectedLabelColor'])
              : null,
      navigationRailIndicatorColor:
          json['navigationRailIndicatorColor'] != null
              ? Color(json['navigationRailIndicatorColor'])
              : null,
      navigationRailElevation:
          (json['navigationRailElevation'] as num?)?.toDouble() ?? 0.0,
      navigationRailWidth:
          (json['navigationRailWidth'] as num?)?.toDouble() ?? 72.0,
      navigationRailLabelType: json['navigationRailLabelType'] ?? false,

      drawerBackgroundColor:
          json['drawerBackgroundColor'] != null
              ? Color(json['drawerBackgroundColor'])
              : null,
      drawerWidth: (json['drawerWidth'] as num?)?.toDouble() ?? 304.0,
      drawerBorderRadius:
          (json['drawerBorderRadius'] as num?)?.toDouble() ?? 0.0,
    );
  }

  // Helper methods for curve serialization
  static String _curveToString(Curve curve) {
    if (curve == Curves.easeInOut) return 'easeInOut';
    if (curve == Curves.easeIn) return 'easeIn';
    if (curve == Curves.easeOut) return 'easeOut';
    if (curve == Curves.linear) return 'linear';
    if (curve == Curves.decelerate) return 'decelerate';
    if (curve == Curves.fastOutSlowIn) return 'fastOutSlowIn';
    if (curve == Curves.bounceIn) return 'bounceIn';
    if (curve == Curves.bounceOut) return 'bounceOut';
    if (curve == Curves.elasticIn) return 'elasticIn';
    if (curve == Curves.elasticOut) return 'elasticOut';
    return 'easeInOut';
  }

  static Curve _stringToCurve(String? name) {
    switch (name) {
      case 'easeIn':
        return Curves.easeIn;
      case 'easeOut':
        return Curves.easeOut;
      case 'linear':
        return Curves.linear;
      case 'decelerate':
        return Curves.decelerate;
      case 'fastOutSlowIn':
        return Curves.fastOutSlowIn;
      case 'bounceIn':
        return Curves.bounceIn;
      case 'bounceOut':
        return Curves.bounceOut;
      case 'elasticIn':
        return Curves.elasticIn;
      case 'elasticOut':
        return Curves.elasticOut;
      case 'easeInOut':
      default:
        return Curves.easeInOut;
    }
  }
}
