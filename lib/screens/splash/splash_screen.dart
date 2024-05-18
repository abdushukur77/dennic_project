import 'package:dennic_project/screens/register_and_login/onboarding/onboarding.dart';
import 'package:dennic_project/screens/tab_box/home/home_screen.dart';
import 'package:dennic_project/utils/images/app_images.dart';
import 'package:flutter/material.dart';

import '../../data/local/storage_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    bool isNewUser = StorageRepository.getBool(key: "is_new_user");
    debugPrint("WWWWWWWWWWWWWWWWWWWW ${isNewUser.toString()}");
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (isNewUser) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OnboardingScreen(),
            ),
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Image.asset(
          AppImages.splash,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
