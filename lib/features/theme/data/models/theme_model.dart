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
