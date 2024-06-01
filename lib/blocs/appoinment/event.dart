import 'package:dennic_project/data/model/appointment/appointment_model.dart';
import 'package:dennic_project/data/model/patient/patient_modedl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

abstract class AppointmentEvent extends Equatable {
  const AppointmentEvent();

  @override
  List<Object> get props => [];
}

class UpdateAppointmentDate extends AppointmentEvent {
  final String appointmentDate;

  const UpdateAppointmentDate(this.appointmentDate);

  @override
  List<Object> get props => [appointmentDate];
}

class UpdateAppointmentTime extends AppointmentEvent {
  final String appointmentTime;

  const UpdateAppointmentTime(this.appointmentTime);

  @override
  List<Object> get props => [appointmentTime];
}

class UpdateDoctorId extends AppointmentEvent {
  final String doctorId;

  const UpdateDoctorId(this.doctorId);

  @override
  List<Object> get props => [doctorId];
}

class UpdateDoctorServiceId extends AppointmentEvent {
  final String doctorServiceId;

  const UpdateDoctorServiceId(this.doctorServiceId);

  @override
  List<Object> get props => [doctorServiceId];
}

class UpdatePatientId extends AppointmentEvent {
  final String patientId;

  const UpdatePatientId(this.patientId);

  @override
  List<Object> get props => [patientId];
}

class Addkasal extends AppointmentEvent {
  final PatientModel patientModel;

  const Addkasal({required this.patientModel});
}

class CreateBookAppointment extends AppointmentEvent {
  const CreateBookAppointment({required this.appointmentModel});

  final AppointmentModel appointmentModel;
}
