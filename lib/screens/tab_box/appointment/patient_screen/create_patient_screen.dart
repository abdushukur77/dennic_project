import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/address_input.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/birth_date_input.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/blood_group_input.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/city_input.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/country_input.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/gender_selector.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/name_input.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/phone_number.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/problem_description.dart';
import 'package:dennic_project/screens/top_doctor/widgets/category_items.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePatientScreen extends StatefulWidget {
  const CreatePatientScreen({super.key});

  @override
  State<CreatePatientScreen> createState() => _CreatePatientScreenState();
}

class _CreatePatientScreenState extends State<CreatePatientScreen> {
  int actIndex = -1;
  int? selectedGender;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController problemDescriptionController = TextEditingController();

  final List<String> ages = [
    "10+",
    "20+",
    "30+",
    "40+",
    "50+",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NameInput(
                      firstNameController: firstNameController,
                      lastNameController: lastNameController,
                    ),
                    SizedBox(height: 24.h),
                    AddressInput(controller: addressController),
                    SizedBox(height: 24.h),
                    BirthDateInput(controller: birthDateController),
                    SizedBox(height: 24.h),
                    BloodGroupInput(controller: bloodGroupController),
                    SizedBox(height: 24.h),
                    CityInput(controller: cityController),
                    SizedBox(height: 24.h),
                    CountryInput(controller: countryController),
                    SizedBox(height: 24.h),
                    PhoneNumberInput(controller: phoneNumberController),
                    SizedBox(height: 24.h),
                    GenderSelector(
                      selectedGender: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                    SizedBox(height: 24.h),
                    ProblemDescriptionInput(controller: problemDescriptionController),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 55.h,
              child: ElevatedButton(
                onPressed: () {
                  // Handle Next button press
                },
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
            ),
          ],
        ),
      ),
    );
  }
}
