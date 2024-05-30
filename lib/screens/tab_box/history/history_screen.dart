import 'package:dennic_project/blocs/appointment_history/appointment_history_bloc.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
      ),
      body: BlocBuilder<AppointmentHistoryBloc, AppointmentHistoryState>(
          builder: (context, state) {
            debugPrint("++++++++++++++++++++++++++${state.formStatus}++++++++++++");
        if (state.formStatus == FormStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.formStatus == FormStatus.error) {
          return Center(
            child: Text(state.errorText),
          );
        }
        if (state.formStatus == FormStatus.success) {
          return ListView.builder(
              itemCount: state.appointmentHistories.length,
              itemBuilder: (context, index) {
                return Text(
                  state.appointmentHistories[index].doctorId,
                );
              });
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
