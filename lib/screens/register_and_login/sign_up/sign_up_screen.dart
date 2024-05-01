import 'package:dennic_project/screens/register_and_login/widget/my_text_from.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/images/app_images.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:dennic_project/utils/styles/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obthorText = true;
  bool chek = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.cFFFFFF,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            AppImages.arrowLeft,
            width: 24.we(),
            height: 24.he(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.we()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.getH(),
            Text(
              "Sign Up",
              style: AppTextStyle.urbanistBold.copyWith(
                color: AppColors.c1D1E25,
                fontSize: 24.sp,
              ),
            ),
            8.getH(),
            Text(
              "Create account and enjoy all services",
              style: AppTextStyle.urbanistRegular.copyWith(
                color: AppColors.c808D9E,
                fontSize: 16.sp,
              ),
            ),
            30.getH(),
            MyTextFromField(
              labelText: "Type your username",
              perefixIcon: AppImages.person,
              valueChanged: (String value) {},
            ),
            20.getH(),
            MyTextFromField(
              textInputAction: TextInputAction.done,
              onTab: () {
                setState(() {
                  obthorText = !obthorText;
                });
              },
              labelText: 'Type your password',
              perefixIcon: AppImages.lock,
              obzorText: obthorText,
              suffixIcon: obthorText ? AppImages.openEye : AppImages.closeEye,
              valueChanged: (String value) {},
            ),
            20.getH(),
            MyTextFromField(
              labelText: 'Type your email',
              perefixIcon: AppImages.callPng,
              valueChanged: (String value) {},
            ),
            16.getH(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: 1.3,
                  child: Checkbox.adaptive(
                      side: BorderSide(
                          color: AppColors.c808D9E, width: chek ? 0 : 1.2.w),
                      checkColor: AppColors.cFFFFFF,
                      activeColor: AppColors.c257CFF,
                      value: chek,
                      onChanged: (v) {
                        chek = !chek;
                        setState(() {});
                      }),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: "I agree to the company ",
                      style: AppTextStyle.urbanistRegular.copyWith(
                        color: const Color(0xFF9CA3AF),
                        fontSize: 14.sp,
                      ),
                      children: [
                        TextSpan(
                          text: "Term of Service",
                          style: AppTextStyle.urbanistRegular.copyWith(
                            color: AppColors.c191A26,
                            fontSize: 14.sp,
                          ),
                        ),
                        TextSpan(
                          text: " and",
                          style: AppTextStyle.urbanistRegular.copyWith(
                            color: const Color(0xFF9CA3AF),
                            fontSize: 14.sp,
                          ),
                        ),
                        TextSpan(
                          text: " Privacy Policy",
                          style: AppTextStyle.urbanistRegular.copyWith(
                            color: AppColors.c191A26,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
