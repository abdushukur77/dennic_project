import 'package:dennic_project/screens/tab_box/profile/edit_profile_screen/widgets/age_range_select.dart';
import 'package:dennic_project/screens/tab_box/profile/edit_profile_screen/widgets/date_time_picker.dart';
import 'package:dennic_project/screens/tab_box/profile/edit_profile_screen/widgets/full_name.dart';
import 'package:dennic_project/screens/tab_box/profile/edit_profile_screen/widgets/phone_number.dart';
import 'package:dennic_project/screens/tab_box/profile/edit_profile_screen/widgets/problem_descrition.dart';
import 'package:dennic_project/utils/images/app_images.dart';
import 'package:dennic_project/utils/styles/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/gender_dropdown.dart';
import 'widgets/next_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  int activeIndex = -1;
  int actIndex = -1;
  final List<String> ages = ["10+", "20+", "30+", "40+", "50+"];
  int? selectedGender;
  DateTime? selectedDate;

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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      // Align the Positioned widget correctly
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 50.r,
                            backgroundImage: NetworkImage(
                              "https://sm.ign.com/ign_nordic/cover/a/avatar-gen/avatar-generations_prsz.jpg",
                            ),
                          ),
                        ),
                        Positioned(
                          right: 100.w,
                          // Adjust the right position to align the edit icon
                          bottom: 0,
                          // Adjust the bottom position to align the edit icon
                          child: Container(
                            padding: EdgeInsets.only(right: 5.w, bottom: 5.h),
                            height: 35.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.c_2972FE,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Divider(thickness: 1),
                    SizedBox(height: 24.h),
                    FullNameInput(
                      title: 'Full Name',
                      enabled: true,
                    ),
                    SizedBox(height: 24.h),
                    FullNameInput(
                      title: "Telephone",
                      enabled: true,
                    ),
                    SizedBox(height: 24.h),
                    GenderDropdown(
                      selectedGender: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                    SizedBox(height: 24.h),
                    DateOfBirthPicker(),
                    AgeRangeSelection(
                      ages: ages,
                      actIndex: actIndex,
                      onSelected: (index) {
                        setState(() {
                          actIndex = index;
                        });
                      },
                    ),
                    SizedBox(height: 24.h),
                    PhoneNumberInput(),
                    SizedBox(height: 24.h),
                    SizedBox(height: 24.h),
                    ProblemDescriptionInput(),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
            NextButton(onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
