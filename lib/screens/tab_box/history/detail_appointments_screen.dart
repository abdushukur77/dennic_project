import 'package:dennic_project/blocs/doctor/doctor_bloc.dart';
import 'package:dennic_project/data/model/appointment_history/appointment_history_model.dart';
import 'package:dennic_project/screens/tab_box/history/widget/appointment.dart';
import 'package:dennic_project/screens/tab_box/history/widget/info_column.dart';
import 'package:dennic_project/screens/tab_box/history/widget/info_raw.dart';
import 'package:dennic_project/screens/tab_box/history/widget/section_title.dart';
import 'package:dennic_project/utils/styles/app_text_style.dart';
import 'package:dennic_project/utils/utility_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailAppointmentScreen extends StatefulWidget {
  const DetailAppointmentScreen(
      {super.key, required this.appointmentHistoryModel});

  final AppointmentHistoryModel appointmentHistoryModel;

  @override
  State<DetailAppointmentScreen> createState() =>
      _DetailAppointmentScreenState();
}

class _DetailAppointmentScreenState extends State<DetailAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Appointments",
          style: AppTextStyle.urbanistMedium.copyWith(fontSize: 20.sp),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            AppointmentWidget(
              doctorName: widget.appointmentHistoryModel.doctorLastName +
                  " " +
                  widget.appointmentHistoryModel.doctorLastName,
              time: widget.appointmentHistoryModel.appointmentStartTime,
              status: widget.appointmentHistoryModel.patientStatus,
              imageUrlDoc: context
                  .read<DoctorBloc>()
                  .state
                  .doctors
                  .where((element) =>
                      element.id == widget.appointmentHistoryModel.doctorId)
                  .toList()[0]
                  .imageUrl,
              onTap: () {


              },
            ),
            Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.0.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InfoColumn(
                          icon: Icons.people,
                          value: context.read<DoctorBloc>().state.doctorModel.patientCount.toString(),
                          label: 'Patients',
                        ),
                        InfoColumn(
                          icon: Icons.person,
                          value: context.read<DoctorBloc>().state.doctorModel.workYears.toString(),
                          label: 'Years experiences',
                        ),
                        InfoColumn(
                          icon: Icons.location_on,
                          value: context.read<DoctorBloc>().state.doctorModel.country.toString(),
                          label: 'Reviews',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0.h),
                  SectionTitle(title: 'Visit Time'),
                  SizedBox(height: 8.0.h),
                  Text(formatDateTime(DateTime.parse(widget.appointmentHistoryModel.appointmentDate.toString()).toString()),
                      style: TextStyle(fontSize: 16.0.sp)),
                  Text('${widget.appointmentHistoryModel.appointmentStartTime.substring(0,5)} - ${widget.appointmentHistoryModel.appointmentFinishTime.substring(0,5)}', style: TextStyle(fontSize: 16.0.sp)),
                  Divider(height: 32.0.h),
                  SectionTitle(title: 'Patient Information'),
                  SizedBox(height: 8.0.h),
                  InfoRow(label: 'Full Name', value: widget.appointmentHistoryModel.patientFullName),
                  InfoRow(label: 'Birth date', value: widget.appointmentHistoryModel.birth),
                  InfoRow(label: 'Phone', value: widget.appointmentHistoryModel.patientPhoneNumber),
                  Divider(height: 32.0.h),
                  SectionTitle(title: 'Fee Information'),
                  SizedBox(height: 8.0.h),
                  Text('${widget.appointmentHistoryModel.paymentAmount} UZS',
                      style: TextStyle(fontSize: 16.0.sp, color: Colors.blue)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
