import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppp/core/helpers/spacing.dart';
import 'package:ppp/core/themes/app_colors.dart';
import 'package:ppp/core/widgets/custom_rich_text.dart';
import 'package:ppp/features/favorite/data/model/favorite_model.dart';
import 'package:ppp/features/favorite/logic/cubit/favorite_cubit.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Screen')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              if (state is Loading) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );
              }
              if (state is Error) {
                return Center(
                  child: Text(state.error.message ?? 'Unexpected Error'),
                );
              } else if (state is Loaded) {
                return ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return FavoriteItem(favoriteModel: state.products[index]);
                  },
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

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.favoriteModel});
  final FavoriteModel favoriteModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              imageUrl: favoriteModel.images?.first ?? '',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              height: 100.h,
              width: 100.w,
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomRichText(
                  title: 'Title',
                  value: favoriteModel.title ?? '',
                ),
                CustomRichText(
                  title: 'Price',
                  value: '\$${favoriteModel.price}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
