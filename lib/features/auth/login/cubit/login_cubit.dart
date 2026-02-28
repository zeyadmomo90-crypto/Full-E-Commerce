import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ppp/core/firebase/auth_model.dart';
import 'package:ppp/core/helpers/constance.dart';
import 'package:ppp/core/helpers/storage_helper.dart';
import 'package:ppp/core/networking/api_result.dart';
import 'package:ppp/core/networking/dio_factory.dart';
import 'package:ppp/features/auth/login/cubit/login_state.dart';
import 'package:ppp/features/auth/login/data/models/login_request.dart';
import 'package:ppp/features/auth/login/data/repos/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  final AuthModel authModel;
  bool isObscure = false;
  LoginCubit(this.loginRepo, this.authModel)
    : super(const LoginState.initial());
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
      success: (loginResponse) async {
        await authModel.login(
          email: emailController.text,
          password: passwordController.text,
        );
        await saveTokenUserAfterLogin(loginResponse.accessToken ?? '');
        emit(LoginState.success(loginResponse));
      },
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

  Future<void> saveTokenUserAfterLogin(String userToken) async {
    await StorageHelper.setSecuredString(SharedPrefKeys.usertoken, userToken);
    DioFactory.setTokenIntoHeaderAfterLogin(userToken);
  }
}
