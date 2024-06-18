import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProblemDescriptionInput extends StatelessWidget {
  final TextEditingController controller;
  final TextInputAction textInputAction;

  const ProblemDescriptionInput(
      {required this.controller, Key? key, required this.textInputAction})
      : super(key: key);

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
                  text: "Problem Description",
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
            boxShadow: [
              BoxShadow(
                color: AppColors.c_5A6CEA.withOpacity(0.08),
                blurRadius: 50.r,
                offset: const Offset(12.0, 26.0),
                spreadRadius: 0,
              )
            ],
          ),
          child: TextField(
            textInputAction: TextInputAction.next,
            controller: controller,
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 12.h,
              ),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide(
                  color: AppColors.cEBEEF2,
                  width: 1.w,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide(
                  color: AppColors.c_2972FE,
                  width: 1.w,
                ),
              ),
              hintText: "Problem Description",
              hintStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                height: 1.5.h,
                color: const Color(0xFFDADEE3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
