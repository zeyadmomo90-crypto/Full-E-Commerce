import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ppp/core/helpers/database_helper.dart';
import 'package:ppp/core/networking/api_service.dart';
import 'package:ppp/core/networking/dio_factory.dart';
import 'package:ppp/features/cart/data/repos/cart_repos.dart';
import 'package:ppp/features/cart/logic/cubit/cart_cubit.dart';
import 'package:ppp/features/products/data/repos/category_repo.dart';
import 'package:ppp/features/products/data/repos/get_all_products_by_category_repo.dart';
import 'package:ppp/features/products/data/repos/get_product_repo.dart';
import 'package:ppp/features/products/logic/cubit/category_cubit.dart';
import 'package:ppp/features/products/logic/cubit/product_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Api
  final Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Database
  getIt.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // home
  getIt.registerLazySingleton<GetProductRepo>(() => GetProductRepo(getIt()));
  getIt.registerLazySingleton<GetAllProductsByCategoryRepo>(
    () => GetAllProductsByCategoryRepo(getIt()),
  );

  getIt.registerFactory<ProductCubit>(() => ProductCubit(getIt(), getIt()));

  // Categories
  getIt.registerLazySingleton<CategoryRepo>(() => CategoryRepo(getIt()));
  getIt.registerFactory<CategoryCubit>(() => CategoryCubit(getIt()));

  // cart
  getIt.registerLazySingleton<CartRepos>(() => CartRepos(getIt()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt()));
}


  // login
  // getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  // getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  // getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  // getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));



