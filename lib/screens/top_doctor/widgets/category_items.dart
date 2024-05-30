import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({
    super.key,
    required this.title,
    required this.day,
    required this.subtitle,
    required this.isSelected,
    required this.onTap, this.isBusy,
  });

  final String title;
  final String day;
  final String subtitle;
  final bool isSelected;
  final bool? isBusy;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.we()),
      child: TextButton(
        style: TextButton.styleFrom(
          animationDuration: const Duration(seconds: 2),
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 6.h,
          ),
          backgroundColor: isSelected ? AppColors.c_2972FE : Colors.white10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
            side: BorderSide(
              width: 2.w,
              color: subtitle == day ? AppColors.c_2972FE : AppColors.c_93B8FE.withOpacity(0.1),
            ),
          ),
        ),
        onPressed: isBusy! ? (){}:( subtitle == ''
            ? onTap
            : subtitle == day
            ? onTap
            : null),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$title ',
              style: TextStyle(
                color: isSelected ? AppColors.white : AppColors.c_2972FE,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: isSelected ? AppColors.white : AppColors.c_2972FE,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
