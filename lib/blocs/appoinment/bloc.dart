import 'package:dennic_project/blocs/appoinment/event.dart';
import 'package:dennic_project/blocs/appoinment/state.dart';
import 'package:dennic_project/data/model/appointment/appointment_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentBloc()
      : super(AppointmentState(appointment: AppointmentModel.initial())) {
    on<UpdateAppointmentDate>((event, emit) {
      emit(state.copyWith(
          appointment: state.appointment.copyWith(
            appointmentDate: event.appointmentDate,
          )));
    });

    on<UpdateAppointmentTime>((event, emit) {
      emit(state.copyWith(
          appointment: state.appointment.copyWith(
            appointmentTime: event.appointmentTime,
          )));
    });

    on<UpdateDoctorId>((event, emit) {
      emit(state.copyWith(
          appointment: state.appointment.copyWith(
            doctorId: event.doctorId,
          )));
    });

    on<UpdateDoctorServiceId>((event, emit) {
      emit(state.copyWith(
          appointment: state.appointment.copyWith(
            doctorServiceId: event.doctorServiceId,
          )));
    });

    on<UpdatePatientId>((event, emit) {
      emit(state.copyWith(
          appointment: state.appointment.copyWith(
            patientId: event.patientId,
          )));
    });
  }
}
