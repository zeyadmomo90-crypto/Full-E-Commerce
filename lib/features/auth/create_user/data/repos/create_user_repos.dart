import 'package:ppp/core/networking/api_handler.dart';
import 'package:ppp/core/networking/api_result.dart';
import 'package:ppp/core/networking/api_service.dart';
import 'package:ppp/features/auth/create_user/data/models/create_user_request.dart';
import 'package:ppp/features/auth/create_user/data/models/create_user_response.dart';

class CreateUserRepos {
  final ApiService apiService;

  CreateUserRepos(this.apiService);

  Future<ApiResult<CreateUserResponse>> createUser(
    CreateUserRequest createUserRequset,
  ) async {
    try {
      final response = await apiService.createUser(createUserRequset);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
