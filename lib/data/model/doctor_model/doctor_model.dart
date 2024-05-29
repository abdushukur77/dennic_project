class DoctorModel {
  final String id;
  final String firstName;
  final String lastName;
  final String imageUrl;
  final String gender;
  final String birthDate;
  final String phoneNumber;
  final String email;
  final String address;
  final String city;
  final String country;
  final double salary;
  final String startTime;
  final String finishTime;
  final String dayOfWeek;
  final String bio;
  final String startWorkDate;
  final String endWorkDate;
  final int workYears;
  final String departmentId;
  final int roomNumber;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;
  final int patientCount;
  final List<SpecializationM> specializations;

  DoctorModel({
    required this.patientCount,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
    required this.gender,
    required this.birthDate,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.city,
    required this.country,
    required this.salary,
    required this.startTime,
    required this.finishTime,
    required this.dayOfWeek,
    required this.bio,
    required this.startWorkDate,
    required this.endWorkDate,
    required this.workYears,
    required this.departmentId,
    required this.roomNumber,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.specializations,
  });

  DoctorModel.initial()
      : patientCount = 0,
        id = "",
        firstName = "",
        lastName = "",
        imageUrl = "",
        gender = "",
        birthDate = "",
        phoneNumber = "",
        email = "",
        address = "",
        city = "",
        country = "",
        salary = 0.0,
        startTime = "",
        finishTime = "",
        dayOfWeek = "",
        bio = "",
        startWorkDate = "",
        endWorkDate = "",
        workYears = 0,
        departmentId = "",
        roomNumber = 0,
        createdAt = "",
        updatedAt = "",
        deletedAt = "",
        specializations = [];

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      patientCount: json["patient_count"] as int? ?? 0,
      id: json['id'] as String? ?? "",
      firstName: json['first_name'] as String? ?? "",
      lastName: json['last_name'] as String? ?? "",
      imageUrl: json['image_url'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
      birthDate: json['birth_date'] as String? ?? "",
      phoneNumber: json['phone_number'] as String? ?? "",
      email: json['email'] as String? ?? "",
      address: json['address'] as String? ?? "",
      city: json['city'] as String? ?? "",
      country: json['country'] as String? ?? "",
      salary: (json['salary'] as num?)?.toDouble() ?? 0.0,
      startTime: json['start_time'] as String? ?? "",
      finishTime: json['finish_time'] as String? ?? "",
      dayOfWeek: json['day_of_week'] as String? ?? "",
      bio: json['bio'] as String? ?? "",
      startWorkDate: json['start_work_date'] as String? ?? "",
      endWorkDate: json['end_work_date'] as String? ?? "",
      workYears: json['work_years'] as int? ?? 0,
      departmentId: json['department_id'] as String? ?? "",
      roomNumber: json['room_number'] as int? ?? 0,
      createdAt: json['created_at'] as String? ?? "",
      updatedAt: json['updated_at'] as String? ?? "",
      deletedAt: json['deleted_at'] as String? ?? "",
      specializations: (json['specializations'] as List?)
              ?.map((specJson) => SpecializationM.fromJson(specJson))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'image_url': imageUrl,
      'gender': gender,
      'birth_date': birthDate,
      'phone_number': phoneNumber,
      'email': email,
      'address': address,
      'city': city,
      'country': country,
      'salary': salary,
      'start_time': startTime,
      'finish_time': finishTime,
      'day_of_week': dayOfWeek,
      'bio': bio,
      'start_work_date': startWorkDate,
      'end_work_date': endWorkDate,
      'work_years': workYears,
      'department_id': departmentId,
      'room_number': roomNumber,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'patient_count': patientCount,
      'specializations': specializations.map((spec) => spec.toJson()).toList(),
    };
  }
}

class SpecializationM {
  final String id;
  final String name;

  SpecializationM({
    required this.id,
    required this.name,
  });

  factory SpecializationM.fromJson(Map<String, dynamic> json) {
    return SpecializationM(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
