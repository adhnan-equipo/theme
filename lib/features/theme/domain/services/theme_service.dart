import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/theme_model.dart';

class ThemeService {
  ThemeData generateLightTheme(ThemeModel themeModel) {
    FlexColorScheme flexScheme;

    if (themeModel.primaryColor != null) {
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

        fontFamily:
            themeModel.useGoogleFonts
                ? GoogleFonts.getFont(themeModel.fontFamily).fontFamily
                : themeModel.fontFamily,

        useMaterial3: themeModel.useMaterial3,
      );
    } else {
      flexScheme = FlexColorScheme.light(
        scheme: themeModel.colorScheme,
        surfaceMode: themeModel.surfaceMode,
        blendLevel: themeModel.blendLevel,

        fontFamily:
            themeModel.useGoogleFonts
                ? GoogleFonts.getFont(themeModel.fontFamily).fontFamily
                : themeModel.fontFamily,

        useMaterial3: themeModel.useMaterial3,
      );
    }

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

    ThemeData themeData = flexScheme.toTheme;

    TextTheme? customTextTheme;
    if (themeModel.useGoogleFonts) {
      customTextTheme = GoogleFonts.getTextTheme(
        themeModel.fontFamily,
        themeData.textTheme,
      ).apply(
        fontSizeFactor: themeModel.textScaleFactor,
        bodyColor: themeData.textTheme.bodyLarge?.color,
        displayColor: themeData.textTheme.displayLarge?.color,
      );
    }

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

      textTheme: customTextTheme,

      iconTheme: IconThemeData(
        color: themeModel.primaryIconColor,
        size: themeModel.iconSize,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: themeModel.appBarBackgroundColor,
        foregroundColor: themeModel.appBarForegroundColor,
        centerTitle: themeModel.appBarCenterTitle,
        elevation: themeModel.appBarElevation,
        iconTheme: IconThemeData(
          color: themeModel.appBarIconColor,
          size: themeModel.iconSize,
        ),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: themeModel.bottomNavBackgroundColor,
        selectedItemColor: themeModel.bottomNavSelectedItemColor,
        unselectedItemColor: themeModel.bottomNavUnselectedItemColor,
        elevation: themeModel.bottomNavElevation,
        showSelectedLabels: themeModel.bottomNavShowSelectedLabels,
        showUnselectedLabels: themeModel.bottomNavShowUnselectedLabels,
      ),

      cardTheme: CardTheme(
        elevation: themeModel.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(themeModel.cardBorderRadius),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: themeModel.elevatedButtonForegroundColor,
          backgroundColor: themeModel.elevatedButtonBackgroundColor,
          elevation: themeModel.elevatedButtonElevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(themeModel.buttonBorderRadius),
          ),
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          foregroundColor: themeModel.filledButtonForegroundColor,
          backgroundColor: themeModel.filledButtonBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(themeModel.buttonBorderRadius),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: themeModel.textButtonForegroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(themeModel.borderRadius),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: themeModel.outlinedButtonForegroundColor,
          side: BorderSide(
            color:
                themeModel.outlinedButtonBorderColor ??
                themeData.colorScheme.outline,
            width: themeModel.outlinedButtonBorderWidth,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(themeModel.borderRadius),
          ),
        ),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: themeModel.fabBackgroundColor,
        foregroundColor: themeModel.fabForegroundColor,
        elevation: themeModel.fabElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(themeModel.fabBorderRadius),
        ),
        extendedPadding:
            themeModel.fabExtended
                ? const EdgeInsets.symmetric(horizontal: 20, vertical: 16)
                : const EdgeInsets.all(16),
      ),

      inputDecorationTheme: InputDecorationTheme(
        fillColor: themeModel.textFieldFillColor,
        filled: themeModel.textFieldIsFilled,
        isDense: themeModel.textFieldIsDense,
        labelStyle: TextStyle(color: themeModel.textFieldLabelColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(themeModel.textFieldBorderRadius),
          borderSide: BorderSide(
            color:
                themeModel.textFieldBorderColor ??
                themeData.colorScheme.outline,
            width: themeModel.textFieldBorderWidth,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(themeModel.textFieldBorderRadius),
          borderSide: BorderSide(
            color:
                themeModel.textFieldBorderColor ??
                themeData.colorScheme.outline,
            width: themeModel.textFieldBorderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(themeModel.textFieldBorderRadius),
          borderSide: BorderSide(
            color:
                themeModel.textFieldFocusedBorderColor ??
                themeData.colorScheme.primary,
            width: themeModel.textFieldFocusedBorderWidth,
          ),
        ),
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.selected)) {
            return themeModel.checkboxFillColor;
          }
          return null;
        }),
        checkColor: MaterialStateProperty.all(themeModel.checkboxCheckColor),
        side: MaterialStateBorderSide.resolveWith((states) {
          return BorderSide(
            width: themeModel.checkboxBorderWidth,

            color:
                themeModel.checkboxFillColor ?? themeData.colorScheme.primary,
          );
        }),
        shape:
            themeModel.checkboxIsCircular
                ? const CircleBorder()
                : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
      ),

      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.selected)) {
            return themeModel.radioFillColor;
          }

          return null;
        }),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),

      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.selected)) {
            return themeModel.switchThumbColor;
          }

          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.selected)) {
            return themeModel.switchActiveTrackColor;
          }
          return themeModel.switchTrackColor;
        }),
      ),

      listTileTheme: ListTileThemeData(
        textColor: themeModel.listTileTextColor,
        iconColor: themeModel.listTileIconColor,
        selectedColor: themeModel.listTileSelectedColor,

        contentPadding: EdgeInsets.symmetric(
          horizontal: themeModel.listTileHorizontalPadding,
          vertical: themeModel.listTileVerticalPadding,
        ),
        dense: themeModel.listTileDense,
      ),

      dialogTheme: DialogTheme(
        backgroundColor: themeModel.dialogBackgroundColor,
        elevation: themeModel.dialogElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(themeModel.dialogBorderRadius),
        ),
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: themeModel.snackBarBackgroundColor,
        contentTextStyle: TextStyle(color: themeModel.snackBarTextColor),
        actionTextColor: themeModel.snackBarActionColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(themeModel.snackBarBorderRadius),
        ),
        elevation: themeModel.snackBarElevation,
      ),

      dividerTheme: DividerThemeData(
        color: themeModel.dividerColor,
        thickness: themeModel.dividerThickness,
        indent: themeModel.dividerIndent,
        endIndent: themeModel.dividerIndent,
      ),

      tabBarTheme: TabBarTheme(
        labelColor: themeModel.tabBarLabelColor,
        unselectedLabelColor: themeModel.tabBarUnselectedLabelColor,
        indicatorColor: themeModel.tabBarIndicatorColor,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: themeModel.tabBarIndicatorWeight,
            color:
                themeModel.tabBarIndicatorColor ??
                themeData.colorScheme.primary,
          ),
        ),
      ),

      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: themeModel.navigationRailBackgroundColor,
        selectedIconTheme: IconThemeData(
          color: themeModel.navigationRailSelectedIconColor,
          size: themeModel.iconSize,
        ),
        unselectedIconTheme: IconThemeData(
          color: themeModel.navigationRailUnselectedIconColor,
          size: themeModel.iconSize,
        ),
        selectedLabelTextStyle: TextStyle(
          color: themeModel.navigationRailSelectedLabelColor,
        ),
        unselectedLabelTextStyle: TextStyle(
          color: themeModel.navigationRailUnselectedLabelColor,
        ),
        elevation: themeModel.navigationRailElevation,
        minWidth: themeModel.navigationRailWidth,
        useIndicator: true,
        indicatorColor: themeModel.navigationRailIndicatorColor,

        labelType:
            themeModel.navigationRailLabelType
                ? NavigationRailLabelType.all
                : NavigationRailLabelType.none,
      ),

      drawerTheme: DrawerThemeData(
        backgroundColor: themeModel.drawerBackgroundColor,
        elevation: themeModel.elevatedButtonElevation,
        width: themeModel.drawerWidth,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(themeModel.drawerBorderRadius),
            bottomLeft: Radius.circular(themeModel.drawerBorderRadius),
          ),
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
    FlexColorScheme flexScheme;

    if (themeModel.primaryColor != null) {
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

        fontFamily:
            themeModel.useGoogleFonts
                ? GoogleFonts.getFont(themeModel.fontFamily).fontFamily
                : themeModel.fontFamily,

        useMaterial3: themeModel.useMaterial3,
      );
    } else {
      flexScheme = FlexColorScheme.dark(
        scheme: themeModel.colorScheme,
        surfaceMode: themeModel.surfaceMode,
        blendLevel: themeModel.darkBlendLevel,
        darkIsTrueBlack: themeModel.darkIsTrueBlack,

        fontFamily:
            themeModel.useGoogleFonts
                ? GoogleFonts.getFont(themeModel.fontFamily).fontFamily
                : themeModel.fontFamily,

        useMaterial3: themeModel.useMaterial3,
      );
    }

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

    ThemeData themeData = flexScheme.toTheme;

    TextTheme? customTextTheme;
    if (themeModel.useGoogleFonts) {
      customTextTheme = GoogleFonts.getTextTheme(
        themeModel.fontFamily,
        themeData.textTheme,
      ).apply(
        fontSizeFactor: themeModel.textScaleFactor,
        bodyColor: themeData.textTheme.bodyLarge?.color,
        displayColor: themeData.textTheme.displayLarge?.color,
      );
    }

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

      textTheme: customTextTheme,

      iconTheme: IconThemeData(
        color: themeModel.primaryIconColor,
        size: themeModel.iconSize,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: themeModel.appBarBackgroundColor,
        foregroundColor: themeModel.appBarForegroundColor,
        centerTitle: themeModel.appBarCenterTitle,
        elevation: themeModel.appBarElevation,
        iconTheme: IconThemeData(
          color: themeModel.appBarIconColor,
          size: themeModel.iconSize,
        ),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: themeModel.bottomNavBackgroundColor,
        selectedItemColor: themeModel.bottomNavSelectedItemColor,
        unselectedItemColor: themeModel.bottomNavUnselectedItemColor,
        elevation: themeModel.bottomNavElevation,
        showSelectedLabels: themeModel.bottomNavShowSelectedLabels,
        showUnselectedLabels: themeModel.bottomNavShowUnselectedLabels,
      ),

      cardTheme: CardTheme(
        elevation: themeModel.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(themeModel.cardBorderRadius),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: themeModel.elevatedButtonForegroundColor,
          backgroundColor: themeModel.elevatedButtonBackgroundColor,
          elevation: themeModel.elevatedButtonElevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(themeModel.buttonBorderRadius),
          ),
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          foregroundColor: themeModel.filledButtonForegroundColor,
          backgroundColor: themeModel.filledButtonBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(themeModel.buttonBorderRadius),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: themeModel.textButtonForegroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(themeModel.borderRadius),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: themeModel.outlinedButtonForegroundColor,
          side: BorderSide(
            color:
                themeModel.outlinedButtonBorderColor ??
                themeData.colorScheme.outline,
            width: themeModel.outlinedButtonBorderWidth,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(themeModel.borderRadius),
          ),
        ),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: themeModel.fabBackgroundColor,
        foregroundColor: themeModel.fabForegroundColor,
        elevation: themeModel.fabElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(themeModel.fabBorderRadius),
        ),
        extendedPadding:
            themeModel.fabExtended
                ? const EdgeInsets.symmetric(horizontal: 20, vertical: 16)
                : const EdgeInsets.all(16),
      ),

      inputDecorationTheme: InputDecorationTheme(
        fillColor: themeModel.textFieldFillColor,
        filled: themeModel.textFieldIsFilled,
        isDense: themeModel.textFieldIsDense,
        labelStyle: TextStyle(color: themeModel.textFieldLabelColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(themeModel.textFieldBorderRadius),
          borderSide: BorderSide(
            color:
                themeModel.textFieldBorderColor ??
                themeData.colorScheme.outline,
            width: themeModel.textFieldBorderWidth,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(themeModel.textFieldBorderRadius),
          borderSide: BorderSide(
            color:
                themeModel.textFieldBorderColor ??
                themeData.colorScheme.outline,
            width: themeModel.textFieldBorderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(themeModel.textFieldBorderRadius),
          borderSide: BorderSide(
            color:
                themeModel.textFieldFocusedBorderColor ??
                themeData.colorScheme.primary,
            width: themeModel.textFieldFocusedBorderWidth,
          ),
        ),
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.selected)) {
            return themeModel.checkboxFillColor;
          }
          return null;
        }),
        checkColor: MaterialStateProperty.all(themeModel.checkboxCheckColor),
        side: MaterialStateBorderSide.resolveWith((states) {
          return BorderSide(
            width: themeModel.checkboxBorderWidth,

            color:
                themeModel.checkboxFillColor ?? themeData.colorScheme.primary,
          );
        }),
        shape:
            themeModel.checkboxIsCircular
                ? const CircleBorder()
                : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
      ),

      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.selected)) {
            return themeModel.radioFillColor;
          }

          return null;
        }),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),

      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.selected)) {
            return themeModel.switchThumbColor;
          }

          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.selected)) {
            return themeModel.switchActiveTrackColor;
          }
          return themeModel.switchTrackColor;
        }),
      ),

      listTileTheme: ListTileThemeData(
        textColor: themeModel.listTileTextColor,
        iconColor: themeModel.listTileIconColor,
        selectedColor: themeModel.listTileSelectedColor,

        contentPadding: EdgeInsets.symmetric(
          horizontal: themeModel.listTileHorizontalPadding,
          vertical: themeModel.listTileVerticalPadding,
        ),
        dense: themeModel.listTileDense,
      ),

      dialogTheme: DialogTheme(
        backgroundColor: themeModel.dialogBackgroundColor,
        elevation: themeModel.dialogElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(themeModel.dialogBorderRadius),
        ),
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: themeModel.snackBarBackgroundColor,
        contentTextStyle: TextStyle(color: themeModel.snackBarTextColor),
        actionTextColor: themeModel.snackBarActionColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(themeModel.snackBarBorderRadius),
        ),
        elevation: themeModel.snackBarElevation,
      ),

      dividerTheme: DividerThemeData(
        color: themeModel.dividerColor,
        thickness: themeModel.dividerThickness,
        indent: themeModel.dividerIndent,
        endIndent: themeModel.dividerIndent,
      ),

      tabBarTheme: TabBarTheme(
        labelColor: themeModel.tabBarLabelColor,
        unselectedLabelColor: themeModel.tabBarUnselectedLabelColor,
        indicatorColor: themeModel.tabBarIndicatorColor,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: themeModel.tabBarIndicatorWeight,
            color:
                themeModel.tabBarIndicatorColor ??
                themeData.colorScheme.primary,
          ),
        ),
      ),

      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: themeModel.navigationRailBackgroundColor,
        selectedIconTheme: IconThemeData(
          color: themeModel.navigationRailSelectedIconColor,
          size: themeModel.iconSize,
        ),
        unselectedIconTheme: IconThemeData(
          color: themeModel.navigationRailUnselectedIconColor,
          size: themeModel.iconSize,
        ),
        selectedLabelTextStyle: TextStyle(
          color: themeModel.navigationRailSelectedLabelColor,
        ),
        unselectedLabelTextStyle: TextStyle(
          color: themeModel.navigationRailUnselectedLabelColor,
        ),
        elevation: themeModel.navigationRailElevation,
        minWidth: themeModel.navigationRailWidth,
        useIndicator: true,
        indicatorColor: themeModel.navigationRailIndicatorColor,

        labelType:
            themeModel.navigationRailLabelType
                ? NavigationRailLabelType.all
                : NavigationRailLabelType.none,
      ),

      drawerTheme: DrawerThemeData(
        backgroundColor: themeModel.drawerBackgroundColor,
        elevation: themeModel.elevatedButtonElevation,
        width: themeModel.drawerWidth,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(themeModel.drawerBorderRadius),
            bottomLeft: Radius.circular(themeModel.drawerBorderRadius),
          ),
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
