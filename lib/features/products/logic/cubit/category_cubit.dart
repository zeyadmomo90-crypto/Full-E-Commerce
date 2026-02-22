import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppp/core/networking/api_error_model.dart';
import 'package:ppp/core/networking/api_result.dart';
import 'package:ppp/features/products/data/model/product_model.dart';
import 'package:ppp/features/products/data/repos/category_repo.dart';

part 'category_cubit.freezed.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo categoryRepo;
  CategoryCubit(this.categoryRepo) : super(const CategoryState.initial());

  Future<void> getCategories() async {
    emit(const CategoryState.categoryLoading());

    final result = await categoryRepo.getCategories();

    result.when(
      success: (categories) => emit(
        CategoryState.categoryLoaded(
          categories: categories,
          selectedId: categories.isNotEmpty ? categories.first.id! : 0,
        ),
      ),
      failure: (failure) => emit(CategoryState.categoryFailure(failure)),
    );
  }

  void changeCategory(int id) {
    if (state is CategoryLoaded) {
      final currentCategory = state as CategoryLoaded;
      emit(
        CategoryState.categoryLoaded(
          categories: currentCategory.categories,
          selectedId: id,
        ),
      );
    }
  }
}
