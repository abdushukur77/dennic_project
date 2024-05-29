import 'package:dennic_project/data/model/appointment/appointment_model.dart';
import 'package:dennic_project/data/model/date_model/date_model.dart';
import 'package:dennic_project/data/model/doctor_service/service_model.dart';
import 'package:dennic_project/data/model/table/table_model.dart';

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
  final AppointmentModel appointmentModel;
  final List<DateModel> dateModels;
  final List<TableModel> tableModels;
  final List<ServiceModel> serviceModels;
  final String id;

  DoctorState({
    this.formStatus = FormStatus.pure,
    this.dateModels = const [],
    this.tableModels = const [],
    this.serviceModels = const [],
    this.doctors = const [],
    this.searchDoctors = const [],
    this.errorMessage = '',
    this.id = "",
    required this.myUserModel,
    required this.doctorModel,
    required this.appointmentModel,
  });

  DoctorState copyWith({
    DoctorModel? doctorModel,
    FormStatus? formStatus,
    List<DoctorModel>? doctors,
    MyUserModel? myUserModel,
    List<DoctorModel>? searchDoctors,
    String? errorMessage,
    List<DateModel>? dateModels,
    List<TableModel>? tableModels,
    List<ServiceModel>? serviceModels,
    String? id,
    AppointmentModel? appointmentModel,
  }) {
    return DoctorState(
      doctorModel: doctorModel ?? this.doctorModel,
      searchDoctors: searchDoctors ?? this.searchDoctors,
      formStatus: formStatus ?? this.formStatus,
      doctors: doctors ?? this.doctors,
      errorMessage: errorMessage ?? this.errorMessage,
      myUserModel: myUserModel ?? this.myUserModel,
      dateModels: dateModels ?? this.dateModels,
      tableModels: tableModels ?? this.tableModels,
      serviceModels: serviceModels ?? this.serviceModels,
      id: id ?? this.id,
      appointmentModel: appointmentModel ?? this.appointmentModel,
    );
  }
}
