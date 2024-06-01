import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:dennic_project/data/model/appointment/appointment_model.dart';
import 'package:equatable/equatable.dart';

class AppointmentState {
  final AppointmentModel appointment;
  final String potentId;
  final String errorText;
  final String statusMessage;
  final FormStatus formStatus;

  AppointmentState({
    required this.appointment,
    required this.potentId,
    required this.formStatus,
    required this.errorText,
    required this.statusMessage,
  });

  AppointmentState copyWith({
    AppointmentModel? appointment,
    String? potentId,
    String? errorText,
    String? statusMessage,
    FormStatus? formStatus,
  }) {
    return AppointmentState(
      appointment: appointment ?? this.appointment,
      potentId: potentId ?? this.potentId,
      formStatus: formStatus ?? this.formStatus,
      errorText: errorText ?? this.errorText,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }
}
