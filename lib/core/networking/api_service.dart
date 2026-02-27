import 'package:dio/dio.dart';
import 'package:ppp/core/networking/api_constants.dart';
import 'package:ppp/features/auth/create_user/data/models/create_user_request.dart';
import 'package:ppp/features/auth/create_user/data/models/create_user_response.dart';
import 'package:ppp/features/auth/login/data/models/login_request.dart';
import 'package:ppp/features/auth/login/data/models/login_response.dart';
import 'package:ppp/features/products/data/model/product_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;
  @GET(ApiConstants.products)
  Future<List<ProductModel>> getProducts();
  @GET(ApiConstants.categories)
  Future<List<Category>> getCategories();
  @GET(ApiConstants.getAllProductsByCategory)
  Future<List<ProductModel>> getAllProductsByCategory(@Path('id') int id);
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
  @POST(ApiConstants.createUser)
  Future<CreateUserResponse> createUser(
    @Body() CreateUserRequest createUserRequset,
  );
}
