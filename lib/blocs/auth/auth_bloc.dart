import 'package:dennic_project/blocs/auth/auth_event.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:dennic_project/data/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(AuthState(
          errorText: "",
          formStatus: FormStatus.pure,
          userModel: UserModel.initial(),
          statusMessage: "",
        )) {
    on<LoginUserEvent>(_loginUser);
    on<RegisterUserEvent>(_registerUser);
    on<CheckAuthenticationEvent>(_checkAuthenticationUser);
    on<LoginUserEvent>(_logOutUser);
  }

  _loginUser(LoginUserEvent event, emit) async {}

  _registerUser(RegisterUserEvent event, emit) async {}

  _checkAuthenticationUser(CheckAuthenticationEvent event, emit) async {}

  _logOutUser(LoginUserEvent event, emit) async {}
}
