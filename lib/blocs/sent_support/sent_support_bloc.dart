import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:dennic_project/data/model/networ_respons_model/network_response.dart';
import 'package:dennic_project/data/model/support/support_model.dart';
import 'package:dennic_project/data/network/api_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sent_support_event.dart';

part 'sent_support_state.dart';

class SentSupportBloc extends Bloc<SentSupportEvent, SentSupportState> {
  SentSupportBloc()
      : super(
          SentSupportState.initial(),
        ) {
    on<SendSupportEvent>(_sendSupport);
    on<ChangeSentSupportInitialEvent>(_changeInitial);
  }

  _changeInitial(ChangeSentSupportInitialEvent event, emit) {
    emit(
      state.copyWith(
        formStatus: FormStatus.pure,
        errorText: '',
        supportModel: SupportModel.initial(),
      ),
    );
  }

  _sendSupport(SendSupportEvent event, emit) async {
    emit(
      state.copyWith(
        formStatus: FormStatus.loading,
      ),
    );

    NetworkResponse networkResponse = await ApiProvider.sendSupportMessage(
      supportModel: event.supportModel,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }
}
