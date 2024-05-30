import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BloodGroupInput extends StatefulWidget {
  const BloodGroupInput({super.key});

  @override
  State<BloodGroupInput> createState() => _BloodGroupInputState();
}

class _BloodGroupInputState extends State<BloodGroupInput> {
  @override
  Widget build(BuildContext context) {
    const List<String> list = [
      "A+",
      "A-",
      "B+",
      "B-",
      "AB+",
      "AB-",
      "O+",
      "O-",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24.w, bottom: 8.h),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Blood Group",
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
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
              ),
            ],
          ),
          child: CustomDropdown<String>(
            decoration: CustomDropdownDecoration(
              closedBorderRadius: BorderRadius.circular(25.r),
            ),
            hintText: 'Select your gender',
            items: list,
            initialItem: list.first,
            onChanged: (value) {
              setState(() {});
              bloodGroup = value;
            },
          ),
        ),
      ],
    );
  }
}

String bloodGroup = 'A+';