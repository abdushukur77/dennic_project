import 'package:dennic_project/screens/top_doctor/widgets/category_items.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentThirdScreen extends StatefulWidget {
  const AppointmentThirdScreen({super.key});

  @override
  State<AppointmentThirdScreen> createState() => _AppointmentThirdScreenState();
}

class _AppointmentThirdScreenState extends State<AppointmentThirdScreen> {
  int activeIndex = -1;
  int actIndex = -1;

  final List<String> ages = [
    "10+",
    "20+",
    "30+",
    "40+",
    "50+",
  ];

  int? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: <Color>[AppColors.c_2972FE, AppColors.c_6499FF],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          "Patient Details",
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.c_09101D,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 24.w, bottom: 8.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Full Name",
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
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 12.h,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.r),
                          borderSide: BorderSide(
                            color: AppColors.c_EBEEF2,
                            width: 1.w,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.r),
                          borderSide: BorderSide(
                            color: AppColors.c_2972FE,
                            width: 1.w,
                          ),
                        ),
                        hintText: "Full Name",
                        hintStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.5.h,
                          color: const Color(0xFFDADEE3),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.w, bottom: 8.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Select Your Age Range",
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
                  SizedBox(
                    height: 16.h,
                  ),
                  Wrap(
                    spacing: 4.w,
                    children: [
                      ...List.generate(ages.length, (index) {
                        return CategoryItems(
                          day: "",
                          title: ages[index],
                          isSelected: actIndex == index,
                          onTap: () {
                            actIndex = index;
                            setState(() {});
                          }, subtitle: '',
                        );
                      })
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
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
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 12.h,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.r),
                          borderSide: BorderSide(
                            color: AppColors.c_EBEEF2,
                            width: 1.w,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.r),
                          borderSide: BorderSide(
                            color: AppColors.c_2972FE,
                            width: 1.w,
                          ),
                        ),
                        hintText: "Phone Number",
                        hintStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.5.h,
                          color: const Color(0xFFDADEE3),
                        ),
                        suffixIcon: const Padding(
                          padding: EdgeInsets.only(right: 24),
                          child: Icon(
                            CupertinoIcons.phone_fill,
                            color: AppColors.c_858C94,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.w, bottom: 8.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Gender",
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
                    width: double.infinity,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: AppColors.c_EBEEF2,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(100.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.c_5A6CEA.withOpacity(0.08),
                          blurRadius: 50.r,
                          offset: const Offset(12.0, 26.0),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedGender,
                        alignment: Alignment.center,
                        borderRadius: BorderRadius.circular(15.r),
                        dropdownColor: Colors.white,
                        padding: EdgeInsets.only(left: 24.w, right: 12.w),
                        icon: const Icon(
                          Icons.arrow_drop_down_rounded,
                          color: AppColors.c_858C94,
                        ),
                        iconSize: 45,
                        hint: Text(
                          "Gender",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.5.h,
                            color: const Color(0xFFDADEE3),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 1,
                            child: Text("Male"),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text("Female"),
                          ),
                        ],
                        onChanged: (value) {
                          selectedGender = value;
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.w, bottom: 8.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Write Your Problem",
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
                    child: SizedBox(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 12.h,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.r),
                            borderSide: BorderSide(
                              color: AppColors.c_EBEEF2,
                              width: 1.w,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.r),
                            borderSide: BorderSide(
                              color: AppColors.c_2972FE,
                              width: 1.w,
                            ),
                          ),
                          hintText: "Tell doctor about your problem",
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.5.h,
                            color: const Color(0xFFDADEE3),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 55.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF93B8FE),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
