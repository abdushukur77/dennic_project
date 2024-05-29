import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:dennic_project/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/formatter/input_formatter.dart';

class PhoneNumberInput extends StatelessWidget {
  final TextEditingController controller;

  const PhoneNumberInput({required this.controller, Key? key})
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
                  text: "Phone Number",
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
          child: TextFormField(
            inputFormatters: [AppInputFormatters.phoneFormatter],
            controller: controller,
            maxLength: 17,
            onChanged: (value) {},
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "errorText";
              } else {
                return null;
              }
            },
            obscureText: false,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 12.h,
              ),
              filled: true,
              fillColor: AppColors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide: BorderSide(
                  color: AppColors.c_EBEEF2,
                  width: 1.we(),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide: BorderSide(
                  color: AppColors.c_EBEEF2,
                  width: 1.we(),
                ),
              ),
              hintText: "Phone Number",
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
