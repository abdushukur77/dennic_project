import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dennic_project/screens/top_doctor/widgets/category_items.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';

class AgeRangeSelection extends StatelessWidget {
  final List<String> ages;
  final int actIndex;
  final Function(int) onSelected;

  AgeRangeSelection({
    required this.ages,
    required this.actIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24.w, bottom: 8.h),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Select Your Age Range",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    color: AppColors.c_2C3A4B,
                  ),
                ),
                TextSpan(
                  text: "*",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFFDA1414),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Wrap(
          spacing: 4.w,
          children: [
            ...List.generate(ages.length, (index) {
              return CategoryItems(
                title: ages[index],
                isSelected: actIndex == index,
                onTap: () => onSelected(index),
              );
            })
          ],
        ),
      ],
    );
  }
}
