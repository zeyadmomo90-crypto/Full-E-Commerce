import 'package:flutter/material.dart';
import 'package:ppp/core/helpers/constance.dart';
import 'package:ppp/core/helpers/storage_helper.dart';
import 'package:ppp/core/themes/dark_theme.dart';
import 'package:ppp/core/themes/light_theme.dart';

Future<({ThemeData theme, Locale locale})> getInitialAppSetting() async {
  final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
  final deviceBrightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;
  final isDeviceDarkMode = deviceBrightness == Brightness.dark;
  await StorageHelper.init();

  final isDarkMode =
      await StorageHelper.getData(SharedPrefKeys.isDarkTheme) as bool? ??
      isDeviceDarkMode;
  final theme = isDarkMode ? DarkTheme.darkTheme : LightTheme.lightTheme;
  final currentLang =
      await StorageHelper.getData(SharedPrefKeys.currentLangCode) as String? ??
      deviceLocale.languageCode;
  final locale = currentLang == 'en'
      ? AppLanguages.getEnglishLanguage()
      : AppLanguages.getArabicLanguage();
  return (theme: theme, locale: locale);
}
