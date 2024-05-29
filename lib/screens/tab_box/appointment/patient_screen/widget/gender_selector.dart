import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderSelector extends StatelessWidget {
  final int? selectedGender;
  final ValueChanged<int?> onChanged;

  const GenderSelector({
    required this.selectedGender,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

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
                  text: "Gender",
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
        Row(
          children: [
            Radio<int>(
              value: 1,
              groupValue: selectedGender,
              onChanged: onChanged,
            ),
            Text(
              "Male",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.c_2C3A4B,
              ),
            ),
            SizedBox(width: 20.w),
            Radio<int>(
              value: 2,
              groupValue: selectedGender,
              onChanged: onChanged,
            ),
            Text(
              "Female",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.c_2C3A4B,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
