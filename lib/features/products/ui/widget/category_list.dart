import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppp/core/helpers/spacing.dart';
import 'package:ppp/features/products/data/model/product_model.dart';
import 'package:ppp/features/products/logic/cubit/category_cubit.dart';
import 'package:ppp/features/products/logic/cubit/product_cubit.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.blue),
          );
        }

        if (state is CategoryFailure) {
          return Center(
            child: Text(state.errorModel.message ?? 'Unexpected Error'),
          );
        }

        if (state is CategoryLoaded) {
          final categoryList = state.categories;
          return SizedBox(
            height: 35.h,
            child: ListView.separated(
              separatorBuilder: (context, index) => horizontalSpace(10),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                return CategoryItem(categoryModel: categoryList[index]);
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Category categoryModel;

  const CategoryItem({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CategoryCubit, CategoryState, int>(
      selector: (state) {
        if (state is CategoryLoaded) {
          return state.selectedId;
        }
        return 0;
      },
      builder: (context, selectedId) {
        final isSelected = selectedId == categoryModel.id;

        return GestureDetector(
          onTap: () {
            context.read<CategoryCubit>().changeCategory(categoryModel.id!);

            context.read<ProductCubit>().getAllProductsByCategory(
              categoryModel.id!,
            );
          },
          child: ChoiceChip(
            selected: isSelected,
            label: Text(
              categoryModel.name ?? '',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            avatar: CachedNetworkImage(
              imageUrl: categoryModel.image ?? '',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        );
      },
    );
  }
}
