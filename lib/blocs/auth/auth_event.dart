import 'package:dennic_project/data/user_model.dart';
import 'package:equatable/equatable.dart';

class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckAuthenticationEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class LoginUserEvent extends AuthEvent {
  LoginUserEvent({required this.username, required this.password});

  final String username;
  final String password;

  @override
  List<Object?> get props => [username, password];
}

class RegisterUserEvent extends AuthEvent {
  RegisterUserEvent({required this.userModel});

  final UserModel userModel;

  @override
  List<Object?> get props => [userModel];
}

class LogOutUserEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}
