import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.blue,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: 65.w,
              top: 10.h,
              bottom: 10.h,
              left: 10.w,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: TextField(
              style: Theme.of(context).textTheme.bodyMedium,
              textInputAction: TextInputAction.search,
              onChanged: (value) {
                // context.read<ProductCubit>().searchProduct(value);
                // context.read<CategoryCubit>().searchCategory(value);
              },
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search for products and categories',
                hintStyle: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.notifications, color: Colors.white, size: 24.sp),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
