import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ppp/core/networking/api_result.dart';
import 'package:ppp/features/auth/login/cubit/login_state.dart';
import 'package:ppp/features/auth/login/data/models/login_request.dart';
import 'package:ppp/features/auth/login/data/repos/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  bool isObscure = false;
  LoginCubit(this.loginRepo) : super(const LoginState.initial());
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> loginProcess() async {
    emit(const LoginState.loading());

    final result = await loginRepo.loginRepo(
      LoginRequest(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.when(
      success: (success) => emit(LoginState.success(success)),
      failure: (failure) => emit(LoginState.error(failure)),
    );
  }

  void obscurePassword() {
    isObscure = !isObscure;
    emit(state);
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
