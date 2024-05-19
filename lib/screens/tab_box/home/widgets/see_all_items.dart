import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeeAllItems extends StatelessWidget {
  const SeeAllItems({
    super.key,
    required this.onTap,
    required this.title,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: AppTextStyle.urbanistMedium.copyWith(
          color: AppColors.c_2972FE,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
