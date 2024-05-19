import 'package:dennic_project/data/model/networ_respons_model/network_response.dart';
import 'package:dennic_project/data/network/api_provider.dart';

class SpecializationRepository {
  Future<NetworkResponse> fetchSpecializations() async {
    return await ApiProvider.fetchSpecializations();
  }
}
