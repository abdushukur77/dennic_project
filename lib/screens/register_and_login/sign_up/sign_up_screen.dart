import 'package:dennic_project/screens/register_and_login/widget/my_text_from.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/images/app_images.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:dennic_project/utils/styles/app_text_style.dart';
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
            ),
            20.getH(),
            MyTextFromField(
              labelText: 'Type your email',
              perefixIcon: AppImages.callPng,
            ),
          ],
        ),
      ),
    );
  }
}
