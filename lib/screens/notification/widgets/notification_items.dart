import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/images/app_images.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationItems extends StatelessWidget {
  const NotificationItems({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 12.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.c_5A6CEA.withOpacity(.08),
                blurRadius: 50,
                spreadRadius: 0,
                offset: const Offset(12, 26),
              ),
            ],
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  SvgPicture.asset(
                    AppImages.alarm,
                    width: 75.w,
                    height: 73.h,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 28.h,
                    left: 34.w,
                    child: Icon(
                      Icons.lock_clock,
                      size: 20.sp,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              24.getW(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: AppColors.c_09101D,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    4.getH(),
                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.c_6D7580,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        20.getH(),
      ],
    );
  }
}
