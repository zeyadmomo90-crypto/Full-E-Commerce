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
              style: TextStyle(fontSize: 16.sp),
              textInputAction: TextInputAction.search,
              onChanged: (value) {
                // context.read<ProductCubit>().searchProduct(value);
                // context.read<CategoryCubit>().searchCategory(value);
              },
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: Colors.blue, size: 24.sp),
                hintText: 'Search for products and categories',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Padding(
                padding: EdgeInsets.only(right: 10.w, bottom: 10.h),
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
