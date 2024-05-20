class MyUserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String birthDate;
  final String phoneNumber;
  final String password;
  final String gender;
  final String imageUrl;

  MyUserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.phoneNumber,
    required this.password,
    required this.gender,
    required this.imageUrl,
  });

  factory MyUserModel.fromJson(Map<String, dynamic> json) {
    return MyUserModel(
      id: json['id'] as String? ?? "",
      firstName: json['first_name'] as String? ?? "",
      lastName: json['last_name'] as String? ?? "",
      birthDate: json['birth_date'] as String? ?? "",
      phoneNumber: json['phone_number'] as String? ?? "",
      password: json['password'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
      imageUrl: json['image_url'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'birth_date': birthDate,
      'gender': gender,
      'image_url': imageUrl,
    };
  }

  static MyUserModel initial() =>
      MyUserModel(id: "",
        firstName: "",
        lastName: "",
        birthDate: "",
        phoneNumber: "",
        password: "",
        gender: "",
        imageUrl: "");

  MyUserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? birthDate,
    String? phoneNumber,
    String? password,
    String? gender,
    String? imageUrl,
  }) {
    return MyUserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      imageUrl: imageUrl ?? this.imageUrl,
      birthDate: birthDate ?? this.birthDate,
    );
  }
}
