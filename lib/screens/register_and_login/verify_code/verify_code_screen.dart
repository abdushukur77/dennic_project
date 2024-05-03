import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/images/app_images.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:dennic_project/utils/styles/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  String pinCode = "";
  String againCode = "";
  bool isAgain = false;
  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    Widget buttonItems({required String title}) {
      return TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 28.w,
            vertical: 8.w,
          ),
          backgroundColor: Colors.white10,
        ),
        onPressed: () {
          list = [];
          pinCode += title;
          list = pinCode.split('');
          if (isAgain) {
            againCode = pinCode;
          }
          if (pinCode.length == 4) {
            if (!isAgain) {
              // context.read<CheckCubit>().createPassword(pinCode);
              isAgain = true;
            }
            // context.read<CheckCubit>().toVerifyPinCode(againCode, context);
          }
          setState(() {});
        },
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:
            SvgPicture.asset(AppImages.arrowLeft)
          ,
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.getH(),
            Text(
              "Verify Code",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            8.getH(),
            Text(
              "Please enter the code we just sent to phone number (+1) 234 567 XXX",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black),
            ),
            37.getH(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(4, (index) {
                  debugPrint("AAAAAAAAAAAAAAAAAA$list $pinCode");
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    width: 56.w,
                    height: 56.h,
                    decoration: BoxDecoration(
                      color: (index < pinCode.length)
                          ? Colors.white
                          : Colors.grey.shade200,
                      border: Border.all(
                          color: index < pinCode.length
                              ? Colors.blue
                              : Colors.grey.shade200),
                      shape: BoxShape.circle,
                    ),
                    child: (index < pinCode.length)
                        ? Center(
                            child: Text(
                              list[index],
                              style: AppTextStyle.urbanistBold.copyWith(
                                  color: AppColors.black, fontSize: 20.sp),
                            ),
                          )
                        : const SizedBox(),
                  );
                }),
              ],
            ),
            37.getH(),
            Center(
                child: Text(
              "Resend code in Time",
              style: AppTextStyle.urbanistBold
                  .copyWith(color: AppColors.black, fontSize: 16.sp),
            )),
            58.getH(),
            SizedBox(
              width: width,
              child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      backgroundColor: Colors.blue),
                  child: Text(
                    "Continue",
                    style: AppTextStyle.urbanistBold
                        .copyWith(color: AppColors.white, fontSize: 14.sp),
                  )),
            ),
            33.getH(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonItems(title: "1"),
                buttonItems(title: "2"),
                buttonItems(title: "3"),
              ],
            ),
            15.getH(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonItems(title: "4"),
                buttonItems(title: "5"),
                buttonItems(title: "6"),
              ],
            ),
            15.getH(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonItems(title: "7"),
                buttonItems(title: "8"),
                buttonItems(title: "9"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 16.h,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    ".",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                buttonItems(title: "0"),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 22.w,
                      vertical: 16.h,
                    ),
                  ),
                  onPressed: () {
                    if (pinCode.isEmpty) {
                      pinCode = "";
                    } else {
                      pinCode = pinCode.substring(0, pinCode.length - 1);
                    }
                    setState(() {});
                  },
                  child: SvgPicture.asset(AppImages.backSpace)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
