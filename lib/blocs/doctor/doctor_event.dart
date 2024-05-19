abstract class DoctorEvent {}

class FetchDoctors extends DoctorEvent {}
class FetchDoctorsBySpecialization extends DoctorEvent {
  final String specializationId;

  FetchDoctorsBySpecialization(this.specializationId);
}