import 'package:dennic_project/data/model/login_model/login_model.dart';
import 'package:dennic_project/data/model/user_model/user_model.dart';
import 'package:dennic_project/data/model/verify_model/verify_model.dart';
import 'package:dennic_project/data/network/api_provider.dart';

import '../model/networ_respons_model/network_response.dart';

class AuthRepository {
  Future<NetworkResponse> registerUser({required UserModel userModel}) async =>
      await ApiProvider.registerUser(userModel);

  Future<NetworkResponse> registerUserVerify(
      {required VerifyModel verifyModel}) async =>
      await ApiProvider.verifyUser(verifyModel);

  Future<NetworkResponse> loginUser({required LoginModel loginModel}) async =>
      await ApiProvider.loginUser(loginModel);

  Future<NetworkResponse> logoutUser({required String token}) async =>
      await ApiProvider.logoutUser(token: token);

  Future<NetworkResponse> forgetPassword({required String phoneNumber}) async =>
      await ApiProvider.forgetPassword(phoneNumber: phoneNumber);

  Future<NetworkResponse> verifyOtpCodeUser(
      {required String phoneNumber, required int password}) async =>
      await ApiProvider.verifyOtpCode(phoneNumber: phoneNumber, code: password);

  Future<NetworkResponse> updatePassword(
      {required String newPassword, required String token}) async =>
      await ApiProvider.updateUserPassword(
          newPassword: newPassword, token: token);
}