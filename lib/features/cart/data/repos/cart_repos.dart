import 'package:ppp/core/helpers/database_helper.dart';
import 'package:ppp/core/networking/api_handler.dart';
import 'package:ppp/core/networking/api_result.dart';
import 'package:ppp/features/cart/data/model/cart_model.dart';

class CartRepos {
  final DatabaseHelper databaseHelper;

  CartRepos(this.databaseHelper);
  Future<ApiResult<void>> insertToCartRepo(CartModel model) async {
    try {
      final addCartProducts = databaseHelper.insertToCart(model);
      return ApiResult.success(addCartProducts);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> updateCartRepo(CartModel model) async {
    try {
      final updateCartProducts = databaseHelper.updatedCart(model);
      return ApiResult.success(updateCartProducts);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> deleteCartRepo(int id) async {
    try {
      final deleteCartProducts = databaseHelper.deleteFromCart(id);
      return ApiResult.success(deleteCartProducts);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<CartModel>>> getCartProductRepo() async {
    try {
      final getCartProducts = await databaseHelper.getCart();
      return ApiResult.success(getCartProducts);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
