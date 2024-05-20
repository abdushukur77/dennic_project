import 'package:dennic_project/data/model/user_info/my_user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/networ_respons_model/network_response.dart';
import '../../data/repositories/doctor_repository.dart';
import '../auth/auth_state.dart';
import 'doctor_event.dart';
import 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final DoctorRepository doctorRepository;

  DoctorBloc({required this.doctorRepository})
      : super(DoctorState(myUserModel: MyUserModel.initial())) {
    on<FetchDoctors>(_onFetchDoctors);
    on<FetchDoctorsBySpecialization>(_onFetchDoctorsBySpecialization);
    on<GetUser>(_onGetUser);
  }

  Future<void> _onFetchDoctors(
    FetchDoctors event,
    Emitter<DoctorState> emit,
  ) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse = await doctorRepository.fetchDoctor();

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(
          formStatus: FormStatus.success,
          doctors: networkResponse.data,
          searchDoctors: networkResponse.data));
    } else {
      emit(state.copyWith(
          formStatus: FormStatus.error,
          errorMessage: networkResponse.errorText));
    }
  }

  Future<void> _onGetUser(GetUser event, Emitter<DoctorState> emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse = await doctorRepository.getUser();

    if (networkResponse.errorText.isEmpty) {

      debugPrint(" My User Model    ${networkResponse.data}");
      emit(state.copyWith(
          formStatus: FormStatus.success, myUserModel: networkResponse.data));
    }
  }

  Future<void> _onFetchDoctorsBySpecialization(
    FetchDoctorsBySpecialization event,
    Emitter<DoctorState> emit,
  ) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse = await doctorRepository
        .fetchDoctorsBySpecialization(event.specializationId);

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(
          formStatus: FormStatus.success, searchDoctors: networkResponse.data));
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorMessage: networkResponse.errorText,
        ),
      );
    }
  }
}
