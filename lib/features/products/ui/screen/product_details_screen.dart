import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppp/core/helpers/spacing.dart';
import 'package:ppp/core/widgets/custom_rich_text.dart';
import 'package:ppp/features/cart/data/model/cart_model.dart';
import 'package:ppp/features/cart/logic/cubit/cart_cubit.dart';
import 'package:ppp/features/products/data/model/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productModel});

  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  imageUrl: productModel.images?.first ?? '',
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              verticalSpace(7),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRichText(
                        title: 'Title',
                        value: productModel.title ?? '',
                      ),
                      CustomRichText(
                        title: 'Description',
                        value: productModel.description ?? '',
                      ),
                      CustomRichText(
                        title: 'Price',
                        value: "\$${productModel.price ?? ""}",
                      ),
                      CustomRichText(
                        title: 'Category',
                        value: productModel.category?.name ?? '',
                      ),
                      CustomRichText(
                        title: 'Slug',
                        value: productModel.slug ?? '',
                      ),
                      verticalSpace(15),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          minimumSize: Size(double.infinity, 50.h),
                        ),
                        onPressed: () async {
                          final cartModel = CartModel(
                            title: productModel.title,
                            images: productModel.images != null
                                ? [productModel.images!.first]
                                : [],
                            price: productModel.price,
                            quantity: 1,
                          );
                          await context.read<CartCubit>().insertToCart(
                            cartModel,
                          );
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Product added to cart'),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
