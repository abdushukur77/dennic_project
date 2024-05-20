import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarItem extends StatelessWidget {
  const AvatarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          maxRadius: 50.r,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Image.asset(
              AppImages.doctor,
              width: 100.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: AppColors.c_2972FE,
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Icon(
                Icons.edit,
                size: 13.sp,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
