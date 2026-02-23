import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ppp/core/helpers/constance.dart';
import 'package:ppp/core/helpers/storage_helper.dart';
import 'package:ppp/core/themes/dark_theme.dart';

class ToggleThemeCubit extends Cubit<ThemeData> {
  final ThemeData initialTheme;
  ToggleThemeCubit(this.initialTheme) : super(initialTheme);

  void toggleTheme(ThemeData theme) {
    emit(theme);
    _cacheTheme(theme);
  }

  Future<void> _cacheTheme(ThemeData theme) async {
    StorageHelper.setData(
      SharedPrefKeys.isDarkTheme,
      theme == DarkTheme.darkTheme,
    );
  }
}
