import 'package:dennic_project/screens/register_and_login/onboarding/onboarding.dart';
import 'package:dennic_project/screens/register_and_login/reset_password/reset_passsword.dart';
import 'package:dennic_project/screens/register_and_login/sign_in/sign_in_screen.dart';
import 'package:dennic_project/screens/register_and_login/sign_up/sign_up_screen.dart';
import 'package:dennic_project/screens/register_and_login/splash/splash_screen.dart';
import 'package:dennic_project/screens/register_and_login/verified/verified.dart';
import 'package:dennic_project/screens/register_and_login/verify_code/verify_code_screen.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:dennic_project/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelperScreen extends StatelessWidget {
  const HelperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OnboardingScreen();
                }));
              },
              child: Text("Onboarding",
                  style: AppTextStyle.urbanistMedium
                      .copyWith(fontSize: 20.sp, color: AppColors.c257CFF)),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResetPasswordScreen();
                }));
              },
              child: Text(
                "Reset Password Screen",
                style: AppTextStyle.urbanistMedium
                    .copyWith(fontSize: 20.sp, color: AppColors.c257CFF),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignInScreen();
                }));
              },
              child: Text(
                "Sign In Screen",
                style: AppTextStyle.urbanistMedium
                    .copyWith(fontSize: 20.sp, color: AppColors.c257CFF),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUpScreen();
                }));
              },
              child: Text(
                "Sign Up Screen",
                style: AppTextStyle.urbanistMedium
                    .copyWith(fontSize: 20.sp, color: AppColors.c257CFF),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SplashScreen();
                }));
              },
              child: Text(
                "Splash Screen",
                style: AppTextStyle.urbanistMedium
                    .copyWith(fontSize: 20.sp, color: AppColors.c257CFF),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return VerifyCodeScreen();
                }));
              },
              child: Text(
                "Verify Code Screen",
                style: AppTextStyle.urbanistMedium
                    .copyWith(fontSize: 20.sp, color: AppColors.c257CFF),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return VerifiedScreen();
                }));
              },
              child: Text(
                "Verified Screen",
                style: AppTextStyle.urbanistMedium
                    .copyWith(fontSize: 20.sp, color: AppColors.c257CFF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
