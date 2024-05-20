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
  final String password;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;
  final List<SpecializationM> specializations;

  DoctorModel({
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
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.specializations,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      imageUrl: json['image_url'],
      gender: json['gender'],
      birthDate: json['birth_date'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      address: json['address'],
      city: json['city'],
      country: json['country'],
      salary: json['salary'].toDouble(),
      startTime: json['start_time'],
      finishTime: json['finish_time'],
      dayOfWeek: json['day_of_week'],
      bio: json['bio'],
      startWorkDate: json['start_work_date'],
      endWorkDate: json['end_work_date'],
      workYears: json['work_years'],
      departmentId: json['department_id'],
      roomNumber: json['room_number'],
      password: json['password'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      specializations: (json['specializations'] as List)
          .map((specJson) => SpecializationM.fromJson(specJson))
          .toList(),
    );
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
      id: json['Id'] as String? ?? "",
      name: json['Name']as String? ?? "" ,
    );
  }
}
