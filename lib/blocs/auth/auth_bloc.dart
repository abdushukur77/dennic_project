import 'package:dennic_project/blocs/auth/auth_event.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:dennic_project/data/repositories/auth_repository.dart';
import 'package:dennic_project/data/model/user_model/user_model.dart';
import 'package:dennic_project/data/network/network_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.appRepository})
      : super(
    AuthState(
      errorText: "",
      formStatus: FormStatus.pure,
      userModel: UserModel.initial(),
      statusMessage: "",
    ),
  ) {
    on<LoginUserEvent>(_loginUser);
    on<RegisterUserEvent>(_registerUser);
    on<CheckAuthenticationEvent>(_checkAuthenticationUser);
    on<LogOutUserEvent>(_logOutUser);
    on<AuthRequestPassword>(_check);
  }

  final AuthRepository appRepository;

  _loginUser(LoginUserEvent event, emit) async {}

  _check(AuthRequestPassword even, emit) async {
    NetworkResponse networkResponse = await appRepository.registerUserVerify(
        verifyModel: even.verifyModel);


    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          statusMessage: "query_ok",
        ),
      );
    } else {
      debugPrint("Error :(");

      if (networkResponse.errorText == "this_number_already_registered") {
        emit(state.copyWith(statusMessage: "this_number_already_registered"));
      } else {
        emit(state.copyWith(errorText: "Register else error"));
      }
    }

  }

  _registerUser(RegisterUserEvent event, emit) async {
    debugPrint("Qonday");

    NetworkResponse networkResponse =
    await appRepository.registerUser(userModel: event.userModel);

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formStatus: FormStatus.authenticated,
          statusMessage: "registered",
        ),
      );
    } else {
      debugPrint("Error :(");

      if (networkResponse.errorText == "this_number_already_registered") {
        emit(state.copyWith(statusMessage: "this_number_already_registered"));
      } else {
        emit(state.copyWith(errorText: "Register else error"));
      }
    }
  }

  _checkAuthenticationUser(CheckAuthenticationEvent event, emit) async {}

  _logOutUser(LogOutUserEvent event, emit) async {}
}
