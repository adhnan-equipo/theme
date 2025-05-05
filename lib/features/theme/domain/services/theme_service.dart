// lib/features/theme/domain/services/theme_service.dart
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/theme_model.dart';

class ThemeService {
  ThemeData generateLightTheme(ThemeModel themeModel) {
    // Create a seed generated scheme or use the predefined scheme
    FlexColorScheme flexScheme;

    if (themeModel.primaryColor != null) {
      // Use custom colors if provided
      flexScheme = FlexColorScheme.light(
        colors: FlexSchemeColor(
          primary: themeModel.primaryColor!,
          secondary: themeModel.secondaryColor ?? themeModel.primaryColor!,
          tertiary:
              themeModel.tertiaryColor ??
              themeModel.secondaryColor ??
              themeModel.primaryColor!,
        ),
        surfaceMode: themeModel.surfaceMode,
        blendLevel: themeModel.blendLevel,
        // Set font family directly in FlexColorScheme
        fontFamily:
            themeModel.useGoogleFonts
                ? GoogleFonts.getFont(themeModel.fontFamily).fontFamily
                : themeModel.fontFamily,
        // Set useMaterial3 here instead of in copyWith
        useMaterial3: themeModel.useMaterial3,
      );
    } else {
      // Use predefined scheme
      flexScheme = FlexColorScheme.light(
        scheme: themeModel.colorScheme,
        surfaceMode: themeModel.surfaceMode,
        blendLevel: themeModel.blendLevel,
        // Set font family directly in FlexColorScheme
        fontFamily:
            themeModel.useGoogleFonts
                ? GoogleFonts.getFont(themeModel.fontFamily).fontFamily
                : themeModel.fontFamily,
        // Set useMaterial3 here instead of in copyWith
        useMaterial3: themeModel.useMaterial3,
      );
    }

    // Override surface colors if specified
    if (themeModel.backgroundColor != null) {
      flexScheme = flexScheme.copyWith(background: themeModel.backgroundColor);
    }

    if (themeModel.surfaceColor != null) {
      flexScheme = flexScheme.copyWith(surface: themeModel.surfaceColor);
    }

    if (themeModel.scaffoldBackgroundColor != null) {
      flexScheme = flexScheme.copyWith(
        scaffoldBackground: themeModel.scaffoldBackgroundColor,
      );
    }

    // Get the ThemeData from FlexColorScheme
    ThemeData themeData = flexScheme.toTheme;

    // Apply additional configuration
    TextTheme? customTextTheme;
    if (themeModel.useGoogleFonts) {
      // Correctly apply Google Fonts
      customTextTheme = GoogleFonts.getTextTheme(
        themeModel.fontFamily,
        themeData.textTheme,
      ).apply(
        fontSizeFactor: themeModel.textScaleFactor,
        bodyColor: themeData.textTheme.bodyLarge?.color,
        displayColor: themeData.textTheme.displayLarge?.color,
      );
    }

    // Apply additional customizations without using deprecated parameters
    return themeData.copyWith(
      pageTransitionsTheme:
          themeModel.enablePageTransitions
              ? const PageTransitionsTheme(
                builders: <TargetPlatform, PageTransitionsBuilder>{
                  TargetPlatform.android: ZoomPageTransitionsBuilder(),
                  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                },
              )
              : null,
      // Apply the custom text theme
      textTheme: customTextTheme,
      cardTheme: CardTheme(
        elevation: themeModel.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(themeModel.cardBorderRadius),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(themeModel.buttonBorderRadius),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(themeModel.textFieldBorderRadius),
        ),
      ),
      appBarTheme: AppBarTheme(elevation: themeModel.appBarElevation),
      dialogTheme: DialogTheme(
        elevation: themeModel.dialogElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(themeModel.borderRadius),
        ),
      ),
      tooltipTheme:
          themeModel.tooltipsMatchBackground
              ? TooltipThemeData(
                decoration: BoxDecoration(
                  color: themeData.colorScheme.surface,
                  borderRadius: BorderRadius.circular(themeModel.borderRadius),
                  border: Border.all(color: themeData.colorScheme.outline),
                ),
                textStyle: TextStyle(color: themeData.colorScheme.onSurface),
              )
              : null,
    );
  }

  ThemeData generateDarkTheme(ThemeModel themeModel) {
    // Create a seed generated scheme or use the predefined scheme
    FlexColorScheme flexScheme;

    if (themeModel.primaryColor != null) {
      // Use custom colors if provided
      flexScheme = FlexColorScheme.dark(
        colors: FlexSchemeColor(
          primary: themeModel.primaryColor!,
          secondary: themeModel.secondaryColor ?? themeModel.primaryColor!,
          tertiary:
              themeModel.tertiaryColor ??
              themeModel.secondaryColor ??
              themeModel.primaryColor!,
        ),
        surfaceMode: themeModel.surfaceMode,
        blendLevel: themeModel.darkBlendLevel,
        darkIsTrueBlack: themeModel.darkIsTrueBlack,
        // Set font family directly in FlexColorScheme
        fontFamily:
            themeModel.useGoogleFonts
                ? GoogleFonts.getFont(themeModel.fontFamily).fontFamily
                : themeModel.fontFamily,
        // Set useMaterial3 here instead of in copyWith
        useMaterial3: themeModel.useMaterial3,
      );
    } else {
      // Use predefined scheme
      flexScheme = FlexColorScheme.dark(
        scheme: themeModel.colorScheme,
        surfaceMode: themeModel.surfaceMode,
        blendLevel: themeModel.darkBlendLevel,
        darkIsTrueBlack: themeModel.darkIsTrueBlack,
        // Set font family directly in FlexColorScheme
        fontFamily:
            themeModel.useGoogleFonts
                ? GoogleFonts.getFont(themeModel.fontFamily).fontFamily
                : themeModel.fontFamily,
        // Set useMaterial3 here instead of in copyWith
        useMaterial3: themeModel.useMaterial3,
      );
    }

    // Override surface colors if specified
    if (themeModel.backgroundColor != null) {
      flexScheme = flexScheme.copyWith(background: themeModel.backgroundColor);
    }

    if (themeModel.surfaceColor != null) {
      flexScheme = flexScheme.copyWith(surface: themeModel.surfaceColor);
    }

    if (themeModel.scaffoldBackgroundColor != null) {
      flexScheme = flexScheme.copyWith(
        scaffoldBackground: themeModel.scaffoldBackgroundColor,
      );
    }

    // Get the ThemeData from FlexColorScheme
    ThemeData themeData = flexScheme.toTheme;

    // Apply additional configuration
    TextTheme? customTextTheme;
    if (themeModel.useGoogleFonts) {
      // Correctly apply Google Fonts
      customTextTheme = GoogleFonts.getTextTheme(
        themeModel.fontFamily,
        themeData.textTheme,
      ).apply(
        fontSizeFactor: themeModel.textScaleFactor,
        bodyColor: themeData.textTheme.bodyLarge?.color,
        displayColor: themeData.textTheme.displayLarge?.color,
      );
    }

    // Apply additional customizations without using deprecated parameters
    return themeData.copyWith(
      pageTransitionsTheme:
          themeModel.enablePageTransitions
              ? const PageTransitionsTheme(
                builders: <TargetPlatform, PageTransitionsBuilder>{
                  TargetPlatform.android: ZoomPageTransitionsBuilder(),
                  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                },
              )
              : null,
      // Apply the custom text theme
      textTheme: customTextTheme,
      cardTheme: CardTheme(
        elevation: themeModel.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(themeModel.cardBorderRadius),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(themeModel.buttonBorderRadius),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(themeModel.textFieldBorderRadius),
        ),
      ),
      appBarTheme: AppBarTheme(elevation: themeModel.appBarElevation),
      dialogTheme: DialogTheme(
        elevation: themeModel.dialogElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(themeModel.borderRadius),
        ),
      ),

      tooltipTheme:
          themeModel.tooltipsMatchBackground
              ? TooltipThemeData(
                decoration: BoxDecoration(
                  color: themeData.colorScheme.surface,
                  borderRadius: BorderRadius.circular(themeModel.borderRadius),
                  border: Border.all(color: themeData.colorScheme.outline),
                ),
                textStyle: TextStyle(color: themeData.colorScheme.onSurface),
              )
              : null,
    );
  }

  AnimationStyle generateAnimationStyle(ThemeModel themeModel) {
    return AnimationStyle(
      curve: themeModel.animationCurve,
      duration: themeModel.animationDuration,
    );
  }
}
