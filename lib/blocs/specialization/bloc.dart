import 'package:dennic_project/data/model/networ_respons_model/network_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/specialization_repository.dart';
import '../auth/auth_state.dart';
import 'event.dart';
import 'specialization_state.dart';

class SpecializationBloc extends Bloc<SpecializationEvent, SpecializationState> {
  final SpecializationRepository specializationRepository;

  SpecializationBloc({required this.specializationRepository})
      : super(SpecializationState()) {
    on<FetchSpecializations>(_onFetchSpecializations);
  }

  Future<void> _onFetchSpecializations(
      FetchSpecializations event,
      Emitter<SpecializationState> emit,
      ) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse= await specializationRepository.fetchSpecializations();

    if (networkResponse.errorText.isEmpty){
      emit(state.copyWith(
        formStatus: FormStatus.success,
        specializations: networkResponse.data
      ));
    }else{

      emit(state.copyWith(
        formStatus: FormStatus.error,
        errorMessage: networkResponse.errorText
      ));
    }

  }
}
