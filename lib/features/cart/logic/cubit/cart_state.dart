part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = CartLoading;
  const factory CartState.error(ApiErrorModel error) = CartError;
  const factory CartState.loaded(List<CartModel> cart) = CartLoaded;
}
