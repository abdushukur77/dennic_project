import 'package:dennic_project/blocs/appoinment/event.dart';
import 'package:dennic_project/blocs/appoinment/state.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:dennic_project/data/model/appointment/appointment_model.dart';
import 'package:dennic_project/data/model/networ_respons_model/network_response.dart';
import 'package:dennic_project/data/network/api_provider.dart';
import 'package:dennic_project/data/repositories/doctor_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final DoctorRepository doctorRepository;

  AppointmentBloc({required this.doctorRepository})
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
    on<CreateBookAppointment>(_onPostAppointment);
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

  Future<void> _onPostAppointment(CreateBookAppointment event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse =
        await doctorRepository.postAppointment(event.appointmentModel);

    if (networkResponse.errorText.isEmpty) {
      debugPrint("On post appointment blocda DONEEEEEEEEEEEEEE");
      emit(
        state.copyWith(
            formStatus: FormStatus.success, appointment: networkResponse.data),
      );
    } else {
      debugPrint("On post appointment blocda else ning ichiga tushdi");
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }
}
