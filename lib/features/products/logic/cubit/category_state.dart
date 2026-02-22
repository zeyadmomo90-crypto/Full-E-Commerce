part of 'category_cubit.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;
  const factory CategoryState.categoryLoading() = CategoryLoading;

  const factory CategoryState.categoryLoaded({
    required List<Category> categories,
    required int selectedId,
  }) = CategoryLoaded;

  const factory CategoryState.categoryFailure(ApiErrorModel errorModel) =
      CategoryFailure;
}
