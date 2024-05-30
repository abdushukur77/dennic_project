part of 'appointment_history_bloc.dart';

sealed class AppointmentHistoryEvent extends Equatable {
  const AppointmentHistoryEvent();
}

class GetAppointmentHistoryEvent extends AppointmentHistoryEvent{
  @override
  List<Object?> get props => throw UnimplementedError();
}
