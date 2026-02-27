import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppp/core/helpers/spacing.dart';
import 'package:ppp/core/themes/app_colors.dart';

class BuildValidationRow extends StatelessWidget {
  const BuildValidationRow({
    super.key,
    required this.text,
    required this.finishVLD,
  });
  final String text;
  final bool finishVLD;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 5.r, backgroundColor: AppColors.textSecondary),
        horizontalSpace(10),
        Text(
          text,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            decoration: finishVLD ? TextDecoration.lineThrough : null,
            decorationColor: AppColors.errorDark,
            decorationThickness: 2,
            color: finishVLD ? AppColors.successDark : AppColors.backgroundDark,
          ),
        ),
      ],
    );
  }
}
