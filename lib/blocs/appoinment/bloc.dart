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
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse =
        await ApiProvider.createPatient(event.patientModel);

    if (networkResponse.errorText.isEmpty) {
      debugPrint("Qonday:  ${networkResponse.data}");
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          appointment: state.appointment
              .copyWith(patientId: networkResponse.data as String? ?? ""),
        ),
      );

      add(CreateBookAppointment());
    } else {
      debugPrint("Error --------------_addKasal");
      emit(
        state.copyWith(
          statusMessage: "",
          formStatus: FormStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }

  Future<void> _onPostAppointment(CreateBookAppointment event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse = await doctorRepository.postAppointment(
      state.appointment,
    );
    if (networkResponse.errorText.isEmpty) {
      debugPrint("On post appointment blocda DONEEEEEEEEEEEEEE");
      emit(
        state.copyWith(
          statusMessage: "ok",
          formStatus: FormStatus.success,
        ),
      );
    } else {
      debugPrint("On post appointment blocda else ning ichiga tushdi");
      emit(
        state.copyWith(
          statusMessage: "",
          formStatus: FormStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }
}
