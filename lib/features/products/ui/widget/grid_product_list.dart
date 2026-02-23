import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ppp/core/helpers/spacing.dart';
import 'package:ppp/core/routing/routers.dart';
import 'package:ppp/features/products/data/model/product_model.dart';
import 'package:ppp/features/products/logic/cubit/product_cubit.dart';

class GridProductList extends StatelessWidget {
  const GridProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.blue),
          );
        } else if (state is ProductFailure) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.blue),
          );
        } else if (state is ProductLoaded) {
          final list = state.data;
          return SizedBox(
            height: 400.h,
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: list.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.75,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ProductItem(productModel: list[index]);
              },
            ),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final ProductModel productModel;
  const ProductItem({super.key, required this.productModel});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routers.detailsProductScreen, extra: productModel);
      },
      child: Container(
        padding: EdgeInsets.all(10.w),
        color: Colors.grey.shade300,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  imageUrl: productModel.images?.first ?? '',
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            verticalSpace(7),
            Text(
              'Title : ${productModel.title ?? ''} ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            verticalSpace(7),
            Text(
              'Description : ${productModel.description ?? ''} ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.black),
            ),
            verticalSpace(7),
            Text(
              'Price : \$${productModel.price}',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
