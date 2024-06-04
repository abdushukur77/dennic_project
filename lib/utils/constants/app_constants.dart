class AppConstants {
  static RegExp passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
  static RegExp textRegExp = RegExp(r"^[A-Z][a-zA-Z]*");

  static String registerUrl = "https://swag.dennic.uz/v1/customer/register";
  static String verifyUserUrl = "https://swag.dennic.uz/v1/customer/verify";
  static String loginUserUrl = "https://swag.dennic.uz/v1/customer/login";
  static String logoutUrl = "https://swag.dennic.uz/v1/customer/logout";
  static String forgetPasswordUrl =
      "https://swag.dennic.uz/v1/customer/forget-password";
  static String verifyOtpCodeUrl =
      "https://swag.dennic.uz/v1/customer/verify-otp-code";
  static String updateUserPasswordUrl =
      "https://swag.dennic.uz/v1/customer/update-password";
  static String updateTokenUrl =
      "https://swag.dennic.uz/v1/user/update-refresh-token";
  static String getUserUrl = "https://swag.dennic.uz/v1/user/get";
  static String fetchDoctorsUrl = "https://swag.dennic.uz/v1/doctor";
  static String fetchSpecializationsUrl =
      "https://swag.dennic.uz/v1/specialization";
  static String fetchBySpecializationsUrl =
      "https://swag.dennic.uz/v1/doctor/spec";
  static String fetchByDoctorId = "https://swag.dennic.uz/v1/doctor/get";
  static String updateUserUrl = "https://swag.dennic.uz/v1/user/update";
  static String getDateUrl = "https://swag.dennic.uz/v1/appointment/dates";
  static String getDoctorServiceUrl =
      "https://swag.dennic.uz/v1/doctor-services";
  static String bookAppointmentUrl =
      "https://swag.dennic.uz/v1/appointment/booking";
  static String createPatientUrl = "https://swag.dennic.uz/v1/patient/create";
  static String createAppointmentUrl =
      "https://swag.dennic.uz/v1/appointment/create";
  static String getAppointmentHistoryUrl =
      "https://swag.dennic.uz/v1/appointment";
  static String baseUrl = 'https://swag.dennic.uz/v1';

  static const List<String> countries = [
    "Uzbekistan",
    "Afghanistan",
    "Armenia",
    "Azerbaijan",
    "Bahrain",
    "Bangladesh",
    "Bhutan",
    "Brunei",
    "Cambodia",
    "China",
    "Cyprus",
    "Georgia",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Israel",
    "Japan",
    "Jordan",
    "Kazakhstan",
    "Kuwait",
    "Kyrgyzstan",
    "Laos",
    "Lebanon",
    "Malaysia",
    "Maldives",
    "Mongolia",
    "Myanmar (Burma)",
    "Nepal",
    "North Korea",
    "Oman",
    "Pakistan",
    "Palestine",
    "Philippines",
    "Qatar",
    "Russia (partly in Asia)",
    "Saudi Arabia",
    "Singapore",
    "South Korea",
    "Sri Lanka",
    "Syria",
    "Taiwan",
    "Tajikistan",
    "Thailand",
    "Timor-Leste (East Timor)",
    "Turkey (partly in Asia)",
    "Turkmenistan",
    "United Arab Emirates",
    "Vietnam",
    "Yemen",
  ];

  static const String tableName = "Doctors";
  static const String id = "_id";
  static const String firstName = "first_name";
  static const String lastName = "last_name";
  static const String imageUrl = "image_url";
  static const String gender = "gender";
  static const String birthDate = "birth_date";
  static const String phoneNumber = "phone_number";
  static const String email = "email";
  static const String address = "address";
  static const String city = "city";
  static const String country = "country";
  static const String salary = "salary";
  static const String startTime = "start_time";
  static const String finishTime = "finish_time";
  static const String dayOfWeek = "day_of_week";
  static const String bio = "bio";
  static const String startWorkDate = "start_work_date";
  static const String endWorkDate = "end_work_date";
  static const String workYears = "work_years";
  static const String departmentId = "department_id";
  static const String roomNumber = "room_number";
  static const String createdAt = "created_at";
  static const String updatedAt = "updated_at";
  static const String deletedAt = "deleted_at";
  static const String patientCount = "patient_count";
}
