import 'package:dennic_project/screens/tab_box/appointment/patient_screen/create_patient_screen.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryInput extends StatelessWidget {
  const CountryInput({super.key, required this.onTap});

  final VoidCallback onTap;

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
                  text: "Country",
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
        InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 24.w,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(100.r),
              border: Border.all(
                width: 1.w,
                color: AppColors.cEBEEF2,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.c_5A6CEA.withOpacity(0.08),
                  blurRadius: 50.r,
                  offset: const Offset(12.0, 26.0),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Text(
              selectedCountry ?? "Country",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                height: 1.5.h,
                color: selectedCountry == null
                    ? const Color(0xFFDADEE3)
                    : AppColors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
