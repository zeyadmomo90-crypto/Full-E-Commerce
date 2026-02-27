import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppp/core/networking/api_error_model.dart';
import 'package:ppp/core/networking/api_result.dart';
import 'package:ppp/features/favorite/data/model/favorite_model.dart';
import 'package:ppp/features/favorite/data/repo/favorite_repos.dart';

part 'favorite_cubit.freezed.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  bool isSelected = false;
  final FavoriteRepos favoriteRepos;
  FavoriteCubit(this.favoriteRepos) : super(const FavoriteState.initial());
  Future<void> getFavoriteProducts() async {
    emit(const FavoriteState.loading());
    final result = await favoriteRepos.getProductReo();
    result.when(
      success: (result) => emit(FavoriteState.loaded(result)),
      failure: (failure) => emit(FavoriteState.error(failure)),
    );
  }

  Future<void> insertProduct(FavoriteModel model) async {
    final inserting = await favoriteRepos.insertProductReo(model);
    inserting.when(
      success: (_) async {
        await getFavoriteProducts();
      },
      failure: (failure) => emit(FavoriteState.error(failure)),
    );
  }

  Future<void> updatingProduct(FavoriteModel model) async {
    final inserting = await favoriteRepos.udateProductReo(model);
    inserting.when(
      success: (_) async {
        await getFavoriteProducts();
      },
      failure: (failure) => emit(FavoriteState.error(failure)),
    );
  }

  Future<void> deletingProduct(int id) async {
    final inserting = await favoriteRepos.deleteProductReo(id);
    inserting.when(
      success: (_) async {
        await getFavoriteProducts();
      },
      failure: (failure) => emit(FavoriteState.error(failure)),
    );
  }

  void changeState() {
    isSelected = !isSelected;
    final currentState = state;
    if (currentState is Loaded) {
      emit(currentState.copyWith(change: isSelected));
    }
  }
}
