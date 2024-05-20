import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 10.w,
        ),
        backgroundColor: AppColors.c_2972FE.withOpacity(.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      onPressed: onTap,
      child: icon,
    );
  }
}
