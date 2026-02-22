import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppp/core/helpers/spacing.dart';
import 'package:ppp/features/products/ui/widget/category_list.dart';
import 'package:ppp/features/products/ui/widget/custom_app_bar.dart';
import 'package:ppp/features/products/ui/widget/grid_product_list.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const CustomAppBar(),
                  verticalSpace(10),
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  verticalSpace(5),
                  const CategoryList(),
                  verticalSpace(5),
                  Divider(color: Colors.grey, thickness: 3.w),
                  verticalSpace(5),
                  Text(
                    'Popular Products',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  verticalSpace(5),
                  const GridProductList(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
