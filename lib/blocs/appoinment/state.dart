import 'package:dennic_project/data/model/appointment/appointment_model.dart';
import 'package:equatable/equatable.dart';

class AppointmentState extends Equatable {
  final AppointmentModel appointment;

  const AppointmentState({required this.appointment});

  @override
  List<Object> get props => [appointment];

  AppointmentState copyWith({AppointmentModel? appointment}) {
    return AppointmentState(
      appointment: appointment ?? this.appointment,
    );
  }
}
