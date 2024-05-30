class HistoryModel {
  String appointmentDate;
  String appointmentFinishTime;
  String appointmentStartTime;
  String createdAt;
  String departmentId;
  String doctorFirstName;
  String doctorId;
  String doctorLastName;
  int doctorPatientsCount;
  String doctorServiceId;
  int doctorWorkingYears;
  int duration;
  String expiresAt;
  int id;
  String key;
  String patientFullName;
  String patientId;
  String patientPhoneNumber;
  String patientProblem;
  String patientStatus;
  int paymentAmount;
  String paymentType;
  String updatedAt;
  String userId;

  HistoryModel({
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
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      appointmentDate: json['appointment_date'],
      appointmentFinishTime: json['appointment_finish_time'],
      appointmentStartTime: json['appointment_start_time'],
      createdAt: json['created_at'],
      departmentId: json['department_id'],
      doctorFirstName: json['doctor_first_name'],
      doctorId: json['doctor_id'],
      doctorLastName: json['doctor_last_name'],
      doctorPatientsCount: json['doctor_patients_count'],
      doctorServiceId: json['doctor_service_id'],
      doctorWorkingYears: json['doctor_working_years'],
      duration: json['duration'],
      expiresAt: json['expires_at'],
      id: json['id'],
      key: json['key'],
      patientFullName: json['patient_full_name'],
      patientId: json['patient_id'],
      patientPhoneNumber: json['patient_phone_number'],
      patientProblem: json['patient_problem'],
      patientStatus: json['patient_status'],
      paymentAmount: json['payment_amount'],
      paymentType: json['payment_type'],
      updatedAt: json['updated_at'],
      userId: json['user_id'],
    );
  }

  static HistoryModel initial() {
    return HistoryModel(
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
    };
  }
}
