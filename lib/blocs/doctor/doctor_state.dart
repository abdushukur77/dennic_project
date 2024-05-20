import '../../data/model/doctor_model/doctor_model.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';

import '../../data/model/user_info/my_user_model.dart';

class DoctorState {
  final FormStatus formStatus;
  final List<DoctorModel> doctors;
  final List<DoctorModel> searchDoctors;
  final String errorMessage;
  final MyUserModel myUserModel;

  DoctorState({
    this.formStatus = FormStatus.pure,
    this.doctors = const [],
    this.searchDoctors = const [],
    this.errorMessage = '',
    required this.myUserModel,
  });

  DoctorState copyWith({
    FormStatus? formStatus,
    List<DoctorModel>? doctors,
    MyUserModel? myUserModel,
    List<DoctorModel>? searchDoctors,
    String? errorMessage,
  }) {
    return DoctorState(
      searchDoctors: searchDoctors ?? this.searchDoctors,
      formStatus: formStatus ?? this.formStatus,
      doctors: doctors ?? this.doctors,
      errorMessage: errorMessage ?? this.errorMessage,
      myUserModel: myUserModel ?? this.myUserModel,
    );
  }
}
