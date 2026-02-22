import 'package:ppp/core/networking/api_handler.dart';
import 'package:ppp/core/networking/api_result.dart';
import 'package:ppp/core/networking/api_service.dart';
import 'package:ppp/features/products/data/model/product_model.dart';

class GetProductRepo {
  final ApiService apiService;

  GetProductRepo(this.apiService);

  Future<ApiResult<List<ProductModel>>> getAllProducts() async {
    try {
      final response = await apiService.getProducts();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
