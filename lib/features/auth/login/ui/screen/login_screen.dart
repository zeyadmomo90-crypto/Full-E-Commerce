import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppp/core/helpers/spacing.dart';
import 'package:ppp/core/themes/app_colors.dart';
import 'package:ppp/features/auth/login/cubit/login_cubit.dart';
import 'package:ppp/features/auth/login/ui/widgets/dont_have_an_account.dart';
import 'package:ppp/features/auth/login/ui/widgets/email_password.dart';
import 'package:ppp/features/auth/login/ui/widgets/login_bloc_listener.dart';
import 'package:ppp/features/auth/login/ui/widgets/teems_and_condition.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const EmailAndPassword(),
                verticalSpace(20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                verticalSpace(50),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      loginAndThenGoToProductScreen(context);
                    },
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(color: AppColors.background),
                    ),
                  ),
                ),
                verticalSpace(25),
                const TermsAndConditions(),
                verticalSpace(60),
                const DontHaveAnAccount(),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginAndThenGoToProductScreen(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().loginProcess();
    }
  }
}
