import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ppp/core/di/dependency_injection.dart';
import 'package:ppp/core/helpers/database_helper.dart';
import 'package:ppp/core/helpers/storage_helper.dart';
import 'package:ppp/core/logic/app_setting/get_initial_app_setting.dart';
import 'package:ppp/firebase_options.dart';
import 'package:ppp/shop_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.initDb();
  await StorageHelper.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupGetIt();
  final setting = await getInitialAppSetting();
  runApp(
    SHoppingApp(initialTheme: setting.theme, initialLocale: setting.locale),
  );
}
