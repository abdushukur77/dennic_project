class MyUserModel {
  final String id;
  final int userOrder;
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final String phoneNumber;
  final String password;
  final String gender;
  final String imageUrl;
  final DateTime createdAt;
  final DateTime? updatedAt;

  MyUserModel({
    required this.id,
    required this.userOrder,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.phoneNumber,
    required this.password,
    required this.gender,
    required this.imageUrl,
    required this.createdAt,
    this.updatedAt,
  });

  factory MyUserModel.fromJson(Map<String, dynamic> json) {
    return MyUserModel(
      id: json['id'],
      userOrder: json['user_order'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      birthDate: DateTime.parse(json['birth_date']),
      phoneNumber: json['phone_number'],
      password: json['password'],
      gender: json['gender'],
      imageUrl: json['image_url'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] != null && json['updated_at'].isNotEmpty
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_order': userOrder,
      'first_name': firstName,
      'last_name': lastName,
      'birth_date': birthDate.toIso8601String(),
      'phone_number': phoneNumber,
      'password': password,
      'gender': gender,
      'image_url': imageUrl,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  MyUserModel copyWith({
    String? id,
    int? userOrder,
    String? firstName,
    String? lastName,
    DateTime? birthDate,
    String? phoneNumber,
    String? password,
    String? gender,
    String? imageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return MyUserModel(
      id: id ?? this.id,
      userOrder: userOrder ?? this.userOrder,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthDate: birthDate ?? this.birthDate,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
