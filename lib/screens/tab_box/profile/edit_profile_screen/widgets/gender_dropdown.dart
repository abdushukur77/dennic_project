import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';

class GenderDropdown extends StatelessWidget {
  final int? selectedGender;
  final Function(int?) onChanged;

  const GenderDropdown({super.key,
    required this.selectedGender,
    required this.onChanged,
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
        Container(
          width: double.infinity,
          height: 48.h,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: AppColors.cEBEEF2,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(100.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.c_5A6CEA.withOpacity(0.08),
                blurRadius: 50.r,
                offset: const Offset(12.0, 26.0),
                spreadRadius: 0,
              ),
            ],
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: selectedGender,
              items: [
                DropdownMenuItem(
                  value: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      "male",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        color: AppColors.c_09101D,
                      ),
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      "female",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        color: AppColors.c_09101D,
                      ),
                    ),
                  ),
                ),
              ],
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
