import 'package:ppp/core/networking/api_handler.dart';
import 'package:ppp/core/networking/api_result.dart';
import 'package:ppp/features/favorite/data/favorite_database.dart';
import 'package:ppp/features/favorite/data/model/favorite_model.dart';

class FavoriteRepos {
  final FavoriteDatabase favoriteDatabase;

  FavoriteRepos(this.favoriteDatabase);

  Future<ApiResult<List<FavoriteModel>>> getProductReo() async {
    try {
      final response = await favoriteDatabase.getFavoriteProducts();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> insertProductReo(FavoriteModel model) async {
    try {
      final response = await favoriteDatabase.insert(model);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> udateProductReo(FavoriteModel model) async {
    try {
      final response = await favoriteDatabase.update(model);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> deleteProductReo(int id) async {
    try {
      final response = await favoriteDatabase.delete(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
