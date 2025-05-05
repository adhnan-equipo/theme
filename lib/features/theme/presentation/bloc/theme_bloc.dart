// lib/features/theme/presentation/bloc/theme_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/theme_model.dart';
import '../../data/repositories/theme_repository.dart';
import '../../domain/services/theme_service.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepository _themeRepository;
  final ThemeService _themeService;

  ThemeBloc({
    required ThemeRepository themeRepository,
    required ThemeService themeService,
  }) : _themeRepository = themeRepository,
       _themeService = themeService,
       super(const ThemeState()) {
    on<InitializeThemeEvent>(_onInitializeTheme);
    on<ChangeThemeModeEvent>(_onChangeThemeMode);
    on<ChangeColorSchemeEvent>(_onChangeColorScheme);
    on<ChangeSurfaceModeEvent>(_onChangeSurfaceMode);
    on<ChangeBlendLevelEvent>(_onChangeBlendLevel);
    on<ChangePrimaryColorEvent>(_onChangePrimaryColor);
    on<ChangeSecondaryColorEvent>(_onChangeSecondaryColor);
    on<ChangeTertiaryColorEvent>(_onChangeTertiaryColor);
    on<ChangeBackgroundColorEvent>(_onChangeBackgroundColor);
    on<ChangeSurfaceColorEvent>(_onChangeSurfaceColor);
    on<ChangeScaffoldBackgroundColorEvent>(_onChangeScaffoldBackgroundColor);
    on<ChangeSurfaceElevationEvent>(_onChangeSurfaceElevation);
    on<ChangeFontFamilyEvent>(_onChangeFontFamily);
    on<ChangeTextScaleFactorEvent>(_onChangeTextScaleFactor);
    on<ChangeUseM3TypographyEvent>(_onChangeUseM3Typography);
    on<ChangeUseGoogleFontsEvent>(_onChangeUseGoogleFonts);
    on<ChangeTitleFontWeightEvent>(_onChangeTitleFontWeight);
    on<ChangeBodyFontWeightEvent>(_onChangeBodyFontWeight);
    on<ChangeBorderRadiusEvent>(_onChangeBorderRadius);
    on<ChangeCardBorderRadiusEvent>(_onChangeCardBorderRadius);
    on<ChangeButtonBorderRadiusEvent>(_onChangeButtonBorderRadius);
    on<ChangeTextFieldBorderRadiusEvent>(_onChangeTextFieldBorderRadius);
    on<ChangeAppBarElevationEvent>(_onChangeAppBarElevation);
    on<ChangeCardElevationEvent>(_onChangeCardElevation);
    on<ChangeDialogElevationEvent>(_onChangeDialogElevation);
    on<ChangeAdaptiveStylingEvent>(_onChangeAdaptiveStyling);
    on<ChangeDarkIsTrueBlackEvent>(_onChangeDarkIsTrueBlack);
    on<ChangeDarkUsesLightSurfaceEvent>(_onChangeDarkUsesLightSurface);
    on<ChangeDarkBlendLevelEvent>(_onChangeDarkBlendLevel);
    on<ChangeDarkSurfaceOpacityEvent>(_onChangeDarkSurfaceOpacity);
    on<ChangeUseMaterial3Event>(_onChangeUseMaterial3);
    on<ChangeSwapLegacyColorsEvent>(_onChangeSwapLegacyColors);
    on<ChangeUseMaterial3ErrorColorsEvent>(_onChangeUseMaterial3ErrorColors);
    on<ChangeAdaptNavigationBarEvent>(_onChangeAdaptNavigationBar);
    on<ChangeTintedDisabledControlsEvent>(_onChangeTintedDisabledControls);
    on<ChangeAnimationCurveEvent>(_onChangeAnimationCurve);
    on<ChangeAnimationDurationEvent>(_onChangeAnimationDuration);
    on<ChangeEnableAnimationsEvent>(_onChangeEnableAnimations);
    on<ChangeEnablePageTransitionsEvent>(_onChangeEnablePageTransitions);
    on<ChangeTooltipsMatchBackgroundEvent>(_onChangeTooltipsMatchBackground);
    on<ChangeTransparentStatusBarEvent>(_onChangeTransparentStatusBar);
    on<ChangeApplyElevationOverlayColorEvent>(
      _onChangeApplyElevationOverlayColor,
    );
    on<ChangeTransparentNavigationBarEvent>(_onChangeTransparentNavigationBar);
    on<ResetThemeEvent>(_onResetTheme);

    on<ChangeAppBarBackgroundColorEvent>(_onChangeAppBarBackgroundColor);
    on<ChangeAppBarForegroundColorEvent>(_onChangeAppBarForegroundColor);
    on<ChangeAppBarCenterTitleEvent>(_onChangeAppBarCenterTitle);

    // Icon Theming
    on<ChangePrimaryIconColorEvent>(_onChangePrimaryIconColor);
    on<ChangeAppBarIconColorEvent>(_onChangeAppBarIconColor);
    on<ChangeIconSizeEvent>(_onChangeIconSize);

    // Bottom Navigation
    on<ChangeBottomNavBackgroundColorEvent>(_onChangeBottomNavBackgroundColor);
    on<ChangeBottomNavSelectedItemColorEvent>(
      _onChangeBottomNavSelectedItemColor,
    );
    on<ChangeBottomNavUnselectedItemColorEvent>(
      _onChangeBottomNavUnselectedItemColor,
    );
    on<ChangeBottomNavElevationEvent>(_onChangeBottomNavElevation);
    on<ChangeBottomNavShowSelectedLabelsEvent>(
      _onChangeBottomNavShowSelectedLabels,
    );
    on<ChangeBottomNavShowUnselectedLabelsEvent>(
      _onChangeBottomNavShowUnselectedLabels,
    );

    // Button Customization
    on<ChangeElevatedButtonBackgroundColorEvent>(
      _onChangeElevatedButtonBackgroundColor,
    );
    on<ChangeElevatedButtonForegroundColorEvent>(
      _onChangeElevatedButtonForegroundColor,
    );
    on<ChangeElevatedButtonElevationEvent>(_onChangeElevatedButtonElevation);
    on<ChangeFilledButtonBackgroundColorEvent>(
      _onChangeFilledButtonBackgroundColor,
    );
    on<ChangeFilledButtonForegroundColorEvent>(
      _onChangeFilledButtonForegroundColor,
    );
    on<ChangeTextButtonForegroundColorEvent>(
      _onChangeTextButtonForegroundColor,
    );
    on<ChangeOutlinedButtonForegroundColorEvent>(
      _onChangeOutlinedButtonForegroundColor,
    );
    on<ChangeOutlinedButtonBorderColorEvent>(
      _onChangeOutlinedButtonBorderColor,
    );
    on<ChangeOutlinedButtonBorderWidthEvent>(
      _onChangeOutlinedButtonBorderWidth,
    );
    on<ChangeFabBackgroundColorEvent>(_onChangeFabBackgroundColor);
    on<ChangeFabForegroundColorEvent>(_onChangeFabForegroundColor);
    on<ChangeFabBorderRadiusEvent>(_onChangeFabBorderRadius);
    on<ChangeFabElevationEvent>(_onChangeFabElevation);
    on<ChangeFabExtendedEvent>(_onChangeFabExtended);

    // Input Controls
    on<ChangeTextFieldFillColorEvent>(_onChangeTextFieldFillColor);
    on<ChangeTextFieldBorderColorEvent>(_onChangeTextFieldBorderColor);
    on<ChangeTextFieldFocusedBorderColorEvent>(
      _onChangeTextFieldFocusedBorderColor,
    );
    on<ChangeTextFieldLabelColorEvent>(_onChangeTextFieldLabelColor);
    on<ChangeTextFieldBorderWidthEvent>(_onChangeTextFieldBorderWidth);
    on<ChangeTextFieldFocusedBorderWidthEvent>(
      _onChangeTextFieldFocusedBorderWidth,
    );
    on<ChangeTextFieldIsFilledEvent>(_onChangeTextFieldIsFilled);
    on<ChangeTextFieldIsDenseEvent>(_onChangeTextFieldIsDense);
    on<ChangeCheckboxFillColorEvent>(_onChangeCheckboxFillColor);
    on<ChangeCheckboxCheckColorEvent>(_onChangeCheckboxCheckColor);
    on<ChangeCheckboxBorderWidthEvent>(_onChangeCheckboxBorderWidth);
    on<ChangeCheckboxIsCircularEvent>(_onChangeCheckboxIsCircular);
    on<ChangeRadioFillColorEvent>(_onChangeRadioFillColor);
    on<ChangeRadioSizeEvent>(_onChangeRadioSize);
    on<ChangeSwitchThumbColorEvent>(_onChangeSwitchThumbColor);
    on<ChangeSwitchTrackColorEvent>(_onChangeSwitchTrackColor);
    on<ChangeSwitchActiveTrackColorEvent>(_onChangeSwitchActiveTrackColor);
    on<ChangeSwitchIsMaterial3Event>(_onChangeSwitchIsMaterial3);

    // Lists and Dialogs
    on<ChangeListTileTextColorEvent>(_onChangeListTileTextColor);
    on<ChangeListTileSelectedColorEvent>(_onChangeListTileSelectedColor);
    on<ChangeListTileIconColorEvent>(_onChangeListTileIconColor);
    on<ChangeListTileHorizontalPaddingEvent>(
      _onChangeListTileHorizontalPadding,
    );
    on<ChangeListTileVerticalPaddingEvent>(_onChangeListTileVerticalPadding);
    on<ChangeListTileDenseEvent>(_onChangeListTileDense);
    on<ChangeDialogBackgroundColorEvent>(_onChangeDialogBackgroundColor);
    on<ChangeDialogBorderRadiusEvent>(_onChangeDialogBorderRadius);
    on<ChangeSnackBarBackgroundColorEvent>(_onChangeSnackBarBackgroundColor);
    on<ChangeSnackBarTextColorEvent>(_onChangeSnackBarTextColor);
    on<ChangeSnackBarActionColorEvent>(_onChangeSnackBarActionColor);
    on<ChangeSnackBarBorderRadiusEvent>(_onChangeSnackBarBorderRadius);
    on<ChangeSnackBarElevationEvent>(_onChangeSnackBarElevation);
    on<ChangeDividerColorEvent>(_onChangeDividerColor);
    on<ChangeDividerThicknessEvent>(_onChangeDividerThickness);
    on<ChangeDividerIndentEvent>(_onChangeDividerIndent);

    // Tabs and Navigation
    on<ChangeTabBarIndicatorColorEvent>(_onChangeTabBarIndicatorColor);
    on<ChangeTabBarLabelColorEvent>(_onChangeTabBarLabelColor);
    on<ChangeTabBarUnselectedLabelColorEvent>(
      _onChangeTabBarUnselectedLabelColor,
    );
    on<ChangeTabBarIndicatorWeightEvent>(_onChangeTabBarIndicatorWeight);
    on<ChangeTabBarIsScrollableEvent>(_onChangeTabBarIsScrollable);
    on<ChangeNavigationRailBackgroundColorEvent>(
      _onChangeNavigationRailBackgroundColor,
    );
    on<ChangeNavigationRailSelectedIconColorEvent>(
      _onChangeNavigationRailSelectedIconColor,
    );
    on<ChangeNavigationRailUnselectedIconColorEvent>(
      _onChangeNavigationRailUnselectedIconColor,
    );
    on<ChangeNavigationRailSelectedLabelColorEvent>(
      _onChangeNavigationRailSelectedLabelColor,
    );
    on<ChangeNavigationRailUnselectedLabelColorEvent>(
      _onChangeNavigationRailUnselectedLabelColor,
    );
    on<ChangeNavigationRailIndicatorColorEvent>(
      _onChangeNavigationRailIndicatorColor,
    );
    on<ChangeNavigationRailElevationEvent>(_onChangeNavigationRailElevation);
    on<ChangeNavigationRailWidthEvent>(_onChangeNavigationRailWidth);
    on<ChangeNavigationRailLabelTypeEvent>(_onChangeNavigationRailLabelType);
    on<ChangeDrawerBackgroundColorEvent>(_onChangeDrawerBackgroundColor);
    on<ChangeDrawerWidthEvent>(_onChangeDrawerWidth);
    on<ChangeDrawerBorderRadiusEvent>(_onChangeDrawerBorderRadius);
  }

  // Implementation for all event handlers
  Future<void> _onInitializeTheme(
    InitializeThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    emit(state.copyWith(status: ThemeStatus.loading));

    try {
      final themeModel = await _themeRepository.loadTheme();
      final lightTheme = _themeService.generateLightTheme(themeModel);
      final darkTheme = _themeService.generateDarkTheme(themeModel);

      emit(
        state.copyWith(
          status: ThemeStatus.loaded,
          themeModel: themeModel,
          lightTheme: lightTheme,
          darkTheme: darkTheme,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ThemeStatus.error,
          errorMessage: 'Failed to load theme: $e',
        ),
      );
    }
  }

  Future<void> _onChangeThemeMode(
    ChangeThemeModeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      themeMode: event.themeMode,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeColorScheme(
    ChangeColorSchemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      colorScheme: event.colorScheme,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeSurfaceMode(
    ChangeSurfaceModeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      surfaceMode: event.surfaceMode,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeBlendLevel(
    ChangeBlendLevelEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      blendLevel: event.blendLevel,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangePrimaryColor(
    ChangePrimaryColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      primaryColor: event.primaryColor,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeSecondaryColor(
    ChangeSecondaryColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      secondaryColor: event.secondaryColor,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeTertiaryColor(
    ChangeTertiaryColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      tertiaryColor: event.tertiaryColor,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeBackgroundColor(
    ChangeBackgroundColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      backgroundColor: event.backgroundColor,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeSurfaceColor(
    ChangeSurfaceColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      surfaceColor: event.surfaceColor,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeScaffoldBackgroundColor(
    ChangeScaffoldBackgroundColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      scaffoldBackgroundColor: event.scaffoldBackgroundColor,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeSurfaceElevation(
    ChangeSurfaceElevationEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      surfaceElevation: event.surfaceElevation,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeFontFamily(
    ChangeFontFamilyEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      fontFamily: event.fontFamily,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeTextScaleFactor(
    ChangeTextScaleFactorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      textScaleFactor: event.textScaleFactor,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeUseM3Typography(
    ChangeUseM3TypographyEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      useM3Typography: event.useM3Typography,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeUseGoogleFonts(
    ChangeUseGoogleFontsEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      useGoogleFonts: event.useGoogleFonts,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeTitleFontWeight(
    ChangeTitleFontWeightEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      titleFontWeight: event.titleFontWeight,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeBodyFontWeight(
    ChangeBodyFontWeightEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      bodyFontWeight: event.bodyFontWeight,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeBorderRadius(
    ChangeBorderRadiusEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      borderRadius: event.borderRadius,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeCardBorderRadius(
    ChangeCardBorderRadiusEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      cardBorderRadius: event.cardBorderRadius,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeButtonBorderRadius(
    ChangeButtonBorderRadiusEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      buttonBorderRadius: event.buttonBorderRadius,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeTextFieldBorderRadius(
    ChangeTextFieldBorderRadiusEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      textFieldBorderRadius: event.textFieldBorderRadius,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeAppBarElevation(
    ChangeAppBarElevationEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      appBarElevation: event.appBarElevation,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeCardElevation(
    ChangeCardElevationEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      cardElevation: event.cardElevation,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeDialogElevation(
    ChangeDialogElevationEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      dialogElevation: event.dialogElevation,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeAdaptiveStyling(
    ChangeAdaptiveStylingEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      adaptiveStyling: event.adaptiveStyling,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeDarkIsTrueBlack(
    ChangeDarkIsTrueBlackEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      darkIsTrueBlack: event.darkIsTrueBlack,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeDarkUsesLightSurface(
    ChangeDarkUsesLightSurfaceEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      darkUsesLightSurface: event.darkUsesLightSurface,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeDarkBlendLevel(
    ChangeDarkBlendLevelEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      darkBlendLevel: event.darkBlendLevel,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeDarkSurfaceOpacity(
    ChangeDarkSurfaceOpacityEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      darkSurfaceOpacity: event.darkSurfaceOpacity,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeUseMaterial3(
    ChangeUseMaterial3Event event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      useMaterial3: event.useMaterial3,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeSwapLegacyColors(
    ChangeSwapLegacyColorsEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      swapLegacyColors: event.swapLegacyColors,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeUseMaterial3ErrorColors(
    ChangeUseMaterial3ErrorColorsEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      useMaterial3ErrorColors: event.useMaterial3ErrorColors,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeAdaptNavigationBar(
    ChangeAdaptNavigationBarEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      adaptNavigationBar: event.adaptNavigationBar,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeTintedDisabledControls(
    ChangeTintedDisabledControlsEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      tintedDisabledControls: event.tintedDisabledControls,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeAnimationCurve(
    ChangeAnimationCurveEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      animationCurve: event.animationCurve,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeAnimationDuration(
    ChangeAnimationDurationEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      animationDuration: event.animationDuration,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeEnableAnimations(
    ChangeEnableAnimationsEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      enableAnimations: event.enableAnimations,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeEnablePageTransitions(
    ChangeEnablePageTransitionsEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      enablePageTransitions: event.enablePageTransitions,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeTooltipsMatchBackground(
    ChangeTooltipsMatchBackgroundEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      tooltipsMatchBackground: event.tooltipsMatchBackground,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeTransparentStatusBar(
    ChangeTransparentStatusBarEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      transparentStatusBar: event.transparentStatusBar,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeApplyElevationOverlayColor(
    ChangeApplyElevationOverlayColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      applyElevationOverlayColor: event.applyElevationOverlayColor,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeTransparentNavigationBar(
    ChangeTransparentNavigationBarEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      transparentNavigationBar: event.transparentNavigationBar,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onResetTheme(
    ResetThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    const defaultThemeModel = ThemeModel();

    await _updateTheme(defaultThemeModel, emit);
  }

  Future<void> _updateTheme(
    ThemeModel themeModel,
    Emitter<ThemeState> emit,
  ) async {
    try {
      final lightTheme = _themeService.generateLightTheme(themeModel);
      final darkTheme = _themeService.generateDarkTheme(themeModel);

      emit(
        state.copyWith(
          themeModel: themeModel,
          lightTheme: lightTheme,
          darkTheme: darkTheme,
        ),
      );

      await _themeRepository.saveTheme(themeModel);
    } catch (e) {
      emit(
        state.copyWith(
          status: ThemeStatus.error,
          errorMessage: 'Failed to update theme: $e',
        ),
      );
    }
  }

  Future<void> _onChangeAppBarBackgroundColor(
    ChangeAppBarBackgroundColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      appBarBackgroundColor: event.appBarBackgroundColor,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeAppBarForegroundColor(
    ChangeAppBarForegroundColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      appBarForegroundColor: event.appBarForegroundColor,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeAppBarCenterTitle(
    ChangeAppBarCenterTitleEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      appBarCenterTitle: event.appBarCenterTitle,
    );

    await _updateTheme(updatedThemeModel, emit);
  }

  // Icon Theming Handlers
  Future<void> _onChangePrimaryIconColor(
    ChangePrimaryIconColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      primaryIconColor: event.primaryIconColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeAppBarIconColor(
    ChangeAppBarIconColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      appBarIconColor: event.appBarIconColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeIconSize(
    ChangeIconSizeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      iconSize: event.iconSize,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  // Bottom Navigation Handlers
  Future<void> _onChangeBottomNavBackgroundColor(
    ChangeBottomNavBackgroundColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      bottomNavBackgroundColor: event.bottomNavBackgroundColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeBottomNavSelectedItemColor(
    ChangeBottomNavSelectedItemColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      bottomNavSelectedItemColor: event.bottomNavSelectedItemColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeBottomNavUnselectedItemColor(
    ChangeBottomNavUnselectedItemColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      bottomNavUnselectedItemColor: event.bottomNavUnselectedItemColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeBottomNavElevation(
    ChangeBottomNavElevationEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      bottomNavElevation: event.bottomNavElevation,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeBottomNavShowSelectedLabels(
    ChangeBottomNavShowSelectedLabelsEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      bottomNavShowSelectedLabels: event.bottomNavShowSelectedLabels,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeBottomNavShowUnselectedLabels(
    ChangeBottomNavShowUnselectedLabelsEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      bottomNavShowUnselectedLabels: event.bottomNavShowUnselectedLabels,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  // Button Customization Handlers
  Future<void> _onChangeElevatedButtonBackgroundColor(
    ChangeElevatedButtonBackgroundColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      elevatedButtonBackgroundColor: event.elevatedButtonBackgroundColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeElevatedButtonForegroundColor(
    ChangeElevatedButtonForegroundColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      elevatedButtonForegroundColor: event.elevatedButtonForegroundColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeElevatedButtonElevation(
    ChangeElevatedButtonElevationEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      elevatedButtonElevation: event.elevatedButtonElevation,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeFilledButtonBackgroundColor(
    ChangeFilledButtonBackgroundColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      filledButtonBackgroundColor: event.filledButtonBackgroundColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeFilledButtonForegroundColor(
    ChangeFilledButtonForegroundColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      filledButtonForegroundColor: event.filledButtonForegroundColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeTextButtonForegroundColor(
    ChangeTextButtonForegroundColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      textButtonForegroundColor: event.textButtonForegroundColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeOutlinedButtonForegroundColor(
    ChangeOutlinedButtonForegroundColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      outlinedButtonForegroundColor: event.outlinedButtonForegroundColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeOutlinedButtonBorderColor(
    ChangeOutlinedButtonBorderColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      outlinedButtonBorderColor: event.outlinedButtonBorderColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeOutlinedButtonBorderWidth(
    ChangeOutlinedButtonBorderWidthEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      outlinedButtonBorderWidth: event.outlinedButtonBorderWidth,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeFabBackgroundColor(
    ChangeFabBackgroundColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      fabBackgroundColor: event.fabBackgroundColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeFabForegroundColor(
    ChangeFabForegroundColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      fabForegroundColor: event.fabForegroundColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeFabBorderRadius(
    ChangeFabBorderRadiusEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      fabBorderRadius: event.fabBorderRadius,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeFabElevation(
    ChangeFabElevationEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      fabElevation: event.fabElevation,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeFabExtended(
    ChangeFabExtendedEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      fabExtended: event.fabExtended,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  // Input Controls Handlers
  Future<void> _onChangeTextFieldFillColor(
    ChangeTextFieldFillColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      textFieldFillColor: event.textFieldFillColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeTextFieldBorderColor(
    ChangeTextFieldBorderColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      textFieldBorderColor: event.textFieldBorderColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeTextFieldFocusedBorderColor(
    ChangeTextFieldFocusedBorderColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      textFieldFocusedBorderColor: event.textFieldFocusedBorderColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeTextFieldLabelColor(
    ChangeTextFieldLabelColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      textFieldLabelColor: event.textFieldLabelColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeTextFieldBorderWidth(
    ChangeTextFieldBorderWidthEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      textFieldBorderWidth: event.textFieldBorderWidth,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeTextFieldFocusedBorderWidth(
    ChangeTextFieldFocusedBorderWidthEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      textFieldFocusedBorderWidth: event.textFieldFocusedBorderWidth,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeTextFieldIsFilled(
    ChangeTextFieldIsFilledEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      textFieldIsFilled: event.textFieldIsFilled,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeTextFieldIsDense(
    ChangeTextFieldIsDenseEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      textFieldIsDense: event.textFieldIsDense,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeCheckboxFillColor(
    ChangeCheckboxFillColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      checkboxFillColor: event.checkboxFillColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeCheckboxCheckColor(
    ChangeCheckboxCheckColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      checkboxCheckColor: event.checkboxCheckColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeCheckboxBorderWidth(
    ChangeCheckboxBorderWidthEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      checkboxBorderWidth: event.checkboxBorderWidth,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeCheckboxIsCircular(
    ChangeCheckboxIsCircularEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      checkboxIsCircular: event.checkboxIsCircular,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeRadioFillColor(
    ChangeRadioFillColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      radioFillColor: event.radioFillColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeRadioSize(
    ChangeRadioSizeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      radioSize: event.radioSize,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeSwitchThumbColor(
    ChangeSwitchThumbColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      switchThumbColor: event.switchThumbColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeSwitchTrackColor(
    ChangeSwitchTrackColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      switchTrackColor: event.switchTrackColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeSwitchActiveTrackColor(
    ChangeSwitchActiveTrackColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      switchActiveTrackColor: event.switchActiveTrackColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeSwitchIsMaterial3(
    ChangeSwitchIsMaterial3Event event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      switchIsMaterial3: event.switchIsMaterial3,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  // Lists and Dialogs Handlers
  Future<void> _onChangeListTileTextColor(
    ChangeListTileTextColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      listTileTextColor: event.listTileTextColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeListTileSelectedColor(
    ChangeListTileSelectedColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      listTileSelectedColor: event.listTileSelectedColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeListTileIconColor(
    ChangeListTileIconColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      listTileIconColor: event.listTileIconColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeListTileHorizontalPadding(
    ChangeListTileHorizontalPaddingEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      listTileHorizontalPadding: event.listTileHorizontalPadding,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeListTileVerticalPadding(
    ChangeListTileVerticalPaddingEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      listTileVerticalPadding: event.listTileVerticalPadding,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeListTileDense(
    ChangeListTileDenseEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      listTileDense: event.listTileDense,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeDialogBackgroundColor(
    ChangeDialogBackgroundColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      dialogBackgroundColor: event.dialogBackgroundColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeDialogBorderRadius(
    ChangeDialogBorderRadiusEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      dialogBorderRadius: event.dialogBorderRadius,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeSnackBarBackgroundColor(
    ChangeSnackBarBackgroundColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      snackBarBackgroundColor: event.snackBarBackgroundColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeSnackBarTextColor(
    ChangeSnackBarTextColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      snackBarTextColor: event.snackBarTextColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeSnackBarActionColor(
    ChangeSnackBarActionColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      snackBarActionColor: event.snackBarActionColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeSnackBarBorderRadius(
    ChangeSnackBarBorderRadiusEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      snackBarBorderRadius: event.snackBarBorderRadius,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeSnackBarElevation(
    ChangeSnackBarElevationEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      snackBarElevation: event.snackBarElevation,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeDividerColor(
    ChangeDividerColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      dividerColor: event.dividerColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeDividerThickness(
    ChangeDividerThicknessEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      dividerThickness: event.dividerThickness,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeDividerIndent(
    ChangeDividerIndentEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      dividerIndent: event.dividerIndent,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  // Tabs and Navigation Handlers
  Future<void> _onChangeTabBarIndicatorColor(
    ChangeTabBarIndicatorColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      tabBarIndicatorColor: event.tabBarIndicatorColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeTabBarLabelColor(
    ChangeTabBarLabelColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      tabBarLabelColor: event.tabBarLabelColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeTabBarUnselectedLabelColor(
    ChangeTabBarUnselectedLabelColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      tabBarUnselectedLabelColor: event.tabBarUnselectedLabelColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeTabBarIndicatorWeight(
    ChangeTabBarIndicatorWeightEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      tabBarIndicatorWeight: event.tabBarIndicatorWeight,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeTabBarIsScrollable(
    ChangeTabBarIsScrollableEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      tabBarIsScrollable: event.tabBarIsScrollable,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeNavigationRailBackgroundColor(
    ChangeNavigationRailBackgroundColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      navigationRailBackgroundColor: event.navigationRailBackgroundColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeNavigationRailSelectedIconColor(
    ChangeNavigationRailSelectedIconColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      navigationRailSelectedIconColor: event.navigationRailSelectedIconColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeNavigationRailUnselectedIconColor(
    ChangeNavigationRailUnselectedIconColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      navigationRailUnselectedIconColor:
          event.navigationRailUnselectedIconColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeNavigationRailSelectedLabelColor(
    ChangeNavigationRailSelectedLabelColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      navigationRailSelectedLabelColor: event.navigationRailSelectedLabelColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeNavigationRailUnselectedLabelColor(
    ChangeNavigationRailUnselectedLabelColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      navigationRailUnselectedLabelColor:
          event.navigationRailUnselectedLabelColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeNavigationRailIndicatorColor(
    ChangeNavigationRailIndicatorColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      navigationRailIndicatorColor: event.navigationRailIndicatorColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeNavigationRailElevation(
    ChangeNavigationRailElevationEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      navigationRailElevation: event.navigationRailElevation,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeNavigationRailWidth(
    ChangeNavigationRailWidthEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      navigationRailWidth: event.navigationRailWidth,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeNavigationRailLabelType(
    ChangeNavigationRailLabelTypeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      navigationRailLabelType: event.navigationRailLabelType,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeDrawerBackgroundColor(
    ChangeDrawerBackgroundColorEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      drawerBackgroundColor: event.drawerBackgroundColor,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeDrawerWidth(
    ChangeDrawerWidthEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      drawerWidth: event.drawerWidth,
    );
    await _updateTheme(updatedThemeModel, emit);
  }

  Future<void> _onChangeDrawerBorderRadius(
    ChangeDrawerBorderRadiusEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final updatedThemeModel = state.themeModel.copyWith(
      drawerBorderRadius: event.drawerBorderRadius,
    );
    await _updateTheme(updatedThemeModel, emit);
  }
}
