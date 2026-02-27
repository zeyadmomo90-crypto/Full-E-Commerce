import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppp/core/networking/api_error_model.dart';
import 'package:ppp/core/networking/api_result.dart';
import 'package:ppp/features/cart/data/model/cart_model.dart';
import 'package:ppp/features/cart/data/repos/cart_repos.dart';

part 'cart_cubit.freezed.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepos cartRepos;
  CartCubit(this.cartRepos) : super(const CartState.initial());
  Future<void> getCartProducts() async {
    emit(const CartState.loading());
    final resultProduct = await cartRepos.getCartProductRepo();
    resultProduct.when(
      success: (success) {
        emit(CartState.loaded(success));
      },
      failure: (failure) => emit(CartState.error(failure)),
    );
  }

  Future<void> insertToCart(CartModel model) async {
    final resultProduct = await cartRepos.insertToCartRepo(model);

    resultProduct.when(
      success: (_) async {
        await getCartProducts();
      },
      failure: (failure) => emit(CartState.error(failure)),
    );
  }

  Future<void> updateCart(CartModel model) async {
    final resultProduct = await cartRepos.updateCartRepo(model);

    resultProduct.when(
      success: (_) async {
        await getCartProducts();
      },
      failure: (failure) => emit(CartState.error(failure)),
    );
  }

  Future<void> deleteFromCart(int id) async {
    final resultProduct = await cartRepos.deleteCartRepo(id);

    resultProduct.when(
      success: (_) async {
        await getCartProducts();
      },
      failure: (failure) => emit(CartState.error(failure)),
    );
  }

  void increment(int productId) {
    state.whenOrNull(
      loaded: (cart) {
        final updated = cart.map((item) {
          if (item.id == productId) {
            return item.copyWith(quantity: item.quantity! + 1);
          }
          return item;
        }).toList();

        emit(CartState.loaded(updated));
      },
    );
  }

  void decrement(int productId) {
    state.whenOrNull(
      loaded: (cart) {
        final updated = cart.map((cartModel) {
          if (cartModel.id == productId) {
            final newQunatity = cartModel.quantity! > 1
                ? cartModel.quantity! - 1
                : 1;
            return cartModel.copyWith(quantity: newQunatity);
          }
          return cartModel;
        }).toList();
        emit(CartState.loaded(updated));
      },
    );
  }

  double getTotalPrice(List<CartModel> cart) {
    return cart.fold<double>(
      0.0,
      (total, item) => total + ((item.price ?? 0) * (item.quantity ?? 0)),
    );
  }
}
