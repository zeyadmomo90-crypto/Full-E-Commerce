import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ppp/core/helpers/extentions.dart';
import 'package:ppp/core/routing/routes.dart';
import 'package:ppp/core/themes/app_colors.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account? ',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushNamed(Routes.createUserScreen);
              },
            text: ' Sign Up',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
