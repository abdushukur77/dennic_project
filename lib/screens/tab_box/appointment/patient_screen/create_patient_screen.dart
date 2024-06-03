import 'package:dennic_project/blocs/appoinment/appointment_bloc.dart';
import 'package:dennic_project/blocs/appoinment/appointment_event.dart';
import 'package:dennic_project/blocs/appoinment/appointment_state.dart';
import 'package:dennic_project/blocs/appointment_history/appointment_history_bloc.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:dennic_project/data/model/patient/patient_modedl.dart';
import 'package:dennic_project/screens/global_widget/countries_drop_down.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/address_input.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/blood_group_input.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/city_input.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/country_input.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/gender_selector.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/name_input.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/phone_number.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/problem_description.dart';
import 'package:dennic_project/screens/tab_box/tab_box_screen.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/constants/app_constants.dart';
import 'package:dennic_project/utils/images/app_images.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:dennic_project/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreatePatientScreen extends StatefulWidget {
  const CreatePatientScreen({super.key});

  @override
  State<CreatePatientScreen> createState() => _CreatePatientScreenState();
}

class _CreatePatientScreenState extends State<CreatePatientScreen> {
  int actIndex = -1;
  int? selectedGender;
  DateTime? selectedDate;

  final TextEditingController searchController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController problemDescriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
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
      body: BlocListener<AppointmentBloc, AppointmentState>(
        listener: (BuildContext context, AppointmentState state) {
          if (state.formStatus == FormStatus.success) {
            debugPrint("Good");
            if (state.statusMessage == "ok") {
              context
                  .read<AppointmentHistoryBloc>()
                  .add(GetAppointmentHistoryEvent());

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const TabBoxScreen(),
                ),
                (route) => false,
              );
            }
          }
        },
        child: Padding(
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
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: 24.h),
                      AddressInput(
                          controller: addressController,
                          textInputAction: TextInputAction.next),
                      SizedBox(height: 24.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 24.w, bottom: 8.h),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Birth of date",
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
                          InkWell(
                            onTap: () {
                              _selectDate(context);
                              setState(() {});
                            },
                            borderRadius: BorderRadius.circular(100.r),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24.w,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(100.r),
                                border: Border.all(
                                  width: 1.w,
                                  color: AppColors.cEBEEF2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.c_5A6CEA.withOpacity(0.08),
                                    blurRadius: 50.r,
                                    offset: const Offset(12.0, 26.0),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: AppColors.white,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.h,
                                  ),
                                  prefixIcon: SvgPicture.asset(
                                    AppImages.calendar,
                                    width: 7.w,
                                    height: 7.h,
                                  ),
                                ),
                                child: selectedDate != null
                                    ? Text(
                                        selectedDate
                                            .toString()
                                            .substring(0, 10),
                                        style: AppTextStyle.urbanistBold
                                            .copyWith(color: AppColors.c7E8CA0),
                                      )
                                    : const Text('Select Date'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      const BloodGroupInput(),
                      SizedBox(height: 24.h),
                      CityInput(
                          controller: cityController,
                          textInputAction: TextInputAction.next),
                      SizedBox(height: 24.h),
                      CountryInput(
                        onTap: () async {
                          selectedCountry = await showModalBottomSheet<String>(
                            context: context,
                            builder: (context) {
                              return CountriesDropDown(
                                items: AppConstants.countries,
                                textEditingController: searchController,
                              );
                            },
                          );

                          if (selectedCountry != null) {
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Selected country: $selectedCountry',
                                ),
                              ),
                            );
                          }
                          setState(() {});
                        },
                      ),
                      SizedBox(height: 24.h),
                      PhoneNumberInput(
                        controller: phoneNumberController,
                        textInputAction: TextInputAction.next,
                      ),
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
                      ProblemDescriptionInput(
                          controller: problemDescriptionController,
                          textInputAction: TextInputAction.done),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 55.h,
                child: ElevatedButton(
                  onPressed: () async {
                    if (addressController.text.isNotEmpty ||
                        firstNameController.text.isNotEmpty ||
                        cityController.text.isNotEmpty ||
                        lastNameController.text.isNotEmpty ||
                        addressController.text.isNotEmpty ||
                        cityController.text.isNotEmpty) {
                      PatientModel patientModel = PatientModel(
                        address: addressController.text,
                        birthDate:
                            selectedDate!.toIso8601String().substring(0, 10),
                        bloodGroup: bloodGroup,
                        city: cityController.text,
                        country: selectedCountry!,
                        firstName: firstNameController.text,
                        gender: selectedGender == 1 ? "female" : "male",
                        lastName: lastNameController.text,
                        patientProblem: problemDescriptionController.text,
                        phoneNumber:
                            phoneNumberController.text.replaceAll(" ", ""),
                      );

                      context.read<AppointmentBloc>().add(
                            Addkasal(
                              patientModel: patientModel,
                            ),
                          );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Malumotlar to'liq kiritilmagan!",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.c_2972FE,
                  ),
                  child: const Text(
                    "Book",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              20.getH(),
            ],
          ),
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

String? selectedCountry;
