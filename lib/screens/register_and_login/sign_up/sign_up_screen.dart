import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:dennic_project/screens/register_and_login/sign_up/widget/check.dart';
import 'package:dennic_project/screens/register_and_login/widget/my_text_from.dart';
import 'package:dennic_project/screens/register_and_login/widget/my_text_from_tel.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/constants/app_constants.dart';
import 'package:dennic_project/utils/extention/extantions.dart';
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
  bool check = false;
  bool write = false;
  bool minimumEightcharacters = false;
  bool atleastNumber = false;
  bool atleastLowercaseOrUppercaseLetters = false;
  TextEditingController genderController = TextEditingController();


  DateTime? selectedDate;



  @override
  Widget build(BuildContext context) {
    const List<String> _list = [
      "Male",
      "Female",
    ];
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
            8.getH(),
            MyTextFromField(
              labelText: 'Type your firstname',
              perefixIcon: AppImages.person,
              valueChanged: (String value) {},
            ),
            10.getH(),
            MyTextFromField(
              labelText: 'Type your lastname',
              perefixIcon: AppImages.person,
              valueChanged: (String value) {},
            ),
            20.getH(),
            InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: InputDecorator(
                decoration: InputDecoration(

                  labelText: 'Date of Birth',
                  prefixIcon: SvgPicture.asset(AppImages.calendar,width: 7.w, height: 7.h,),
                  // border: OutlineInputBorder(),
                ),
                child: selectedDate != null
                    ? Text(selectedDate.toString().substring(0,10),style: AppTextStyle.urbanistBold.copyWith(
                    color :AppColors.c7E8CA0
                ),)
                    : Text('Select Date'),
              ),
            ),
            10.getH(),
            CustomDropdown<String>(

              hintText: 'Select your gender',
              items: _list,
              initialItem: _list[0],
              onChanged: (value) {
                genderController.text = value;
              },
            ),
            5.getH(),
            MyTextFromFieldTel(
              labelText: 'Type your phone number',
              perefixIcon: AppImages.call,
              valueChanged: (String value) {},
            ),
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
              valueChanged: _onChange,
            ),
            10.getH(),

            MyTextFromField(
              textInputAction: TextInputAction.done,
              onTab: () {
                setState(() {
                  obthorText = !obthorText;
                });
              },
              labelText: 'Confirm your password',
              perefixIcon: AppImages.lock,
              obzorText: obthorText,
              suffixIcon: obthorText ? AppImages.openEye : AppImages.closeEye,
              valueChanged: _onChange,
            ),
            16.getH(),
            if (write)
              CheckInput(
                  check: minimumEightcharacters, title: "Minimum 8 characters"),
            if (write)
              CheckInput(check: atleastNumber, title: "Atleast 1 number (1-9)"),
            if (write)
              CheckInput(
                  check: atleastLowercaseOrUppercaseLetters,
                  title: "Atleast lowercase or uppercase letters"),
            16.getH(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: 1.3,
                  child: Checkbox.adaptive(
                      side: BorderSide(
                          color: AppColors.c808D9E, width: check ? 0 : 1.2.w),
                      checkColor: AppColors.cFFFFFF,
                      activeColor: AppColors.c257CFF,
                      value: check,
                      onChanged: (v) {
                        check = !check;
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
            42.getH(),
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
                  "Sign Up",
                  style: AppTextStyle.urbanistBold.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.cFFFFFF,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onChange(String value) {
    write = true;
    if (value.length > 7) {
      minimumEightcharacters = true;
    }
    if (value.length < 7) {
      minimumEightcharacters = false;
    }
    if (value.isDigitMy()) {
      atleastNumber = true;
    }
    if (!value.isDigitMy()) {
      atleastNumber = false;
    }
    if (value.isAlphaMy()) {
      atleastLowercaseOrUppercaseLetters = true;
    }
    if (!value.isAlphaMy()) {
      atleastLowercaseOrUppercaseLetters = false;
    }
    setState(() {});
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
