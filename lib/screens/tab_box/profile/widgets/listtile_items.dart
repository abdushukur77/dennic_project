import 'package:dennic_project/screens/tab_box/home/widgets/ring_and_favorite_items.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTileItems extends StatelessWidget {
  const ListTileItems({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final Icon icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 12.h),
            onTap: onTap,
            leading: RingAndFavoriteItems(
              icon: icon,
              onTap: () {},
            ),
            title: Text(
              title,
              style: TextStyle(
                color: AppColors.c_09101D,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: IconButton(
              onPressed: onTap,
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20.sp,
                color: AppColors.c_2972FE,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
