import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ppp/core/helpers/app_regex.dart';
import 'package:ppp/core/helpers/spacing.dart';
import 'package:ppp/core/themes/app_colors.dart';
import 'package:ppp/features/auth/login/cubit/login_cubit.dart';
import 'package:ppp/features/auth/login/ui/widgets/password_validation.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool lowerCase = false;
  bool upperCase = false;
  bool number = false;
  bool minLength = false;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupControllerListener();
  }

  void setupControllerListener() {
    passwordController.addListener(() {
      setState(() {
        lowerCase = AppRegex.hasLowerCase(passwordController.text);
        upperCase = AppRegex.hasUpperCase(passwordController.text);
        number = AppRegex.hasNumber(passwordController.text);
        minLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Form(
      key: loginCubit.formKey,
      child: Column(
        children: [
          verticalSpace(40),
          Text(
            'LogIn',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(color: Colors.blue),
          ),
          verticalSpace(30),
          TextFormField(
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            cursorColor: AppColors.primary,
            keyboardType: TextInputType.emailAddress,
            controller: loginCubit.emailController,
            decoration: const InputDecoration(
              hintText: 'Enter your email...',
              labelText: 'Email',
              prefixIcon: Icon(Icons.email_outlined, color: AppColors.primary),
            ),
          ),
          verticalSpace(25),
          TextFormField(
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password';
              }
              return null;
            },
            obscureText: loginCubit.isObscure,
            cursorColor: AppColors.primary,
            keyboardType: TextInputType.emailAddress,
            controller: loginCubit.passwordController,
            decoration: InputDecoration(
              hintText: 'Enter your password...',
              labelText: 'Password',
              prefixIcon: const Icon(Icons.lock, color: AppColors.primary),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    loginCubit.obscurePassword();
                  });
                },
                child: loginCubit.isObscure
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
            ),
          ),
          verticalSpace(25),
          PasswordValidation(
            lowerCase: lowerCase,
            upperCase: upperCase,
            number: number,
            minLength: minLength,
          ),
        ],
      ),
    );
  }
}
