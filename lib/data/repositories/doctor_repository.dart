import 'package:dennic_project/data/model/networ_respons_model/network_response.dart';
import '../network/api_provider.dart';

class DoctorRepository {
  Future<NetworkResponse> fetchDoctor() async =>
      await ApiProvider.fetchDoctors();

  Future<NetworkResponse> fetchDoctorById(String doctorId) async =>
      await ApiProvider.fetchByDoctorId(doctorId);

  Future<NetworkResponse> fetchDoctorsBySpecialization(
          String specializationId) async =>
      await ApiProvider.fetchBySpecializations(specializationId);

  Future<NetworkResponse> getUser() async => await ApiProvider.getUser();

  Future<NetworkResponse> getDate() async => await ApiProvider.getDate();
}
