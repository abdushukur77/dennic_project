import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientsItems extends StatelessWidget {
  const PatientsItems({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 44.w,
          height: 44.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            color: AppColors.c_2972FE.withOpacity(.1),
          ),
          child: Icon(
            icon,
            size: 20.sp,
            color: AppColors.c_2972FE,
          ),
        ),
        10.getH(),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.c_2972FE,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        2.getH(),
        Text(
          subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.c_09101D,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
