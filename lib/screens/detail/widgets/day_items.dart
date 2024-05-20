import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayItems extends StatelessWidget {
  const DayItems({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(12.r),
          onTap: onTap,
          child: Container(
            width: 60.w,
            height: 88.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                width: 1.w,
                color: AppColors.c_2972FE,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.c_2972FE,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: AppColors.c_2972FE,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        12.getW(),
      ],
    );
  }
}
