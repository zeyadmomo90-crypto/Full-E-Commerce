import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppp/core/di/dependency_injection.dart';
import 'package:ppp/core/helpers/constance.dart';
import 'package:ppp/core/logic/change_lang_cubit/change_lang_cubit.dart';
import 'package:ppp/core/logic/change_theme_cubit/change_theme_cubit.dart';
import 'package:ppp/core/routing/app_router.dart';
import 'package:ppp/core/routing/routes.dart';
import 'package:ppp/generated/l10n.dart';

class FullEcommerceApp extends StatelessWidget {
  final ThemeData initialTheme;
  final Locale initialLocale;
  final AppRouter appRouter;
  const FullEcommerceApp({
    super.key,
    required this.initialTheme,
    required this.initialLocale,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => getIt<ChangeThemeCubit>(param1: initialTheme),
          ),
          BlocProvider(
            create: (_) => getIt<ChangeLangCubit>(param1: initialLocale),
          ),
        ],
        child: BlocBuilder<ChangeThemeCubit, ThemeData>(
          builder: (context, theme) {
            return BlocBuilder<ChangeLangCubit, Locale>(
              builder: (context, locale) {
                return MaterialApp(
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
                  onGenerateRoute: appRouter.generateRoute,
                  initialRoute: isLoggedInUser
                      ? Routes.shopLayout
                      : Routes.loginScreen,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
