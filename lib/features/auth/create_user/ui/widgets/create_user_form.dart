import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ppp/core/helpers/app_regex.dart';
import 'package:ppp/core/helpers/spacing.dart';
import 'package:ppp/core/themes/app_colors.dart';
import 'package:ppp/features/auth/create_user/logic/cubit/create_user_cubit.dart';
import 'package:ppp/features/auth/login/ui/widgets/password_validation.dart';

class CreateUserForm extends StatefulWidget {
  const CreateUserForm({super.key});

  @override
  State<CreateUserForm> createState() => _CreateUserFormState();
}

class _CreateUserFormState extends State<CreateUserForm> {
  bool lowerCase = false;
  bool upperCase = false;
  bool number = false;
  bool minLength = false;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<CreateUserCubit>().passwordController;
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

  bool isObscurePassword = false;
  bool isObscureConfirmPassword = false;
  @override
  Widget build(BuildContext context) {
    final createUserCubit = context.read<CreateUserCubit>();
    return Form(
      key: createUserCubit.formKey,
      child: Column(
        children: [
          verticalSpace(30),
          Text(
            'Create Account',
            style: Theme.of(
              context,
            ).textTheme.headlineLarge?.copyWith(color: AppColors.primary),
          ),
          verticalSpace(20),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
              return null;
            },
            cursorColor: AppColors.primary,
            keyboardType: TextInputType.name,
            controller: createUserCubit.nameController,
            decoration: const InputDecoration(
              hintText: 'Enter your Name...',
              labelText: 'Name',
              prefixIcon: Icon(Icons.person, color: AppColors.primary),
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid Email';
              }
              return null;
            },
            cursorColor: AppColors.primary,
            keyboardType: TextInputType.emailAddress,
            controller: createUserCubit.emailController,
            decoration: const InputDecoration(
              hintText: 'Enter your email...',
              labelText: 'Email',
              prefixIcon: Icon(Icons.email_outlined, color: AppColors.primary),
            ),
          ),
          verticalSpace(20),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid Password';
              }
              return null;
            },
            obscureText: isObscurePassword,
            cursorColor: AppColors.primary,
            keyboardType: TextInputType.text,
            controller: createUserCubit.passwordController,
            decoration: InputDecoration(
              hintText: 'Enter your password...',
              labelText: 'Password',
              prefixIcon: const Icon(Icons.lock, color: AppColors.primary),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscurePassword = !isObscurePassword;
                  });
                },
                child: isObscurePassword
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
            ),
          ),
          verticalSpace(20),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid Password';
              }
              return null;
            },
            obscureText: isObscureConfirmPassword,
            cursorColor: AppColors.primary,
            keyboardType: TextInputType.text,
            controller: createUserCubit.confirmPasswordController,
            decoration: InputDecoration(
              hintText: 'Confirmation your password...',
              labelText: 'Confirm',
              prefixIcon: const Icon(Icons.lock, color: AppColors.primary),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureConfirmPassword = !isObscureConfirmPassword;
                  });
                },
                child: isObscureConfirmPassword
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
            ),
          ),
          verticalSpace(20),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid Picture';
              }
              return null;
            },
            controller: createUserCubit.userPicController,
            keyboardType: TextInputType.url,
            decoration: const InputDecoration(
              hintText: 'Enter your picture url...',
              labelText: 'Picture',
              prefixIcon: Icon(Icons.image, color: AppColors.primary),
            ),
          ),
          verticalSpace(20),
          PasswordValidation(
            lowerCase: lowerCase,
            upperCase: upperCase,
            // specialChar: specialChar,
            number: number,
            minLength: minLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
