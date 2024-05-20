import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RingAndFavoriteItems extends StatelessWidget {
  const RingAndFavoriteItems({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final VoidCallback onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size(44.w, 44.h),  // Adjusted minimum size
        padding: EdgeInsets.all(10.h),   // Adjusted padding
        backgroundColor: AppColors.c_2972FE.withOpacity(.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      onPressed: onTap,
      child: Icon(
        icon.icon,
        size: 24.w,  // Adjusted icon size
        color: icon.color,
      ),
    );
  }
}
