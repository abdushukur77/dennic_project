import 'dart:async';

import 'package:dennic_project/data/model/networ_respons_model/network_response.dart';
import 'package:dennic_project/data/model/patient/patient_modedl.dart';
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

  Future<NetworkResponse> getTable(
          {required String doctorId, required String date}) async =>
      await ApiProvider.bookAppointment(date, doctorId);

  Future<NetworkResponse> fetchDoctorService({required String id}) async =>
      await ApiProvider.getDoctorService(id);

  Future<NetworkResponse> postPatient(
          {required PatientModel patientModel}) async =>
      await ApiProvider.createPatient(patientModel);
}
