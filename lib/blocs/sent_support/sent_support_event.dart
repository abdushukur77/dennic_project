part of 'sent_support_bloc.dart';

sealed class SentSupportEvent extends Equatable {
  const SentSupportEvent();
}

class SendSupportEvent extends SentSupportEvent {
  final SupportModel supportModel;

  const SendSupportEvent(
    this.supportModel,
  );

  @override
  List<Object?> get props => [
        supportModel,
      ];
}

class ChangeSentSupportInitialEvent extends SentSupportEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
