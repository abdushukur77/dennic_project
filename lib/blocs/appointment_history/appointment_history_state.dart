part of 'appointment_history_bloc.dart';

class AppointmentHistoryState extends Equatable {
  final String errorText;
  final FormStatus formStatus;
  final List<AppointmentHistoryModel> appointmentHistories;

  const AppointmentHistoryState({
    required this.formStatus,
    required this.errorText,
    required this.appointmentHistories,
  });

  static AppointmentHistoryState initial() => const AppointmentHistoryState(
        formStatus: FormStatus.pure,
        errorText: '',
        appointmentHistories: [],
      );

  AppointmentHistoryState copyWith({
    String? errorText,
    FormStatus? formStatus,
    List<AppointmentHistoryModel>? appointmentHistories,
  }) =>
      AppointmentHistoryState(
        formStatus: formStatus ?? this.formStatus,
        errorText: errorText ?? this.errorText,
        appointmentHistories: appointmentHistories ?? this.appointmentHistories,
      );

  @override
  List<Object?> get props => [
        errorText,
        formStatus,
        appointmentHistories,
      ];
}
