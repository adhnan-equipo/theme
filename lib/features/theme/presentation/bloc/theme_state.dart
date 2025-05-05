// lib/features/theme/presentation/bloc/theme_state.dart
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/models/theme_model.dart';

enum ThemeStatus { initial, loading, loaded, error }

class ThemeState extends Equatable {
  final ThemeStatus status;
  final ThemeModel themeModel;
  final ThemeData? lightTheme;
  final ThemeData? darkTheme;
  final String? errorMessage;

  const ThemeState({
    this.status = ThemeStatus.initial,
    this.themeModel = const ThemeModel(),
    this.lightTheme,
    this.darkTheme,
    this.errorMessage,
  });

  ThemeState copyWith({
    ThemeStatus? status,
    ThemeModel? themeModel,
    ThemeData? lightTheme,
    ThemeData? darkTheme,
    String? errorMessage,
  }) {
    return ThemeState(
      status: status ?? this.status,
      themeModel: themeModel ?? this.themeModel,
      lightTheme: lightTheme ?? this.lightTheme,
      darkTheme: darkTheme ?? this.darkTheme,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    themeModel,
    lightTheme,
    darkTheme,
    errorMessage,
  ];
}
