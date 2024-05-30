import 'package:dennic_project/blocs/appoinment/bloc.dart';
import 'package:dennic_project/blocs/appoinment/event.dart';
import 'package:dennic_project/blocs/appoinment/state.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:dennic_project/blocs/doctor/doctor_bloc.dart';
import 'package:dennic_project/blocs/doctor/doctor_event.dart';
import 'package:dennic_project/blocs/doctor/doctor_state.dart';
import 'package:dennic_project/data/model/patient/patient_modedl.dart';
import 'package:dennic_project/screens/global_widget/countries_drop_down.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/address_input.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/birth_date_input.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/blood_group_input.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/city_input.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/gender_selector.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/name_input.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/phone_number.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/widget/problem_description.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/constants/app_constants.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:dennic_project/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePatientScreen extends StatefulWidget {
  const CreatePatientScreen({super.key});

  @override
  State<CreatePatientScreen> createState() => _CreatePatientScreenState();
}

class _CreatePatientScreenState extends State<CreatePatientScreen> {
  int actIndex = -1;
  int? selectedGender;

  final TextEditingController searchController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
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
      body: BlocConsumer<DoctorBloc, DoctorState>(
        builder: (context, state) {
          return Padding(
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
                        BirthDateInput(
                            controller: birthDateController,
                            textInputAction: TextInputAction.next),
                        SizedBox(height: 24.h),
                        BloodGroupInput(
                            controller: bloodGroupController,
                            textInputAction: TextInputAction.next),
                        SizedBox(height: 24.h),
                        CityInput(
                            controller: cityController,
                            textInputAction: TextInputAction.next),
                        SizedBox(height: 24.h),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 20.w,
                          ),
                          child: GestureDetector(
                            onTap: () async {
                              String? selectedCountry =
                                  await showModalBottomSheet<String>(
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
                                          'Selected country: $selectedCountry')),
                                );
                              }
                            },
                            child: Row(
                              children: [
                                Text(
                                  'Please, select country',
                                  style: AppTextStyle.urbanistBold
                                      .copyWith(fontSize: 16.sp),
                                ),
                                Text(
                                  '*',
                                  style: AppTextStyle.urbanistBold.copyWith(
                                    fontSize: 16.sp,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // CountryInput(
                        //     controller: countryController,
                        //     textInputAction: TextInputAction.next),
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
                  child: BlocConsumer<AppointmentBloc, AppointmentState>(
                    listener: (BuildContext context, AppointmentState myState) {
                      debugPrint("DEBUG PRINT ${myState.formStatus}");
                      debugPrint("DEBUG PRINT ${myState.potentId}");
                      if (state.formStatus == FormStatus.success) {
                        if (myState.statusMessage == "ok") {
                          debugPrint("My Id: ${myState.potentId}");
                        }
                      }
                    },
                    builder: (BuildContext context, AppointmentState state) {
                      return ElevatedButton(
                        onPressed: () async {
                          context.read<AppointmentBloc>().add(
                                Addkasal(
                                  patientModel: PatientModel(
                                    address: addressController.text,
                                    birthDate: birthDateController.text,
                                    bloodGroup: bloodGroupController.text,
                                    city: cityController.text,
                                    country: countryController.text,
                                    firstName: firstNameController.text,
                                    gender: "male",
                                    lastName: lastNameController.text,
                                    patientProblem:
                                        problemDescriptionController.text,
                                    phoneNumber: phoneNumberController.text
                                        .replaceAll(" ", ""),
                                  ),
                                ),
                              );

                          // NetworkResponse id =
                          //     await ApiProvider.createPatient(patientModel);
                          // if (!context.mounted) return;
                          // context.read<AppointmentBloc>().add(
                          //       UpdatePatientId(
                          //         id.data,
                          //       ),
                          //     );
                          context.read<DoctorBloc>().add(
                                PostAppointment(
                                  appointmentModel: state.appointment,
                                ),
                              );
                          debugPrint(context
                              .read<AppointmentBloc>()
                              .state
                              .appointment
                              .toString());
                          context.read<DoctorBloc>().add(
                                PostAppointment(
                                  appointmentModel: context
                                      .read<AppointmentBloc>()
                                      .state
                                      .appointment,
                                ),
                              );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF93B8FE),
                        ),
                        child: const Text(
                          "Book",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // 20.getH(),
                // BlocBuilder<AppointmentBloc, AppointmentState>(
                //   builder: (context, state) {
                //     return TextButton(
                //       onPressed: () {
                //         context.read<AppointmentBloc>().add(
                //               UpdatePatientId(
                //                 state.potentId,
                //               ),
                //             );
                //         debugPrint(context
                //             .read<AppointmentBloc>()
                //             .state
                //             .appointment
                //             .toString());
                //         context.read<DoctorBloc>().add(PostAppointment(
                //             appointmentModel: context
                //                 .read<AppointmentBloc>()
                //                 .state
                //                 .appointment));
                //       },
                //       child: const Text(
                //         "Appointment",
                //       ),
                //     );
                //   },
                // ),
                20.getH(),
              ],
            ),
          );
        },
        listener: (BuildContext context, DoctorState state) {
          if (state.formStatus == FormStatus.success) {
            String id = state.id;
            debugPrint(
              "CURRENT ID: $id",
            );
            context.read<AppointmentBloc>().add(UpdatePatientId(id));

            // context.read<AppointmentBloc>().add(UpdatePatientId(id));
            // appointmentModel = appointmentModel.copyWith(patientId: id);
            context.read<DoctorBloc>().add(PostAppointment(
                appointmentModel:
                    context.read<AppointmentBloc>().state.appointment));
            debugPrint(
                context.read<AppointmentBloc>().state.appointment.toString());
            // appointmentModel = AppointmentModel.initial();
          }
        },
      ),
    );
  }
}
