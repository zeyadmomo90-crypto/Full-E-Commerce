import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppp/core/helpers/spacing.dart';
import 'package:ppp/features/cart/logic/cubit/cart_cubit.dart';
import 'package:ppp/features/cart/ui/widgets/cart_item.dart';
import 'package:ppp/features/cart/ui/widgets/price_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                );
              } else if (state is CartError) {
                return Center(
                  child: Text(state.error.message ?? 'Unexpected Error'),
                );
              } else if (state is CartLoaded) {
                final total = context.read<CartCubit>().getTotalPrice(
                  state.cart,
                );
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => verticalSpace(10),
                        itemCount: state.cart.length,
                        itemBuilder: (context, index) {
                          return CartItem(cartModel: state.cart[index]);
                        },
                      ),
                    ),
                    verticalSpace(10),
                    PriceItem(total: total),
                    verticalSpace(10),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
