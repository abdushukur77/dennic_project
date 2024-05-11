import 'dart:convert';

import 'package:dennic_project/data/model/login_model/login_model.dart';
import 'package:dennic_project/data/model/user_model/user_model.dart';
import 'package:dennic_project/data/model/verify_model/verify_model.dart';
import 'package:dennic_project/data/network/network_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<NetworkResponse> registerUser(UserModel userModel) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      Uri uri = Uri.parse("http://18.133.228.143:9050/v1/customer/register");

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
      Uri uri = Uri.parse("http://18.133.228.143:9050/v1/customer/verify");

      http.Response response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(verifyModel.toJson()),
      );
      if (response.statusCode == 200) {
        // debugPrint("${response.body} --------------");

        networkResponse.data = "Logged";
      } else if (response.statusCode == 400) {
        // debugPrint("${response.body} --------------400");

        networkResponse.errorText = "this_number_already_registered";
      }
      // debugPrint("${response.body} --------------???");
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }

    return networkResponse;
  }
}
