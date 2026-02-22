import 'package:ppp/core/networking/api_handler.dart';
import 'package:ppp/core/networking/api_result.dart';
import 'package:ppp/core/networking/api_service.dart';
import 'package:ppp/features/products/data/model/product_model.dart';

class GetAllProductsByCategoryRepo {
  final ApiService apiService;

  GetAllProductsByCategoryRepo(this.apiService);

  Future<ApiResult<List<ProductModel>>> getAllProductsByCategoryRepo(
    int id,
  ) async {
    try {
      final response = await apiService.getAllProductsByCategory(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
