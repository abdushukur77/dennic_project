import 'dart:convert';
import 'package:dennic_project/data/local/storage_repository.dart';
import 'package:dennic_project/data/model/appointment/appointment_model.dart';
import 'package:dennic_project/data/model/appointment_history/appointment_history_model.dart';
import 'package:dennic_project/data/model/date_model/date_model.dart';
import 'package:dennic_project/data/model/doctor_service/service_model.dart';
import 'package:dennic_project/data/model/login_model/login_model.dart';
import 'package:dennic_project/data/model/patient/patient_modedl.dart';
import 'package:dennic_project/data/model/support/support_model.dart';
import 'package:dennic_project/data/model/table/table_model.dart';
import 'package:dennic_project/data/model/update_user_model/update_user_model.dart';
import 'package:dennic_project/data/model/user_info/my_user_model.dart';
import 'package:dennic_project/data/model/user_model/user_model.dart';
import 'package:dennic_project/data/model/verify_model/verify_model.dart';
import 'package:dennic_project/data/model/networ_respons_model/network_response.dart';
import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;

import '../model/doctor_model/doctor_model.dart';
import '../model/specialization_model/specialization_model.dart';

class ApiProvider {
  static Future<NetworkResponse> registerUser(UserModel userModel) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      Uri uri = Uri.parse("https://swag.dennic.uz/v1/customer/register");

      http.Response response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(userModel.toJson()),
      );
      if (response.statusCode == 200) {
        networkResponse.data = "Registered";
      } else if (response.statusCode == 400) {
        debugPrint(
            "Status Coed: ${response.body}-----------------------------------");
        networkResponse.errorText = "this_number_already_registered";
      }
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }

    return networkResponse;
  }

  static Future<NetworkResponse> verifyUser(VerifyModel verifyModel) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      Uri uri = Uri.parse("https://swag.dennic.uz/v1/customer/verify");

      http.Response response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(verifyModel.toJson()),
      );
      if (response.statusCode == 200) {
        networkResponse.data = "Logged";
        Map<String, dynamic> myInfo = jsonDecode(response.body);

        await StorageRepository.setString(
          key: "access_token",
          value: myInfo["access_token"],
        );
        await StorageRepository.setString(
          key: "refresh_token",
          value: myInfo["refresh_token"],
        );
      } else if (response.statusCode == 400) {
        networkResponse.errorText = "this_number_already_registered";
      }
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }

    return networkResponse;
  }

  static Future<NetworkResponse> loginUser(LoginModel loginModel) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      Uri uri = Uri.parse("https://swag.dennic.uz/v1/customer/login");

      http.Response response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(loginModel.toJson()),
      );
      debugPrint(response.body);

      Map<String, dynamic> myInfo = jsonDecode(response.body);

      if (response.statusCode == 200) {
        networkResponse.data = "login";
        debugPrint("Keldi2");

        await StorageRepository.setString(
          key: "access_token",
          value: myInfo["access_token"],
        );
        await StorageRepository.setString(
          key: "refresh_token",
          value: myInfo["refresh_token"],
        );
      } else {
        debugPrint(response.body);
        networkResponse.errorText = myInfo["data"];
      }
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }

    return networkResponse;
  }

  static Future<NetworkResponse> logoutUser({required String token}) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      Uri uri = Uri.parse("https://swag.dennic.uz/v1/customer/logout");

      http.Response response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": token,
        },
      );
      if (response.statusCode == 200) {
        networkResponse.data = "Log out done!";
      } else if (response.statusCode == 270) {
        networkResponse.errorText = "illegal base64 data at input byte 225";
      }
    } catch (error) {
      networkResponse.errorText = "network error :)";
    }

    return networkResponse;
  }

  static Future<NetworkResponse> forgetPassword(
      {required String phoneNumber}) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      Uri uri = Uri.parse("https://swag.dennic.uz/v1/customer/forget-password");

      http.Response response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({"phone_number": phoneNumber}),
      );
      if (response.statusCode == 200) {
        networkResponse.data = "of_course";
      } else if (response.statusCode == 400) {
        networkResponse.errorText = "you haven't registered before";
      }
    } catch (error) {
      networkResponse.errorText =
          networkResponse.data["message"] as String? ?? "";
    }

    return networkResponse;
  }

  static Future<NetworkResponse> verifyOtpCode(
      {required String phoneNumber, required int code}) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      Uri uri = Uri.parse(
          "https://swag.dennic.uz/v1/customer/verify-otp-code?code=$code&phone_number=%2B${phoneNumber.replaceAll("+", "")}");

      http.Response response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        networkResponse.data = jsonDecode(response.body);
      } else if (response.statusCode == 400) {
        networkResponse.errorText =
            networkResponse.data["message"] as String? ?? "";
      }
    } catch (error) {
      networkResponse.errorText =
          networkResponse.data["message"] as String? ?? "";
    }

    return networkResponse;
  }

  static Future<NetworkResponse> updateUserPassword(
      {required String newPassword, required String token}) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      Uri uri = Uri.parse(
          "https://swag.dennic.uz/v1/customer/update-password?NewPassword=$newPassword");

      http.Response response = await http.put(
        uri,
        headers: {
          "Authorization": token,
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        networkResponse.data = jsonDecode(response.body);
      } else {
        networkResponse.errorText = response.statusCode.toString();
      }
    } catch (error) {
      networkResponse.errorText = "network error :)";
    }

    return networkResponse;
  }

  static Future<String> _updateToken() async {
    String error = "";

    String myRefreshToken = StorageRepository.getString(key: "refresh_token");
    debugPrint("$myRefreshToken ------------------");

    try {
      Uri uri =
          Uri.parse("https://swag.dennic.uz/v1/user/update-refresh-token");
      http.Response response = await http.put(
        uri,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({"refresh_token": myRefreshToken}),
      );

      Map<String, dynamic> myInfo = jsonDecode(response.body);

      if (response.statusCode == 200) {
        await StorageRepository.setString(
          key: "access_token",
          value: myInfo["access_token"],
        );
        await StorageRepository.setString(
          key: "refresh_token",
          value: myInfo["refresh_token"],
        );
      } else {
        error = "Karoche akauntga yti :)";
      }
    } catch (_) {
      error = "Bo'madiz :)";
    }

    return error;
  }

  static Future<NetworkResponse> getUser() async {
    NetworkResponse networkResponse = NetworkResponse();

    String userToken = StorageRepository.getString(key: 'access_token');

    debugPrint("myError.isEmpty ----------------------$userToken-");

    try {
      Uri uri = Uri.parse("https://swag.dennic.uz/v1/user/get");
      http.Response response = await http.get(
        uri,
        headers: {
          "Authorization": userToken,
          "Content-Type": "application/json",
        },
      );
      Map<String, dynamic> myInfo = jsonDecode(response.body);
      debugPrint("AWWWWWWWWWWW ${response.body}");

      if (myInfo["status"] == "Unauthorized") {
        String myError = await _updateToken();

        if (myError.isEmpty) {
          debugPrint("myError.isEmpty -----------------------------------");
          getUser();
        } else {
          networkResponse.errorText = "the_end_token";
        }
      } else if (response.statusCode == 200) {
        networkResponse.data = MyUserModel.fromJson(myInfo);
        debugPrint((networkResponse.data as MyUserModel).toJson().toString());
      } else {
        networkResponse.errorText = myInfo["message"] as String? ?? "";
      }
    } catch (error) {
      networkResponse.errorText = error.toString();
    }
    return networkResponse;
  }

  static Future<NetworkResponse> fetchDoctors() async {
    final response =
        await http.get(Uri.parse('https://swag.dennic.uz/v1/doctor'));

    try {
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        List<DoctorModel> doctors = (data['doctors'] as List)
            .map((doctorJson) => DoctorModel.fromJson(doctorJson))
            .toList();

        return NetworkResponse(data: doctors);
      } else {
        return NetworkResponse(errorText: 'Failed to load doctors');
      }
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }

  static Future<NetworkResponse> fetchSpecializations() async {
    final response =
        await http.get(Uri.parse('https://swag.dennic.uz/v1/specialization'));

    try {
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['specializations'];

        List<SpecializationModel> specializations =
            data.map((json) => SpecializationModel.fromJson(json)).toList();

        return NetworkResponse(data: specializations);
      } else {
        return NetworkResponse(errorText: "Failed to load Specializations");
      }
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }

  static Future<NetworkResponse> fetchBySpecializations(
      String specializationId) async {
    final response = await http.get(Uri.parse(
        "https://swag.dennic.uz/v1/doctor/spec?specialization_id=$specializationId"));

    try {
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['doctors'];

        List<DoctorModel> doctors =
            data.map((json) => DoctorModel.fromJson(json)).toList();
        return NetworkResponse(data: doctors);
      } else {
        return NetworkResponse(errorText: "Failed to load Doctors");
      }
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }

  static Future<NetworkResponse> fetchByDoctorId(String doctorId) async {
    NetworkResponse networkResponse = NetworkResponse();
    final response = await http
        .get(Uri.parse("https://swag.dennic.uz/v1/doctor/get?id=$doctorId"));

    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        networkResponse.data = DoctorModel.fromJson(data);
        debugPrint((networkResponse.data as DoctorModel).toJson().toString());

        return networkResponse;
      } else {
        return NetworkResponse(errorText: "Failed to load Doctor");
      }
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }

  static Future<NetworkResponse> updateUser({
    required UpdateUserModel updateUserModel,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();

    debugPrint("Api Provider update ${updateUserModel.birthDate}");

    try {
      Uri uri = Uri.parse("https://swag.dennic.uz/v1/user/update");

      http.Response response = await http.put(
        uri,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(updateUserModel.toJson()),
      );

      debugPrint('Response status code: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

      if (response.statusCode == 200) {
        debugPrint('Response status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');

        networkResponse.data = "User updated successfully";
      } else {
        final responseData = jsonDecode(response.body);
        networkResponse.errorText = responseData["message"] ?? "Unknown error";
      }
    } catch (error) {
      debugPrint('Error in updateUser: $error');
      return NetworkResponse(errorText: error.toString());
    }

    return networkResponse;
  }

  /////////////////////////////////////////////////

  static Future<NetworkResponse> getDate() async {
    Uri uri = Uri.parse("https://swag.dennic.uz/v1/appointment/dates");

    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        debugPrint("Response body: ${response.body}");

        List<DateModel> dates = (jsonDecode(response.body) as List<dynamic>)
            .map((e) => DateModel.fromJson(e))
            .toList();

        return NetworkResponse(data: dates);
      } else {
        return NetworkResponse(
            errorText:
                "Failed to load dates. Status code: ${response.statusCode}");
      }
    } catch (error) {
      return NetworkResponse(errorText: "An error occurred: $error");
    }
  }

  static Future<NetworkResponse> getDoctorService(String id) async {
    Uri uri =
        Uri.parse("https://swag.dennic.uz/v1/doctor-services?doctor_id=$id");

    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        debugPrint(
            "Doctor service keldi ------------------------------------------------getDoctorService");

        debugPrint("RUNTIME TYPE IS RESPONSE: ${response.body.runtimeType}");

        List<ServiceModel> serviceModels =
            (jsonDecode(response.body)["doctor_services"] as List?)
                    ?.map((e) => ServiceModel.fromJson(e))
                    .toList() ??
                [];

        debugPrint(
            "$serviceModels-------------------------------getDoctorService");

        return NetworkResponse(data: serviceModels);
      } else {
        debugPrint(
            "if ning else qismiga tushdi keldi ------------------------------------------------getDoctorService");
        return NetworkResponse(
            errorText:
                "Failed to load dates. Status code: ${response.statusCode}");
      }
    } catch (error) {
      debugPrint(
          "Catch keldi ------------------------------------------------getDoctorService $error");
      return NetworkResponse(errorText: error.toString());
    }
  }

  static Future<NetworkResponse> bookAppointment(
      String date, String doctorId) async {
    String token = StorageRepository.getString(
      key: "access_token",
    );

    NetworkResponse networkResponse = NetworkResponse();

    try {
      final response = await http.post(
        Uri.parse("https://swag.dennic.uz/v1/appointment/booking"),
        headers: {
          'accept': 'application/json',
          'Authorization': token,
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'date': date,
          'doctor_id': doctorId,
        }),
      );

      if (response.statusCode == 200) {
        debugPrint(
            "Table keldi ------------------------------------------------bookAppointment");

        debugPrint(jsonDecode(response.body).toString());
        List<TableModel> appointments = (jsonDecode(response.body) as List?)
                ?.map((e) => TableModel.fromJson(e))
                .toList() ??
            [];

        debugPrint(
            "$appointments------------------------------bookAppointment");

        return NetworkResponse(data: appointments);
      } else {
        debugPrint(
            "Table kelmadi ------------------------------------------------bookAppointment");
        return NetworkResponse(
          errorText: networkResponse.data['message'],
        );
      }
    } catch (error) {
      debugPrint(
          "Catch keldi ------------------------------------------------bookAppointment");
      return NetworkResponse(errorText: error.toString());
    }
  }

  static Future<NetworkResponse> createPatient(
      PatientModel patientModel) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      Uri uri = Uri.parse("https://swag.dennic.uz/v1/patient/create");

      http.Response response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(patientModel.toJson()),
      );

      if (response.statusCode == 200) {
        debugPrint("Patient yaratildi: ${jsonDecode(response.body)["id"]}");
        networkResponse.data = jsonDecode(response.body)["id"];
      } else {
        debugPrint(
            "Status Code: ${response.statusCode} Body: ${response.body}-----------------------------------createPatient");

        final responseJson = jsonDecode(response.body);
        networkResponse.errorText = responseJson["messages"] ?? "Unknown error";
      }
    } catch (error) {
      debugPrint(
          "Catch keldi----------------------------createPatient ${error.toString()}");
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

  static Future<NetworkResponse> createAppointment(
      AppointmentModel appointmentModel) async {
    String token = StorageRepository.getString(
      key: "access_token",
    );
    debugPrint(token);
    NetworkResponse networkResponse = NetworkResponse();

    try {
      final response = await http.post(
        Uri.parse("https://swag.dennic.uz/v1/appointment/create"),
        headers: {
          'accept': 'application/json',
          'Authorization': token,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(appointmentModel.toJson()),
      );

      if (response.statusCode == 200) {
        debugPrint(
            "If ga tushdi ------------------------------------------------createAppointment");
        // debugPrint("Data: ${response.body}");

        networkResponse.data = "";
      } else {
        jsonDecode(response.body);
        networkResponse.errorText = response.body;
        debugPrint(
            "Else ga tushdi -------------${response.statusCode}------${networkResponse.errorText}----------------------------createAppointment");
        return NetworkResponse(
          errorText: networkResponse.errorText,
        );
      }
    } catch (error) {
      debugPrint(
          "Catch keldi -------------${error.toString()}-----------------------------------createAppointment");
      return NetworkResponse(errorText: error.toString());
    }
    return networkResponse;
  }

  static const String _baseUrl = 'https://swag.dennic.uz/v1';

  static Future<NetworkResponse> sendSupportMessage({
    required SupportModel supportModel,
  }) async {
    final url = Uri.parse('$_baseUrl/support');
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final body = jsonEncode(supportModel.toJson());

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        debugPrint('Support message sent successfully.');
        return NetworkResponse(data: 'Support message sent successfully.');
      } else {
        // Handle error response
        debugPrint(
            'Failed to send support message. Status code: ${response.statusCode}');
        return NetworkResponse(
          data:
              'Failed to send support message. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      debugPrint('Error sending support message: $e');
      return NetworkResponse(
        errorText: e.toString(),
      );
    }
  }

  static Future<NetworkResponse> getAppointmentHistory() async {
    String userToken = StorageRepository.getString(key: 'access_token');

    debugPrint("myError.isEmpty ----------------------$userToken-");

    try {
      Uri uri = Uri.parse("https://swag.dennic.uz/v1/appointment");
      http.Response response = await http.get(
        uri,
        headers: {
          "Authorization": userToken,
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        debugPrint(
            "AWWWWWWWWWWW ${response.body}--------------getAppointmentHistory");

        List<AppointmentHistoryModel> histories =
            (jsonDecode(response.body)["appointments"] as List?)
                    ?.map((e) => AppointmentHistoryModel.fromJson(e))
                    .toList() ??
                [];
        debugPrint(
            "Length Lits _______________________________${histories.length}");
        return NetworkResponse(data: histories);
      } else {
        debugPrint(
            "Else qismiga tushdi------------------------${response.statusCode}---getAppointmentHistory");

        return NetworkResponse(
            errorText: "Else qismiga tushdi: ${response.statusCode}");
      }
    } catch (error) {
      debugPrint(
          "Catch keldi----------------------------getAppointmentHistory");
      return NetworkResponse(errorText: error.toString());
    }
  }
}
