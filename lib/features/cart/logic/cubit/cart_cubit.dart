import 'dart:developer';

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
        log(success.length.toString());
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
}
