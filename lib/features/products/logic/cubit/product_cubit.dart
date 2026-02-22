import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppp/core/networking/api_error_model.dart';
import 'package:ppp/core/networking/api_result.dart';
import 'package:ppp/features/products/data/model/product_model.dart';
import 'package:ppp/features/products/data/repos/get_all_products_by_category_repo.dart';
import 'package:ppp/features/products/data/repos/get_product_repo.dart';

part 'product_cubit.freezed.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProductRepo getProductRepo;
  final GetAllProductsByCategoryRepo getAllProductsByCategoryRepo;
  ProductCubit(this.getProductRepo, this.getAllProductsByCategoryRepo)
    : super(const ProductState.initial());

  Future<void> getAllProducts() async {
    emit(const ProductState.productLoading());
    final result = await getProductRepo.getAllProducts();

    result.when(
      success: (success) => emit(ProductState.productLoaded(success)),
      failure: (failure) => emit(ProductState.productFailure(failure)),
    );
  }

  Future<void> getAllProductsByCategory(int id) async {
    emit(const ProductState.productLoading());
    final resultData = await getAllProductsByCategoryRepo
        .getAllProductsByCategoryRepo(id);
    resultData.when(
      success: (success) => emit(ProductState.productLoaded(success)),
      failure: (failure) => emit(ProductState.productFailure(failure)),
    );
  }
}
