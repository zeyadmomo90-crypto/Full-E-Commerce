import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ppp/core/helpers/constance.dart';
import 'package:ppp/core/helpers/storage_helper.dart';

class ChangeLangCubit extends Cubit<Locale> {
  final Locale intialLocale;
  ChangeLangCubit(this.intialLocale) : super(intialLocale);

  void changeLanguage(Locale locale) {
    emit(locale);
    _cacheLocale(locale.languageCode);
  }

  void _cacheLocale(String languageCode) async {
    StorageHelper.setData(SharedPrefKeys.currentLangCode, languageCode);
  }
}
