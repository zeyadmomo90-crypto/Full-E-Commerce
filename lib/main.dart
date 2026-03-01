import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppp/core/di/dependency_injection.dart';
import 'package:ppp/core/helpers/constance.dart';
import 'package:ppp/core/helpers/database_helper.dart';
import 'package:ppp/core/helpers/storage_helper.dart';
import 'package:ppp/core/logic/app_setting/get_initial_app_setting.dart';
import 'package:ppp/core/routing/app_router.dart';
import 'package:ppp/e_commerce_app.dart';
import 'package:ppp/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await DatabaseHelper.initDb();
  await StorageHelper.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ScreenUtil.ensureScreenSize();
  await getUserToken();
  final setting = await getInitialAppSetting();
  runApp(
    FullEcommerceApp(
      initialTheme: setting.theme,
      initialLocale: setting.locale,
      appRouter: AppRouter(),
    ),
  );
}

Future<void> getUserToken() async {
  final userLoggedIn = await StorageHelper.getSecuredString(
    SharedPrefKeys.usertoken,
  );
  if (!userLoggedIn.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
