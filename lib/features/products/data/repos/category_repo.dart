import 'package:ppp/core/networking/api_handler.dart';
import 'package:ppp/core/networking/api_result.dart';
import 'package:ppp/core/networking/api_service.dart';
import 'package:ppp/features/products/data/model/product_model.dart';

class CategoryRepo {
  final ApiService apiService;

  CategoryRepo(this.apiService);

  Future<ApiResult<List<Category>>> getCategories() async {
    try {
      final response = await apiService.getCategories();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
