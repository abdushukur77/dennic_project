import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarItem extends StatelessWidget {
  const AvatarItem({super.key, required this.image, required this.onTap});

  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          maxRadius: 50.r,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Image.network(
              image,
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
            borderRadius: BorderRadius.circular(100),
            onTap: onTap,
            child: Container(
              width: 23.w,
              height: 20.h,
              decoration: BoxDecoration(
                  color: AppColors.c_2972FE,
                  borderRadius: BorderRadius.circular(100)
                  // shape: BoxShape.circle
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
