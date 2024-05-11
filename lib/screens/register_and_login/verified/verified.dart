import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/styles/app_text_style.dart';
import '../sign_in/sign_in_screen.dart';

class VerifiedScreen extends StatelessWidget {
  const VerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c257CFF,
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 26.w),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Column(children: [
                Container(
                  width: 124.w,height: 124.h,
                  padding: EdgeInsets.symmetric(
                      horizontal:26.w,vertical: 26.h
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.c59C3FF.withOpacity(0.4)
                  ),
                  child: SvgPicture.asset(AppImages.done1),
                ),
                SizedBox(height: 40.h,),
                Text("Account Verified",style: AppTextStyle.urbanistBold.copyWith(
                    color: AppColors.white,fontSize: 24.sp
                ),),
                SizedBox(height: 8.h,),
                Text('Your account has been verified succesfully, now let’s enjoy Paypay features!',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.urbanistRegular.copyWith(
                      color: AppColors.white,fontSize:16.sp
                  ),),
              ],),
              Column(
                children: [
                  SizedBox(width:double.infinity,
                    child: TextButton(onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder:(context){
                        return SignInScreen();
                      }));
                    },
                        style:TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 15.h),
                            backgroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r)
                            )
                        ),
                        child:Text("Get Started",style: AppTextStyle.urbanistBold.copyWith(
                            color: AppColors.c257CFF,fontSize: 14.sp
                        ),)),
                  ),
                  SizedBox(height: 30.h,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
