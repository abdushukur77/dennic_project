import 'package:dennic_project/screens/register_and_login/sign_up/sign_up_screen.dart';
import 'package:dennic_project/screens/register_and_login/widget/my_text_from.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/images/app_images.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:dennic_project/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/my_text_from_tel.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool obthorText = true;

  TextEditingController phoneNumberController= TextEditingController();
  TextEditingController passwordController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.we()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            96.getH(),
            Text(
              "Welcome Back!",
              style: AppTextStyle.urbanistBold.copyWith(
                color: AppColors.c1D1E25,
                fontSize: 24.sp,
              ),
            ),
            8.getH(),
            Text(
              "Sign In to your account",
              style: AppTextStyle.urbanistRegular.copyWith(
                color: AppColors.c68DBFF,
                fontSize: 16.sp,
              ),
            ),
            70.getH(),


            MyTextFromFieldTel(
              controller: phoneNumberController,
              labelText: 'Type your phone',

              perefixIcon: AppImages.call,
              valueChanged: (String value) {},
            ),
            30.getH(),
            MyTextFromField(
              controller: passwordController,
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


            16.getH(),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: AppTextStyle.urbanistBold.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.c257CFF,
                  ),
                ),
              ),
            ),
            73.getH(),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r)),
                    backgroundColor: AppColors.c257CFF,
                    padding: EdgeInsets.symmetric(vertical: 15.he())),
                onPressed: () {},
                child: Text(
                  "Sign In",
                  style: AppTextStyle.urbanistBold.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.cFFFFFF,
                  ),
                ),
              ),
            ),
            27.getH(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have account?",
                  style: AppTextStyle.urbanistRegular.copyWith(
                    fontSize: 14.sp,
                    color: const Color(0xFF9CA3AF),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Sign Up",
                    style: AppTextStyle.urbanistBold.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.c257CFF,
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
