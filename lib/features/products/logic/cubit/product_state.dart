part of 'product_cubit.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.productLoading() = ProductLoading;
  const factory ProductState.productLoaded(List<ProductModel> data) =
      ProductLoaded;
  const factory ProductState.productFailure(ApiErrorModel errorModel) =
      ProductFailure;
}
