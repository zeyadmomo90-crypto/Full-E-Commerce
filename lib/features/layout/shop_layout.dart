import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ppp/features/layout/logic/cubit/bottom_nav_bar_cubit.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          final bottoNavBarCubit = context.read<BottomNavBarCubit>();
          return Scaffold(
            body: SafeArea(
              child: bottoNavBarCubit.screensBody[bottoNavBarCubit.indexItem],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              onTap: (value) {
                bottoNavBarCubit.changeIndex(value);
              },
              currentIndex: bottoNavBarCubit.indexItem,
              items: bottoNavBarCubit.bottomNavBarItems,
            ),
          );
        },
      ),
    );
  }
}
