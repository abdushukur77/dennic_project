import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 6.h,
            ),
            backgroundColor: isSelected ? AppColors.c_2972FE : AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r),
              side: BorderSide(
                width: 2.w,
                color: AppColors.c_2972FE,
              ),
            ),
          ),
          onPressed: onTap,
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? AppColors.white : AppColors.c_2972FE,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        8.getW(),
      ],
    );
  }
}
