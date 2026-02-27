import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppp/core/helpers/spacing.dart';
import 'package:ppp/features/cart/data/model/cart_model.dart';
import 'package:ppp/features/cart/logic/cubit/cart_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartModel});
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10.r),
            child: CachedNetworkImage(
              imageUrl: cartModel.images?.first ?? '',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: 70.w,
              height: 70.h,
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpace(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  cartModel.title ?? '',
                  style: Theme.of(
                    context,
                  ).textTheme.displayMedium?.copyWith(color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(7),
                Text(
                  '\$${cartModel.price}',
                  style: Theme.of(
                    context,
                  ).textTheme.displaySmall?.copyWith(color: Colors.green),
                ),
                verticalSpace(10),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<CartCubit>().increment(cartModel.id ?? 0);
                      },
                      icon: const Icon(Icons.add),
                    ),
                    Text(
                      '${cartModel.quantity}',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CartCubit>().decrement(cartModel.id ?? 0);
                      },
                      icon: const Icon(Icons.remove),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
