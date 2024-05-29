class SupportModel {
  final String email;
  final String fullName;
  final String message;
  final String phoneNumber;

  SupportModel({
    required this.email,
    required this.fullName,
    required this.message,
    required this.phoneNumber,
  });

  // Factory constructor to create a SupportMessage from JSON
  factory SupportModel.fromJson(Map<String, dynamic> json) {
    return SupportModel(
      email: json['email'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      message: json['message'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
    );
  }

  static SupportModel initial() => SupportModel(
        email: 'email',
        fullName: 'fullName',
        message: 'message',
        phoneNumber: 'phoneNumber',
      );

  // Method to convert a SupportMessage to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'full_name': fullName,
      'message': message,
      'phone_number': phoneNumber,
    };
  }
}
