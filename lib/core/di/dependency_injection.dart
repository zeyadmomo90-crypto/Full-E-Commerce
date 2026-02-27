import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ppp/core/helpers/database_helper.dart';
import 'package:ppp/core/logic/change_lang_cubit/change_lang_cubit.dart';
import 'package:ppp/core/logic/change_theme_cubit/change_theme_cubit.dart';
import 'package:ppp/core/networking/api_service.dart';
import 'package:ppp/core/networking/dio_factory.dart';
import 'package:ppp/features/auth/create_user/data/repos/create_user_repos.dart';
import 'package:ppp/features/auth/create_user/logic/cubit/create_user_cubit.dart';
import 'package:ppp/features/auth/login/cubit/login_cubit.dart';
import 'package:ppp/features/auth/login/data/repos/login_repo.dart';
import 'package:ppp/features/cart/data/repos/cart_repos.dart';
import 'package:ppp/features/cart/logic/cubit/cart_cubit.dart';
import 'package:ppp/features/favorite/data/favorite_database.dart';
import 'package:ppp/features/favorite/data/repo/favorite_repos.dart';
import 'package:ppp/features/favorite/logic/cubit/favorite_cubit.dart';
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
  getIt.registerLazySingleton<FavoriteDatabase>(() => FavoriteDatabase());

  // home
  getIt.registerLazySingleton<GetProductRepo>(() => GetProductRepo(getIt()));
  getIt.registerLazySingleton<GetAllProductsByCategoryRepo>(
    () => GetAllProductsByCategoryRepo(getIt()),
  );
  // product
  getIt.registerLazySingleton<ProductCubit>(
    () => ProductCubit(getIt(), getIt()),
  );

  // Categories
  getIt.registerLazySingleton<CategoryRepo>(() => CategoryRepo(getIt()));
  getIt.registerLazySingleton<CategoryCubit>(() => CategoryCubit(getIt()));

  // cart
  getIt.registerLazySingleton<CartRepos>(() => CartRepos(getIt()));
  getIt.registerLazySingleton<CartCubit>(() => CartCubit(getIt()));

  // theme & language
  getIt.registerFactoryParam<ChangeThemeCubit, ThemeData, void>(
    (theme, _) => ChangeThemeCubit(theme),
  );

  getIt.registerFactoryParam<ChangeLangCubit, Locale, void>(
    (locale, _) => ChangeLangCubit(locale),
  );
  // favorites
  getIt.registerLazySingleton<FavoriteRepos>(() => FavoriteRepos(getIt()));
  getIt.registerLazySingleton<FavoriteCubit>(() => FavoriteCubit(getIt()));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // CreateUser
  getIt.registerLazySingleton<CreateUserRepos>(() => CreateUserRepos(getIt()));
  getIt.registerFactory<CreateUserCubit>(() => CreateUserCubit(getIt()));
}
