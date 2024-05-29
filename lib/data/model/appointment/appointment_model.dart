class AppointmentModel {
  final String appointmentDate;
  final String appointmentTime;
  final String doctorId;
  final String doctorServiceId;
  final String patientId;

  AppointmentModel({
    required this.appointmentDate,
    required this.appointmentTime,
    required this.doctorId,
    required this.doctorServiceId,
    required this.patientId,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      appointmentDate: json['appointment_date'] as String? ?? '',
      appointmentTime: json['appointment_time'] as String? ?? '',
      doctorId: json['doctor_id'] as String? ?? '',
      doctorServiceId: json['doctor_service_id'] as String? ?? '',
      patientId: json['patient_id'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appointment_date': appointmentDate,
      'appointment_time': "$appointmentTime:00",
      'doctor_id': doctorId,
      'doctor_service_id': doctorServiceId,
      'patient_id': patientId,
    };
  }

  AppointmentModel copyWith({
    String? appointmentDate,
    String? appointmentTime,
    String? doctorId,
    String? doctorServiceId,
    String? patientId,
  }) {
    return AppointmentModel(
      appointmentDate: appointmentDate ?? this.appointmentDate,
      appointmentTime: appointmentTime ?? this.appointmentTime,
      doctorId: doctorId ?? this.doctorId,
      doctorServiceId: doctorServiceId ?? this.doctorServiceId,
      patientId: patientId ?? this.patientId,
    );
  }

  static AppointmentModel initial() => AppointmentModel(
        appointmentDate: '',
        appointmentTime: '',
        doctorId: '',
        doctorServiceId: '',
        patientId: '',
      );

  @override
  String toString() {
    return 'AppointmentModel(appointmentDate: $appointmentDate, appointmentTime: $appointmentTime, doctorId: $doctorId, doctorServiceId: $doctorServiceId, patientId: $patientId)';
  }
}
