import 'dart:convert';
import 'package:dennic_project/data/model/login_model/login_model.dart';
import 'package:dennic_project/data/model/user_model/user_model.dart';
import 'package:dennic_project/data/model/verify_model/verify_model.dart';
import 'package:dennic_project/data/model/networ_respons_model/network_response.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<NetworkResponse> registerUser(UserModel userModel) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      Uri uri = Uri.parse("http://dennic.uz:9050/v1/customer/register");

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
      Uri uri = Uri.parse("http://dennic.uz:9050/v1/customer/verify");

      http.Response response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(verifyModel.toJson()),
      );
      if (response.statusCode == 200) {

        networkResponse.data = "Logged";
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
      Uri uri = Uri.parse("http://dennic.uz:9050/v1/customer/login");

      http.Response response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(loginModel.toJson()),
      );
      if (response.statusCode == 200) {
        networkResponse.data = "login";
      } else if (response.statusCode == 500) {
        networkResponse.errorText = "no_user";
      }
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }

    return networkResponse;
  }
}
