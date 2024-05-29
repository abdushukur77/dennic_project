class PatientModel {
  String address;
  String birthDate;
  String bloodGroup;
  String city;
  String country;
  String firstName;
  String gender;
  String lastName;
  String patientProblem;
  String phoneNumber;

  PatientModel({
    required this.address,
    required this.birthDate,
    required this.bloodGroup,
    required this.city,
    required this.country,
    required this.firstName,
    required this.gender,
    required this.lastName,
    required this.patientProblem,
    required this.phoneNumber,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      address: json['address'] as String? ?? "",
      birthDate: json['birth_date'] as String? ?? "",
      bloodGroup: json['blood_group'] as String? ?? "",
      city: json['city'] as String? ?? "",
      country: json['country'] as String? ?? "",
      firstName: json['first_name'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
      lastName: json['last_name'] as String? ?? "",
      patientProblem: json['patient_problem'] as String? ?? "",
      phoneNumber: json['phone_number'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'birth_date': birthDate,
      'blood_group': bloodGroup,
      'city': city,
      'country': country,
      'first_name': firstName,
      'gender': gender,
      'last_name': lastName,
      'patient_problem': patientProblem,
      'phone_number': phoneNumber,
    };
  }

  static PatientModel initial() {
    return PatientModel(
      address: '',
      birthDate: '',
      bloodGroup: '',
      city: '',
      country: '',
      firstName: '',
      gender: '',
      lastName: '',
      patientProblem: '',
      phoneNumber: '',
    );
  }

  Map<String, dynamic> toJsonForUpdate() {
    final data = <String, dynamic>{};
    if (address.isNotEmpty) data['address'] = address;
    if (birthDate.isNotEmpty) data['birth_date'] = birthDate;
    if (bloodGroup.isNotEmpty) data['blood_group'] = bloodGroup;
    if (city.isNotEmpty) data['city'] = city;
    if (country.isNotEmpty) data['country'] = country;
    if (firstName.isNotEmpty) data['first_name'] = firstName;
    if (gender.isNotEmpty) data['gender'] = gender;
    if (lastName.isNotEmpty) data['last_name'] = lastName;
    if (patientProblem.isNotEmpty) data['patient_problem'] = patientProblem;
    if (phoneNumber.isNotEmpty) data['phone_number'] = phoneNumber;
    return data;
  }
}
