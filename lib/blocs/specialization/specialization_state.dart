import 'package:dennic_project/blocs/auth/auth_state.dart';

import '../../data/model/specialization_model/specialization_model.dart';

class SpecializationState {
  final FormStatus formStatus;
  final List<SpecializationModel> specializations;
  final String errorMessage;

  SpecializationState({
    this.formStatus = FormStatus.pure,
    this.specializations = const [],
    this.errorMessage = '',
  });

  SpecializationState copyWith({
    FormStatus? formStatus,
    List<SpecializationModel>? specializations,
    String? errorMessage,
  }) {
    return SpecializationState(
        specializations: specializations ?? this.specializations,
        errorMessage: errorMessage ?? this.errorMessage,
        formStatus: formStatus ?? this.formStatus);
  }
}
