import 'package:ppp/core/networking/api_handler.dart';
import 'package:ppp/core/networking/api_result.dart';
import 'package:ppp/core/networking/api_service.dart';
import 'package:ppp/features/auth/login/data/models/login_request.dart';
import 'package:ppp/features/auth/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo(this.apiService);

  Future<ApiResult<LoginResponse>> loginRepo(LoginRequest loginRequest) async {
    try {
      final response = await apiService.login(loginRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
