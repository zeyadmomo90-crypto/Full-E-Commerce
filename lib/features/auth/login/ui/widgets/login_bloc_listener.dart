import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ppp/core/helpers/extentions.dart';
import 'package:ppp/core/routing/routes.dart';
import 'package:ppp/core/themes/app_colors.dart';
import 'package:ppp/features/auth/login/cubit/login_cubit.dart';
import 'package:ppp/features/auth/login/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.when(
          initial: () {
            const SizedBox();
          },
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            );
          },
          success: (_) {
            context.pop();
            context.pushNamedAndRemoveUntil(
              Routes.shopLayout,
              predicate: (route) => false,
            );
          },
          error: (apiError) {
            context.pop();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                icon: const Icon(Icons.error),
                content: Text(apiError.message ?? ''),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      'Go it',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
