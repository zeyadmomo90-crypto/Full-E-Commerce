import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppp/core/networking/api_error_model.dart';

part 'create_user_state.freezed.dart';

@freezed
class CreateUserState<T> with _$CreateUserState<T> {
  const factory CreateUserState.initial() = _Initial;

  const factory CreateUserState.loading() = CreateUserLoading;

  const factory CreateUserState.success(T data) = CreateUserSuccess<T>;

  const factory CreateUserState.failure(ApiErrorModel failure) =
      CreateUserFailure;
}
