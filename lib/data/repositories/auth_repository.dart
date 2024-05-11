import 'package:dennic_project/data/model/user_model/user_model.dart';
import 'package:dennic_project/data/model/verify_model/verify_model.dart';
import 'package:dennic_project/data/network/api_provider.dart';

import '../network/network_response.dart';

class AuthRepository {
  Future<NetworkResponse> registerUser({required UserModel userModel}) async =>
      await ApiProvider.registerUser(userModel);

  Future<NetworkResponse> registerUserVerify(
          {required VerifyModel verifyModel}) async =>
      await ApiProvider.verifyUser(verifyModel);
}
