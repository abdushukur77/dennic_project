import 'package:dennic_project/data/model/patient/patient_modedl.dart';

abstract class DoctorEvent {}

class FetchDoctors extends DoctorEvent {}

class FetchDoctorsBySpecialization extends DoctorEvent {
  final String specializationId;

  FetchDoctorsBySpecialization(this.specializationId);
}

class FetchDoctorById extends DoctorEvent {
  final String doctorId;

  FetchDoctorById(this.doctorId);
}

class GetUser extends DoctorEvent {}

class GetDate extends DoctorEvent {}

class GetTable extends DoctorEvent {
  GetTable({required this.doctorId, required this.date});

  final String doctorId;
  final String date;
}

class GetDoctorService extends DoctorEvent {
  GetDoctorService({required this.id});

  final String id;
}

class PostPatient extends DoctorEvent {
  PostPatient({required this.patientModel});

  final PatientModel patientModel;
}
