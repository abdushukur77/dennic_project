import '../../data/model/doctor_model/doctor_model.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';

class DoctorState {
  final FormStatus formStatus;
  final List<DoctorModel> doctors;
  final List<DoctorModel> searchDoctors;
  final String errorMessage;

  DoctorState({
    this.formStatus = FormStatus.pure,
    this.doctors = const [],
    this.searchDoctors = const [],
    this.errorMessage = '',
  });

  DoctorState copyWith({
    FormStatus? formStatus,
    List<DoctorModel>? doctors,
    List<DoctorModel>? searchDoctors,
    String? errorMessage,
  }) {
    return DoctorState(
      searchDoctors: searchDoctors ?? this.searchDoctors,
      formStatus: formStatus ?? this.formStatus,
      doctors: doctors ?? this.doctors,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
