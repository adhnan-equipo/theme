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
}
