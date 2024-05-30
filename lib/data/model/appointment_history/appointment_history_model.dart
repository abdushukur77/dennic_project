class AppointmentHistoryModel {
  final String appointmentDate;
  final String appointmentFinishTime;
  final String appointmentStartTime;
  final String createdAt;
  final String departmentId;
  final String doctorFirstName;
  final String doctorId;
  final String doctorLastName;
  final int doctorPatientsCount;
  final String doctorServiceId;
  final int doctorWorkingYears;
  final int duration;
  final String expiresAt;
  final int id;
  final String key;
  final String patientFullName;
  final String patientId;
  final String patientPhoneNumber;
  final String patientProblem;
  final String patientStatus;
  final int paymentAmount;
  final String paymentType;
  final String updatedAt;
  final String userId;
  final String birth;

  AppointmentHistoryModel({
    required this.appointmentDate,
    required this.appointmentFinishTime,
    required this.appointmentStartTime,
    required this.createdAt,
    required this.departmentId,
    required this.doctorFirstName,
    required this.doctorId,
    required this.doctorLastName,
    required this.doctorPatientsCount,
    required this.doctorServiceId,
    required this.doctorWorkingYears,
    required this.duration,
    required this.expiresAt,
    required this.id,
    required this.key,
    required this.patientFullName,
    required this.patientId,
    required this.patientPhoneNumber,
    required this.patientProblem,
    required this.patientStatus,
    required this.paymentAmount,
    required this.paymentType,
    required this.updatedAt,
    required this.userId,
    required this.birth,
  });

  factory AppointmentHistoryModel.fromJson(Map<String, dynamic> json) {
    return AppointmentHistoryModel(
      appointmentDate: json['appointment_date'] as String? ?? '',
      appointmentFinishTime: json['appointment_finish_time'] as String? ?? '',
      appointmentStartTime: json['appointment_start_time'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      departmentId: json['department_id'] as String? ?? '',
      doctorFirstName: json['doctor_first_name'] as String? ?? '',
      doctorId: json['doctor_id'] as String? ?? '',
      doctorLastName: json['doctor_last_name'] as String? ?? '',
      doctorPatientsCount: json['doctor_patients_count'] as int? ?? 0,
      doctorServiceId: json['doctor_service_id'] as String? ?? '',
      doctorWorkingYears: json['doctor_working_years'] as int? ?? 0,
      duration: json['duration'] as int? ?? 0,
      expiresAt: json['expires_at'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      key: json['key'] as String? ?? '',
      patientFullName: json['patient_full_name'] as String? ?? '',
      patientId: json['patient_id'] as String? ?? '',
      patientPhoneNumber: json['patient_phone_number'] as String? ?? '',
      patientProblem: json['patient_problem'] as String? ?? '',
      patientStatus: json['patient_status'] as String? ?? '',
      paymentAmount: json['payment_amount'] as int? ?? 0,
      paymentType: json['payment_type'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      birth: json['patient_birth_date'] as String? ?? '',
    );
  }

  static AppointmentHistoryModel initial() {
    return AppointmentHistoryModel(
      appointmentDate: '',
      appointmentFinishTime: '',
      appointmentStartTime: '',
      createdAt: '',
      departmentId: '',
      doctorFirstName: '',
      doctorId: '',
      doctorLastName: '',
      doctorPatientsCount: 0,
      doctorServiceId: '',
      doctorWorkingYears: 0,
      duration: 0,
      expiresAt: '',
      id: 0,
      key: '',
      patientFullName: '',
      patientId: '',
      patientPhoneNumber: '',
      patientProblem: '',
      patientStatus: '',
      paymentAmount: 0,
      paymentType: '',
      updatedAt: '',
      userId: '',
      birth: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appointment_date': appointmentDate,
      'appointment_finish_time': appointmentFinishTime,
      'appointment_start_time': appointmentStartTime,
      'created_at': createdAt,
      'department_id': departmentId,
      'doctor_first_name': doctorFirstName,
      'doctor_id': doctorId,
      'doctor_last_name': doctorLastName,
      'doctor_patients_count': doctorPatientsCount,
      'doctor_service_id': doctorServiceId,
      'doctor_working_years': doctorWorkingYears,
      'duration': duration,
      'expires_at': expiresAt,
      'id': id,
      'key': key,
      'patient_full_name': patientFullName,
      'patient_id': patientId,
      'patient_phone_number': patientPhoneNumber,
      'patient_problem': patientProblem,
      'patient_status': patientStatus,
      'payment_amount': paymentAmount,
      'payment_type': paymentType,
      'updated_at': updatedAt,
      'user_id': userId,
      'patient_birth_date':birth
    };
  }
}
