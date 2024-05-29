import 'package:dennic_project/blocs/appoinment/event.dart';
import 'package:dennic_project/blocs/appoinment/state.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:dennic_project/data/model/appointment/appointment_model.dart';
import 'package:dennic_project/data/model/networ_respons_model/network_response.dart';
import 'package:dennic_project/data/network/api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentBloc()
      : super(
          AppointmentState(
            appointment: AppointmentModel.initial(),
            potentId: '',
            formStatus: FormStatus.pure,
            errorText: '',
            statusMessage: '',
          ),
        ) {
    on<UpdateAppointmentDate>((event, emit) {
      emit(
        state.copyWith(
          statusMessage: "",
          appointment: state.appointment.copyWith(
            appointmentDate: event.appointmentDate,
          ),
        ),
      );
    });

    on<UpdateAppointmentTime>((event, emit) {
      emit(state.copyWith(
          statusMessage: "",
          appointment: state.appointment.copyWith(
            appointmentTime: event.appointmentTime,
          )));
    });

    on<UpdateDoctorId>((event, emit) {
      emit(state.copyWith(
          statusMessage: "",
          appointment: state.appointment.copyWith(
            doctorId: event.doctorId,
          )));
    });

    on<UpdateDoctorServiceId>((event, emit) {
      emit(state.copyWith(
          statusMessage: "",
          appointment: state.appointment.copyWith(
            doctorServiceId: event.doctorServiceId,
          )));
    });

    on<UpdatePatientId>((event, emit) {
      emit(
        state.copyWith(
          statusMessage: "",
          appointment: state.appointment.copyWith(
            patientId: event.patientId,
          ),
        ),
      );
    });

    on<Addkasal>(_addKasal);
  }

  _addKasal(Addkasal event, emit) async {
    emit(state.copyWith(
      formStatus: FormStatus.loading,
      statusMessage: "",
    ));

    NetworkResponse networkResponse =
        await ApiProvider.createPatient(event.patientModel);

    if (networkResponse.errorText.isEmpty) {
      debugPrint("Qonday:   ${networkResponse.data}");
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          potentId: networkResponse.data as String,
          statusMessage: "ok",
        ),
      );

      debugPrint(state.potentId);
    } else {
      debugPrint("Error -----------");
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorText: networkResponse.errorText,
          statusMessage: "",
        ),
      );
    }
  }
}
