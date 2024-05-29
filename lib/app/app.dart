import 'package:dennic_project/blocs/auth/auth_bloc.dart';
import 'package:dennic_project/blocs/doctor/doctor_bloc.dart';
import 'package:dennic_project/blocs/doctor/doctor_event.dart';
import 'package:dennic_project/blocs/specialization/specialization_event.dart';
import 'package:dennic_project/data/repositories/auth_repository.dart';
import 'package:dennic_project/data/repositories/doctor_repository.dart';
import 'package:dennic_project/screens/splash/splash_screen.dart';
import 'package:dennic_project/screens/tab_box/appointment/patient_screen/create_patient_screen.dart';
import 'package:dennic_project/screens/tab_box/tab_box_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/specialization/specialization_bloc.dart';
import '../data/repositories/specialization_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthRepository()),
        RepositoryProvider(create: (_) => DoctorRepository()),
        RepositoryProvider(create: (_) => SpecializationRepository())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthBloc(appRepository: context.read<AuthRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                DoctorBloc(doctorRepository: context.read<DoctorRepository>())
                  ..add(FetchDoctors()),
          ),
          BlocProvider(
            create: (context) => SpecializationBloc(
                specializationRepository:
                    context.read<SpecializationRepository>())
              ..add(FetchSpecializations()),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(428, 926),
          builder: (context, child) {
            ScreenUtil.init(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.transparent)),
                useMaterial3: true,
              ),
              home: child,
            );
          },

          child: const SplashScreen(),
        ),
      ),
    );
  }
}
