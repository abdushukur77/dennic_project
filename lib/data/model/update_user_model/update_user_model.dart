class UpdateUserModel {
  final String birthDate;
  final String firstName;
  final String gender;
  final String id;
  final String imageUrl;
  final String lastName;

  UpdateUserModel({
    required this.birthDate,
    required this.firstName,
    required this.gender,
    required this.id,
    required this.imageUrl,
    required this.lastName,
  });

  factory UpdateUserModel.fromJson(Map<String, dynamic> json) {
    return UpdateUserModel(
      birthDate: json['birth_date'] as String? ?? "",
      firstName: json['first_name'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
      id: json['id'] as String? ?? "",
      imageUrl: json['image_url'] as String? ?? "",
      lastName: json['last_name'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'birth_date': birthDate,
      'first_name': firstName,
      'gender': gender,
      'id': id,
      'image_url': imageUrl,
      'last_name': lastName,
    };
  }
}
