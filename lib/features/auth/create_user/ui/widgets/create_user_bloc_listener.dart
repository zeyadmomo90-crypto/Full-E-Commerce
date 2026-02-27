import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ppp/core/networking/api_error_model.dart';
import 'package:ppp/core/routing/routers.dart';
import 'package:ppp/core/themes/app_colors.dart';
import 'package:ppp/features/auth/create_user/logic/cubit/create_user_cubit.dart';
import 'package:ppp/features/auth/create_user/logic/cubit/create_user_state.dart';

class CreateUserBlocListener extends StatelessWidget {
  const CreateUserBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateUserCubit, CreateUserState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {
            return showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );
              },
            );
          },
          success: (_) {
            context.pop();
            showDialog(
              context: context,
              builder: (_) => showSuccessDialog(context),
            );
          },
          failure: (apiError) {
            context.pop();
            return showErrorDialog(context, apiError);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  AlertDialog showSuccessDialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Create User successfully',
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(color: AppColors.primary),
      ),
      content: Text(
        'Congratulations, you have signed up successfully!',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
            context.push(Routers.loginScreen);
          },
          child: const Text('Continue'),
        ),
      ],
    );
  }

  Future<void> showErrorDialog(BuildContext context, ApiErrorModel apiError) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(Icons.error),
          content: Text(apiError.message ?? ''),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Go It'),
            ),
          ],
        );
      },
    );
  }
}
