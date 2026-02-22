import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ppp/features/cart/ui/screen/cart_screen.dart';
import 'package:ppp/features/products/ui/screen/product_screen.dart';
import 'package:ppp/features/testing/favorite_screen.dart';
import 'package:ppp/features/testing/profile_screen.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());
  int indexItem = 0;
  List<BottomNavigationBarItem> bottomNavBarItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Products'),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: 'Cart',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favorites',
    ),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];
  List<Widget> screensBody = [
    const ProductScreen(),
    const CartScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  void changeIndex(int index) {
    indexItem = index;
    emit(ChangeBottomNavBar());
  }
}
