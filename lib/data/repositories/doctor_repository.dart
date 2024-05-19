import 'package:dennic_project/data/model/networ_respons_model/network_response.dart';
import '../network/api_provider.dart';
class DoctorRepository {
  Future<NetworkResponse> fetchDoctor() async =>
      await ApiProvider.fetchDoctors();

  Future<NetworkResponse> fetchDoctorsBySpecialization(String specializationId) async =>
     await ApiProvider.fetchBySpecializations(specializationId);


}
