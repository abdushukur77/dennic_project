import 'package:dennic_project/data/model/date_model/date_model.dart';

import '../../data/model/doctor_model/doctor_model.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';

import '../../data/model/user_info/my_user_model.dart';

class DoctorState {
  final FormStatus formStatus;
  final List<DoctorModel> doctors;
  final List<DoctorModel> searchDoctors;
  final String errorMessage;
  final MyUserModel myUserModel;
  final DoctorModel doctorModel;
  final List<DateModel> dateModels;

  DoctorState(
      {this.formStatus = FormStatus.pure,
      this.dateModels = const [],
      this.doctors = const [],
      this.searchDoctors = const [],
      this.errorMessage = '',
      required this.myUserModel,
      required this.doctorModel});

  DoctorState copyWith({
    DoctorModel? doctorModel,
    FormStatus? formStatus,
    List<DoctorModel>? doctors,
    MyUserModel? myUserModel,
    List<DoctorModel>? searchDoctors,
    String? errorMessage,
    List<DateModel>? dateModels,
  }) {
    return DoctorState(
      doctorModel: doctorModel ?? this.doctorModel,
      searchDoctors: searchDoctors ?? this.searchDoctors,
      formStatus: formStatus ?? this.formStatus,
      doctors: doctors ?? this.doctors,
      errorMessage: errorMessage ?? this.errorMessage,
      myUserModel: myUserModel ?? this.myUserModel,
      dateModels: dateModels ?? this.dateModels,
    );
  }
}
