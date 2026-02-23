import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ppp/core/helpers/spacing.dart';
import 'package:ppp/core/logic/toggle_theme_cubit/toggle_theme_cubit.dart';
import 'package:ppp/core/routing/routers.dart';
import 'package:ppp/core/themes/dark_theme.dart';
import 'package:ppp/core/themes/light_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: () {
              final currentTheme = context.read<ToggleThemeCubit>().state;
              final newTheme = currentTheme == LightTheme.lightTheme
                  ? DarkTheme.darkTheme
                  : LightTheme.lightTheme;
              context.read<ToggleThemeCubit>().toggleTheme(newTheme);
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.blue.shade200],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset('assets/images/shopping-apps.jpg'),
              ),
              verticalSpace(10),
              Text(
                'Welcome to Our Shopping App',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              verticalSpace(10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.pushReplacement(Routers.shopLayout);
                  },
                  child: Text(
                    'Go Started',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
