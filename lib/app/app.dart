import 'package:dennic_project/blocs/auth/auth_bloc.dart';
import 'package:dennic_project/data/repositories/auth_repository.dart';
import 'package:dennic_project/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/tab_box/home/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthBloc(appRepository: context.read<AuthRepository>()),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(428, 926),
          builder: (context, child) {
            ScreenUtil.init(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: false,
              ),
              home: child,
            );
          },
          child: const TopDoctorScreen(),
        ),
      ),
    );
  }
}
