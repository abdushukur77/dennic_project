import 'package:dennic_project/data/user_model.dart';

class AuthState {
  const AuthState({
    required this.errorText,
    required this.formStatus,
    required this.userModel,
    required this.statusMessage,
  });

  final String errorText;
  final String statusMessage;
  final UserModel userModel;
  final FormStatus formStatus;

  AuthState copyWith({
    String? errorText,
    FormStatus? formStatus,
    UserModel? userModel,
    String? statusMessage,
  }) {
    return AuthState(
      errorText: errorText ?? this.errorText,
      statusMessage: statusMessage ?? this.statusMessage,
      userModel: userModel ?? this.userModel,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

enum FormStatus {
  loading,
  success,
  pure,
  error,
  unauthenticated,
  authenticated,
}
