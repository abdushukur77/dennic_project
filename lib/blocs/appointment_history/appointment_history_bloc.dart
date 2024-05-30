import 'package:bloc/bloc.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:dennic_project/data/model/appointment_history/appointment_history_model.dart';
import 'package:dennic_project/data/model/networ_respons_model/network_response.dart';
import 'package:dennic_project/data/network/api_provider.dart';
import 'package:equatable/equatable.dart';

part 'appointment_history_event.dart';

part 'appointment_history_state.dart';

class AppointmentHistoryBloc
    extends Bloc<AppointmentHistoryEvent, AppointmentHistoryState> {
  AppointmentHistoryBloc()
      : super(
          AppointmentHistoryState.initial(),
        ) {
    on<GetAppointmentHistoryEvent>(_getHistory);
  }

  _getHistory(GetAppointmentHistoryEvent event, emit) async {
    emit(
      state.copyWith(
        formStatus: FormStatus.loading,
      ),
    );

    NetworkResponse networkResponse = await ApiProvider.getAppointmentHistory();

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          appointmentHistories: networkResponse.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }
}
