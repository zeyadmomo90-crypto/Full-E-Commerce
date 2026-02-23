import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppp/core/di/dependency_injection.dart';
import 'package:ppp/core/helpers/constance.dart';
import 'package:ppp/core/helpers/database_helper.dart';
import 'package:ppp/core/helpers/storage_helper.dart';
import 'package:ppp/core/logic/toggle_theme_cubit/toggle_theme_cubit.dart';
import 'package:ppp/core/routing/app_router.dart';
import 'package:ppp/core/themes/dark_theme.dart';
import 'package:ppp/core/themes/light_theme.dart';
import 'package:ppp/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.initDb();
  await StorageHelper.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  final isDarkMode = await StorageHelper.getData(SharedPrefKeys.isDarkTheme);

  final initialTheme = isDarkMode ?? false
      ? DarkTheme.darkTheme
      : LightTheme.lightTheme;

  runApp(SHoppingApp(initialTheme: initialTheme));
}

class SHoppingApp extends StatelessWidget {
  final ThemeData initialTheme;
  const SHoppingApp({super.key, required this.initialTheme});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: BlocProvider(
        create: (context) => ToggleThemeCubit(initialTheme),
        child: BlocBuilder<ToggleThemeCubit, ThemeData>(
          builder: (context, theme) {
            return MaterialApp.router(
              theme: theme,
              themeAnimationCurve: Curves.bounceInOut,
              themeAnimationDuration: const Duration(milliseconds: 400),
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.router,
            );
          },
        ),
      ),
    );
  }
}
