import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpecialistScreenItems extends StatelessWidget {
  const SpecialistScreenItems({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color1,
    required this.onTap,
  });

  final String icon;
  final String title;
  final String subtitle;
  final Color color1;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 24.h,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r), color: color1),
        child: Column(
          children: [
            SvgPicture.network(
              icon,
              width: 43.w,
              height: 40.h,
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            ),
            16.getH(),
            Text(
              textAlign: TextAlign.center,
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            8.getH(),
            Text(
              textAlign: TextAlign.center,
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
