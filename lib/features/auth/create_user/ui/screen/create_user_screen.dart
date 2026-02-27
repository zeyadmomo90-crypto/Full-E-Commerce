import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppp/core/helpers/spacing.dart';
import 'package:ppp/core/themes/app_colors.dart';
import 'package:ppp/features/auth/create_user/logic/cubit/create_user_cubit.dart';
import 'package:ppp/features/auth/create_user/ui/widgets/already_have_account.dart';
import 'package:ppp/features/auth/create_user/ui/widgets/create_user_bloc_listener.dart';
import 'package:ppp/features/auth/create_user/ui/widgets/create_user_form.dart';
import 'package:ppp/features/auth/login/ui/widgets/teems_and_condition.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CreateUserForm(),
                verticalSpace(25),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      createUserAndThenGoToProductScreen(context);
                    },
                    child: Text(
                      'Create Account',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(color: AppColors.background),
                    ),
                  ),
                ),
                verticalSpace(25),
                const TermsAndConditions(),
                verticalSpace(25),
                const AlreadyHaveAccount(),
                const CreateUserBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createUserAndThenGoToProductScreen(BuildContext context) {
    if (context.read<CreateUserCubit>().formKey.currentState!.validate()) {
      context.read<CreateUserCubit>().createUser();
    }
  }
}
