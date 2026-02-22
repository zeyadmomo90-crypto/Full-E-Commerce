import 'package:dio/dio.dart';
import 'package:ppp/core/networking/api_constants.dart';
import 'package:ppp/features/products/data/model/product_model.dart';
import 'package:retrofit/retrofit.dart';

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
}
