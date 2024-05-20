import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/images/app_images.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsDoctorItems extends StatelessWidget {
  const DetailsDoctorItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          width: 1.w,
          color: AppColors.c_F4F6F9,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              bottomLeft: Radius.circular(12.r),
            ),
            child: Image.asset(
              AppImages.doctor,
              width: 100.w,
              height: 100.h,
            ),
          ),
          20.getW(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr. Jenny Wilson",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.c_09101D,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                3.getH(),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 16.sp,
                      color: AppColors.c_2972FE,
                    ),
                    4.getW(),
                    Text(
                      "4.9 (3821 reviews)",
                      style: TextStyle(
                        color: AppColors.c_09101D,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                3.getH(),
                Text(
                  "Cardio Specialist - Nanyang Hospital",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.c_09101D,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
