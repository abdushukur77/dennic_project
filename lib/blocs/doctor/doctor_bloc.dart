import 'package:dennic_project/data/model/doctor_model/doctor_model.dart';
import 'package:dennic_project/data/model/patient/patient_modedl.dart';
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
      : super(
          DoctorState(
            myUserModel: MyUserModel.initial(),
            doctorModel: DoctorModel.initial(),
            patientModel: PatientModel.initial(),
          ),
        ) {
    on<FetchDoctors>(_onFetchDoctors);
    on<FetchDoctorsBySpecialization>(_onFetchDoctorsBySpecialization);
    on<FetchDoctorById>(_onFetchDoctorById);
    on<GetUser>(_onGetUser);
    on<GetDate>(_onFetchDateDoctor);
    on<GetTable>(_onFetchTableDoctor);
    on<GetDoctorService>(_onFetchDoctorService);
    on<PostPatient>(_onPostPatient);
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
      debugPrint(" My User Model   ${networkResponse.data}");
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

  Future<void> _onFetchDateDoctor(GetDate event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse = await doctorRepository.getDate();

    if (networkResponse.errorText.isEmpty) {
      print("Errorga tushdi---------------------------");
      emit(
        state.copyWith(
            formStatus: FormStatus.success, dateModels: networkResponse.data),
      );
    } else {
      print(
          "Succesga tushdi ${networkResponse.data}---------------------------");
      emit(state.copyWith(
        formStatus: FormStatus.error,
        errorMessage: networkResponse.errorText,
      ));
    }
  }

  Future<void> _onFetchTableDoctor(GetTable event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse = await doctorRepository.getTable(
        doctorId: event.doctorId, date: event.date);

    if (networkResponse.errorText.isEmpty) {
      debugPrint(
          "Succesga tushdi ${networkResponse.data}---------------------------");
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          tableModels: networkResponse.data,
        ),
      );
    } else {
      debugPrint(
          "Errorga tushdi---------------------------_onFetchTableDoctor");
      emit(state.copyWith(
        formStatus: FormStatus.error,
        errorMessage: networkResponse.errorText,
      ));
    }
  }

  Future<void> _onFetchDoctorService(GetDoctorService event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse =
        await doctorRepository.fetchDoctorService(id: event.id);

    if (networkResponse.errorText.isEmpty) {
      debugPrint(
          "Succesga tushdi ${networkResponse.data}---------------------------");
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          serviceModels: networkResponse.data,
        ),
      );
    } else {
      debugPrint(
          "Errorga tushdi---------------------------_onFetchDoctorService");
      emit(state.copyWith(
        formStatus: FormStatus.error,
        errorMessage: networkResponse.errorText,
      ));
    }
  }

  Future<void> _onFetchDoctorById(
    FetchDoctorById event,
    Emitter<DoctorState> emit,
  ) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse =
        await doctorRepository.fetchDoctorById(event.doctorId);

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(
          formStatus: FormStatus.success, doctorModel: networkResponse.data));
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorMessage: networkResponse.errorText,
        ),
      );
    }
  }

  Future<void> _onPostPatient(PostPatient event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse =
        await doctorRepository.postPatient(patientModel: event.patientModel);

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          patientModel: networkResponse.data,
        ),
      );

      debugPrint("CREATED PATIENT");
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
