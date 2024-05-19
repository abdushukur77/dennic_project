import '../../data/model/doctor_model/doctor_model.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';

class DoctorState {
  final FormStatus formStatus;
  final List<Doctor> doctors;
  final String errorMessage;

  DoctorState({
    this.formStatus = FormStatus.pure,
    this.doctors = const [],
    this.errorMessage = '',
  });

  DoctorState copyWith({
    FormStatus? formStatus,
    List<Doctor>? doctors,
    String? errorMessage,
  }) {
    return DoctorState(
      formStatus: formStatus ?? this.formStatus,
      doctors: doctors ?? this.doctors,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
