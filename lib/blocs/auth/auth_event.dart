import 'package:dennic_project/data/model/login_model/login_model.dart';
import 'package:dennic_project/data/model/user_model/user_model.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/verify_model/verify_model.dart';

class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckAuthenticationEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class LoginUserEvent extends AuthEvent {
  LoginUserEvent({required this.loginModel});

  final LoginModel loginModel;

  @override
  List<Object?> get props => [loginModel];
}

class RegisterUserEvent extends AuthEvent {
  RegisterUserEvent({required this.userModel});

  final UserModel userModel;

  @override
  List<Object?> get props => [userModel];
}

class AuthRequestPassword extends AuthEvent {
  AuthRequestPassword({required this.verifyModel});

  final VerifyModel verifyModel;

  @override
  List<Object?> get props => [verifyModel];
}

class LogOutUserEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}
