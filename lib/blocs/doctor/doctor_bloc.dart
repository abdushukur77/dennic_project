import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/networ_respons_model/network_response.dart';
import '../../data/repositories/doctor_repository.dart';
import '../auth/auth_state.dart';
import 'doctor_event.dart';
import 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final DoctorRepository doctorRepository;

  DoctorBloc({required this.doctorRepository}) : super(DoctorState()) {
    on<FetchDoctors>(_onFetchDoctors);
  }


  Future<void> _onFetchDoctors(
      FetchDoctors event,
      Emitter<DoctorState> emit,
      ) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse= await doctorRepository.fetchDoctor();

   if (networkResponse.errorText.isEmpty){
     emit(state.copyWith(formStatus: FormStatus.success,doctors: networkResponse.data));

   }else {
     emit(state.copyWith(formStatus: FormStatus.error,errorMessage: networkResponse.errorText));
   }
  }
}
