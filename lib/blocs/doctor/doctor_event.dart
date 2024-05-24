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



class GetUser extends DoctorEvent{}