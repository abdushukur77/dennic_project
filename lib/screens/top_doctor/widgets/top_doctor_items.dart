import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../tab_box/home/widgets/ring_and_favorite_items.dart';

class TopDoctorItems extends StatelessWidget {
  const TopDoctorItems({
    super.key,
    required this.name,
    required this.description,
    required this.rate,
    required this.review,
    required this.onTap,
    required this.favoriteTap,
    required this.image,
  });

  final String name;
  final String image;
  final String description;
  final String rate;
  final String review;
  final VoidCallback onTap;
  final VoidCallback favoriteTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                bottomLeft: Radius.circular(12.r),
              ),
              child: Image.network(
                image,
                fit: BoxFit.cover,
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
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.c_09101D,
                      fontSize: 16.sp,
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
                        "$rate ($review reviews)",
                        style: TextStyle(
                          color: AppColors.c_09101D,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  3.getH(),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.c_09101D,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            10.getW(),
            RingAndFavoriteItems(
              icon: const Icon(Icons.favorite, color: AppColors.c_2972FE),
              onTap: favoriteTap,
            ),
          ],
        ),
      ),
    );
  }
}
