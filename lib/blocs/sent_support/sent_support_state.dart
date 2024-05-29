part of 'sent_support_bloc.dart';

class SentSupportState extends Equatable {
  final String errorText;
  final FormStatus formStatus;
  final SupportModel supportModel;

  const SentSupportState({
    required this.formStatus,
    required this.errorText,
    required this.supportModel,
  });

  static SentSupportState initial() => SentSupportState(
        formStatus: FormStatus.pure,
        errorText: '',
        supportModel: SupportModel.initial(),
      );

  SentSupportState copyWith({
    String? errorText,
    FormStatus? formStatus,
    SupportModel? supportModel,
  }) =>
      SentSupportState(
        formStatus: formStatus ?? this.formStatus,
        errorText: errorText ?? this.errorText,
        supportModel: supportModel ?? this.supportModel,
      );

  @override
  List<Object?> get props => [
        formStatus,
        errorText,
        supportModel,
      ];
}
