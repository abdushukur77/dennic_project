import 'package:dennic_project/blocs/appointment_history/appointment_history_bloc.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:dennic_project/blocs/doctor/doctor_bloc.dart';
import 'package:dennic_project/blocs/doctor/doctor_event.dart';
import 'package:dennic_project/screens/tab_box/history/detail_appointments_screen.dart';
import 'package:dennic_project/screens/tab_box/history/widget/appointment.dart';
import 'package:dennic_project/screens/tab_box/home/widgets/doctor_logo.dart';
import 'package:dennic_project/screens/tab_box/home/widgets/ring_and_favorite_items.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:dennic_project/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppointmentsScreen extends StatelessWidget {
  const MyAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        70.getH(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const DoctorLogo(),
                  20.getW(),
                  Text(
                    "My Appointments",
                    style: AppTextStyle.urbanistMedium.copyWith(
                      color: AppColors.c_2C3A4B,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  RingAndFavoriteItems(
                    icon: const Icon(
                      Icons.add_circle_outline_sharp,
                      color: AppColors.c_2972FE,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              26.getH(),
            ],
          ),
        ),
        BlocBuilder<AppointmentHistoryBloc, AppointmentHistoryState>(
            builder: (context, state) {
          debugPrint(
              "++++++++++++++++++++++++++${state.formStatus}++++++++++++");
          if (state.formStatus == FormStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.formStatus == FormStatus.error) {
            return Center(
              child: Text(state.errorText),
            );
          }
          if (state.formStatus == FormStatus.success) {
            return Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 100.h),
                  itemCount: state.appointmentHistories.length,
                  itemBuilder: (context, index) {
                    debugPrint("----------0987866787877---------------$index");
                    return AppointmentWidget(
                      onTap: () {
                        context.read<DoctorBloc>().add(FetchDoctorById(
                            state.appointmentHistories[index].doctorId));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailAppointmentScreen(
                                  appointmentHistoryModel:
                                      state.appointmentHistories[index]);
                            },
                          ),
                        );
                      },
                      doctorName:
                          "${state.appointmentHistories[index].doctorFirstName} ${state.appointmentHistories[index].doctorLastName}",
                      time: state
                          .appointmentHistories[index].appointmentStartTime,
                      status: state.appointmentHistories[index].patientStatus,
                      imageUrlDoc: context
                          .read<DoctorBloc>()
                          .state
                          .doctors
                          .where((element) =>
                              element.id ==
                              state.appointmentHistories[index].doctorId)
                          .toList()[0]
                          .imageUrl,
                    );
                  }),
            );
          }
          return const SizedBox.shrink();
        }),
      ],
    ));
  }
}
