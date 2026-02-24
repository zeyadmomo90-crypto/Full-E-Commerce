import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppp/core/logic/toggle_lang_cubit/toggle_lang_cubit.dart';
import 'package:ppp/core/logic/toggle_theme_cubit/toggle_theme_cubit.dart';
import 'package:ppp/core/routing/app_router.dart';
import 'package:ppp/generated/l10n.dart';

class SHoppingApp extends StatelessWidget {
  final ThemeData initialTheme;
  final Locale initialLocale;
  const SHoppingApp({
    super.key,
    required this.initialTheme,
    required this.initialLocale,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ToggleThemeCubit(initialTheme)),
          BlocProvider(create: (context) => ToggleLangCubit(initialLocale)),
        ],
        child: BlocBuilder<ToggleThemeCubit, ThemeData>(
          builder: (context, theme) {
            return BlocBuilder<ToggleLangCubit, Locale>(
              builder: (context, locale) {
                return MaterialApp.router(
                  theme: theme,
                  themeAnimationCurve: Curves.bounceInOut,
                  themeAnimationDuration: const Duration(milliseconds: 400),
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  locale: locale,
                  debugShowCheckedModeBanner: false,
                  routerConfig: AppRouter.router,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
