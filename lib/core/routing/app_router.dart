import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ppp/core/di/dependency_injection.dart';
import 'package:ppp/core/routing/routes.dart';
import 'package:ppp/features/auth/create_user/logic/cubit/create_user_cubit.dart';
import 'package:ppp/features/auth/create_user/ui/screen/create_user_screen.dart';
import 'package:ppp/features/auth/login/cubit/login_cubit.dart';
import 'package:ppp/features/auth/login/ui/screen/login_screen.dart';
import 'package:ppp/features/cart/logic/cubit/cart_cubit.dart';
import 'package:ppp/features/cart/ui/screen/cart_screen.dart';
import 'package:ppp/features/favorite/logic/cubit/favorite_cubit.dart';
import 'package:ppp/features/favorite/ui/favorite_screen.dart';
import 'package:ppp/features/layout/shop_layout.dart';
import 'package:ppp/features/products/data/model/product_model.dart';
import 'package:ppp/features/products/logic/cubit/category_cubit.dart';
import 'package:ppp/features/products/logic/cubit/product_cubit.dart';
import 'package:ppp/features/products/ui/screen/product_details_screen.dart';
import 'package:ppp/features/products/ui/screen/product_screen.dart';
import 'package:ppp/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.shopLayout:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => getIt<ProductCubit>()..getAllProducts(),
              ),
              BlocProvider(
                create: (_) => getIt<CategoryCubit>()..getCategories(),
              ),
              BlocProvider(
                create: (_) => getIt<CartCubit>()..getCartProducts(),
              ),
              BlocProvider(
                create: (_) => getIt<FavoriteCubit>()..getFavoriteProducts(),
              ),
            ],
            child: const ShopLayout(),
          ),
        );

      case Routes.productScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<ProductCubit>(),
            child: const ProductScreen(),
          ),
        );

      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<CartCubit>(),
            child: const CartScreen(),
          ),
        );

      case Routes.favoriteScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<FavoriteCubit>(),
            child: const FavoriteScreen(),
          ),
        );

      case Routes.detailsProductScreen:
        final product = settings.arguments as ProductModel;

        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: getIt<ProductCubit>()),
              BlocProvider.value(value: getIt<CartCubit>()),
              BlocProvider.value(value: getIt<FavoriteCubit>()),
            ],
            child: ProductDetailsScreen(productModel: product),
          ),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.createUserScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<CreateUserCubit>(),
            child: const CreateUserScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
