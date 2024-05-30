import 'package:dennic_project/blocs/appoinment/bloc.dart';
import 'package:dennic_project/blocs/appoinment/event.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:dennic_project/blocs/doctor/doctor_bloc.dart';
import 'package:dennic_project/blocs/doctor/doctor_event.dart';
import 'package:dennic_project/blocs/doctor/doctor_state.dart';
import 'package:dennic_project/data/model/doctor_model/doctor_model.dart';
import 'package:dennic_project/data/network/api_provider.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/create_patient_screen.dart';
import 'package:dennic_project/screens/top_doctor/widgets/category_items.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/utility_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/styles/app_text_style.dart';
import '../../detail/widgets/global_button.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key, required this.doctorModel});

  final DoctorModel doctorModel;

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String selectedTime = '09.00 AM';
  String selectedAppointmentType = 'Messaging';

  String day = "AM";
  String id = "";

  bool isTapped = false;

  int activeIndex = -1;
  int actIndex = -1;

  @override
  void initState() {
    context.read<DoctorBloc>().add(
          GetTable(
            doctorId: widget.doctorModel.id,
            date: context
                .read<AppointmentBloc>()
                .state
                .appointment
                .appointmentDate,
          ),
        );

    context.read<DoctorBloc>().add(
          GetDoctorService(
            id: widget.doctorModel.id,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(
      DateTime.parse(
              context.read<AppointmentBloc>().state.appointment.appointmentDate)
          .toString(),
    );
    debugPrint(
        "${context.read<AppointmentBloc>().state.appointment.appointmentDate}--------------");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Appointment',
          style: AppTextStyle.urbanistMedium.copyWith(fontSize: 26.sp),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formatDateTime(DateTime.parse(context
                              .read<AppointmentBloc>()
                              .state
                              .appointment
                              .appointmentDate)
                          .toString()),
                      style:
                          AppTextStyle.urbanistMedium.copyWith(fontSize: 16.sp),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        CategoryItems(
                          day: "",
                          title: "Morning",
                          isSelected: activeIndex == -1,
                          onTap: () {
                            setState(() {
                              day = "AM";
                              activeIndex = -1;
                              actIndex = -1;
                            });
                          },
                          subtitle: '',
                        ),
                        CategoryItems(
                          day: "",
                          title: "Evening",
                          isSelected: activeIndex == 1,
                          onTap: () {
                            day = "PM";
                            ApiProvider.bookAppointment(
                                context
                                    .read<AppointmentBloc>()
                                    .state
                                    .appointment
                                    .appointmentDate,
                                widget.doctorModel.id);
                            setState(() {
                              activeIndex = 1;
                              actIndex = -1;
                            });
                          },
                          subtitle: '',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Choose the Hour',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10.h),
                    BlocBuilder<DoctorBloc, DoctorState>(
                      builder: (context, state) {
                        if (state.formStatus == FormStatus.loading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        // if (state.formStatus == FormStatus.error) {
                        //   debugPrint("Soatlar qismida errorga tushdi");
                        //   return Center(
                        //     child: Text(state.errorMessage),
                        //   );
                        // }
                        if (state.formStatus == FormStatus.success) {
                          return Wrap(
                            runSpacing: 10.w,
                            spacing: 2.h,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              ...List.generate(state.tableModels.length,
                                  (index) {
                                return CategoryItems(
                                  isBusy:state.tableModels[index].status ,
                                  day: day,
                                  title:
                                      state.tableModels[index].time.toString(),
                                  subtitle: state.tableModels[index].timeOfDay
                                      ? "AM"
                                      : "PM",
                                  isSelected: actIndex == index,
                                  onTap: () {
                                    actIndex = index;
                                    context.read<AppointmentBloc>().add(
                                        UpdateAppointmentTime(
                                            state.tableModels[index].time));
                                    setState(() {});
                                  },
                                );
                              })
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Fee Information',
                      style: AppTextStyle.urbanistMedium.copyWith(
                          fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10.h),
                    BlocBuilder<DoctorBloc, DoctorState>(
                      builder: (context, state) {
                        if (state.formStatus == FormStatus.loading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        // if (state.formStatus == FormStatus.error) {
                        //   return Center(
                        //     child: Text(state.errorMessage),
                        //   );
                        // }
                        if (state.formStatus == FormStatus.success) {
                          return Column(
                            children: [
                              ...List.generate(
                                state.serviceModels.length,
                                (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isTapped = !isTapped;
                                      });
                                      id = state.serviceModels[index].id;
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: 12.h,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 12.h, horizontal: 24.w),
                                      decoration: BoxDecoration(
                                        color: isTapped
                                            ? AppColors.c_2972FE
                                            : AppColors.c_93B8FE,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(16.w),
                                            decoration: const BoxDecoration(
                                                color: AppColors.white,
                                                shape: BoxShape.circle),
                                            child: const Icon(Icons.message),
                                          ),
                                          SizedBox(width: 10.w),
                                          Text(
                                            state.serviceModels[index].name,
                                            style: AppTextStyle.urbanistBold
                                                .copyWith(
                                              color: isTapped
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            state.serviceModels[index]
                                                .offlinePrice
                                                .toString(),
                                            style: AppTextStyle.urbanistBold
                                                .copyWith(
                                              color: isTapped
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          GlobalButton(
            h: 10,
            w: 10,
            title: "Next ",
            onTap: () {
              context
                  .read<AppointmentBloc>()
                  .add(UpdateDoctorId(widget.doctorModel.id));
              context.read<AppointmentBloc>().add(UpdateDoctorServiceId(id));

              // appointmentModel =
              //     appointmentModel.copyWith(doctorId: widget.doctorModel.id,doctorServiceId: id);
              debugPrint(
                  "${context.read<AppointmentBloc>().state.appointment.toString()}--------------------------------");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CreatePatientScreen();
                  },
                ),
              );
            },
          ),
          SizedBox(height: 60.h)
        ],
      ),
    );
  }
}
