import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ppp/core/di/dependency_injection.dart';
import 'package:ppp/core/routing/routers.dart';
import 'package:ppp/features/cart/logic/cubit/cart_cubit.dart';
import 'package:ppp/features/cart/ui/screen/cart_screen.dart';
import 'package:ppp/features/layout/shop_layout.dart';
import 'package:ppp/features/products/data/model/product_model.dart';
import 'package:ppp/features/products/logic/cubit/category_cubit.dart';
import 'package:ppp/features/products/logic/cubit/product_cubit.dart';
import 'package:ppp/features/products/ui/screen/product_details_screen.dart';
import 'package:ppp/features/products/ui/screen/product_screen.dart';
import 'package:ppp/features/testing/favorite_screen.dart';
import 'package:ppp/features/testing/profile_screen.dart';
import 'package:ppp/splash_screen.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routers.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),

      // Shop Layout مع كل الـ Cubits
      GoRoute(
        path: Routers.shopLayout,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => getIt<ProductCubit>()..getAllProducts(),
            ),
            BlocProvider(
              create: (_) => getIt<CategoryCubit>()..getCategories(),
            ),
            BlocProvider(create: (_) => getIt<CartCubit>()..getCartProducts()),
          ],
          child: const ShopLayout(),
        ),
      ),

      // Product Screen: نشارك نفس instances من ShopLayout
      GoRoute(
        path: Routers.productScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: context.read<ProductCubit>()),
            BlocProvider.value(value: context.read<CategoryCubit>()),
          ],
          child: const ProductScreen(),
        ),
      ),

      // Cart Screen: نشارك نفس CartCubit
      GoRoute(
        path: Routers.cartScreen,
        builder: (context, state) => BlocProvider.value(
          value: context.read<CartCubit>(),
          child: const CartScreen(),
        ),
      ),

      // Favorite Screen: بدون Cubits إضافية
      GoRoute(
        path: Routers.favoriteScreen,
        builder: (context, state) => const FavoriteScreen(),
      ),

      // Profile Screen
      GoRoute(
        path: Routers.profileScreen,
        builder: (context, state) => const ProfileScreen(),
      ),

      // Product Details Screen: نشارك نفس CartCubit
      GoRoute(
        path: Routers.detailsProductScreen,
        builder: (context, state) => BlocProvider.value(
          value: context.read<CartCubit>(),
          child: ProductDetailsScreen(
            productModel: state.extra as ProductModel,
          ),
        ),
      ),
    ],
  );
}
