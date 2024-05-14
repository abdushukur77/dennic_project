import 'package:dennic_project/blocs/auth/auth_event.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:dennic_project/data/repositories/auth_repository.dart';
import 'package:dennic_project/data/model/user_model/user_model.dart';
import 'package:dennic_project/data/model/networ_respons_model/network_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthRepository appRepository})
      : _appRepository = appRepository, super(
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

  final AuthRepository _appRepository;

  Future<void> _loginUser(LoginUserEvent event, emit) async {
    NetworkResponse networkResponse = NetworkResponse();

    networkResponse =
        await _appRepository.loginUser(loginModel: event.loginModel);

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formStatus: FormStatus.authenticated,
        ),
      );
    } else {
      emit(
        state.copyWith(
          errorText: networkResponse.errorText,
          formStatus: FormStatus.error,
        ),
      );
    }
  }

  _check(AuthRequestPassword even, emit) async {
    NetworkResponse networkResponse =
        await _appRepository.registerUserVerify(verifyModel: even.verifyModel);

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
        await _appRepository.registerUser(userModel: event.userModel);

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formStatus: FormStatus.authenticated,
          statusMessage: "registered",
        ),
      );
    } else {
      debugPrint("Error MAkkamik :( ${networkResponse.errorText}");

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
