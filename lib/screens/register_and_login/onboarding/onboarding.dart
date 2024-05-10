import 'package:dennic_project/screens/register_and_login/sign_up/sign_up_screen.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/images/app_images.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:dennic_project/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          12.getH(),
          Center(
              child: Image.asset(
            AppImages.dennic,
            width: 350.w,
            fit: BoxFit.contain,
          )),
          Stack(
            children: [
              Container(
                width: 400.w,
                height: 280.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  boxShadow: [
                    const BoxShadow(
                      color: AppColors.white,
                      blurRadius: 40,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: AppColors.c68DBFF.withOpacity(.5),
                      blurRadius: 60,
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 25.w,
                child: Image.asset(
                  AppImages.girl,
                  width: 167.w,
                  height: 267.h,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 20.h,
                left: 5.w,
                bottom: 0,
                child: Image.asset(
                  AppImages.boy,
                  width: 220.w,
                  height: 287.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              top: 39.h,
              left: 24.w,
              right: 24.w,
            ),
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  " Improve the Quality of Service for Patient Happiness",
                  style: AppTextStyle.urbanistBold.copyWith(
                    color: AppColors.c1D1E25,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                20.getH(),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.c257CFF,
                      padding: EdgeInsets.symmetric(
                        vertical: 15.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: AppColors.cFFFFFF,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                10.getH(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an account?",
                      style: TextStyle(
                        color: AppColors.c9CA3AF,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignUpScreen();
                        }));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: AppColors.c257CFF,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
