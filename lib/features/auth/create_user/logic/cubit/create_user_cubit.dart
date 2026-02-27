import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ppp/core/networking/api_result.dart';
import 'package:ppp/features/auth/create_user/data/models/create_user_request.dart';
import 'package:ppp/features/auth/create_user/data/repos/create_user_repos.dart';
import 'package:ppp/features/auth/create_user/logic/cubit/create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  final CreateUserRepos createUserRepos;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  TextEditingController userPicController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  CreateUserCubit(this.createUserRepos)
    : super(const CreateUserState.initial());

  Future<void> createUser() async {
    emit(const CreateUserState.loading());
    final reslut = await createUserRepos.createUser(
      CreateUserRequest(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        avatar: userPicController.text,
      ),
    );

    reslut.when(
      success: (success) => emit(CreateUserState.success(success)),
      failure: (failure) => emit(CreateUserState.failure(failure)),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
    userPicController.dispose();
    // phoneController.dispose();
    return super.close();
  }
}
