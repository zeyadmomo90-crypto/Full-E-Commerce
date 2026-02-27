part of 'favorite_cubit.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = _Initial;
  const factory FavoriteState.loading() = Loading;
  const factory FavoriteState.loaded(
    List<FavoriteModel> products, {
    @Default(false) bool change,
  }) = Loaded;
  const factory FavoriteState.error(ApiErrorModel error) = Error;
}
