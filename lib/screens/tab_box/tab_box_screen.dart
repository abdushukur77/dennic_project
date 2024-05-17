import 'package:dennic_project/blocs/auth/auth_bloc.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../splash/splash_screen.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  @override
  void initState() {
    _userListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  _userListener() {
    BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        if (state.formStatus == FormStatus.error) {
          if (state.statusMessage == "the_end_token") {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return const SplashScreen();
              },
            ), (route) => false);
          }
        }
      },
      child: const SizedBox(),
    );
  }
}
