import 'package:dennic_project/screens/register_and_login/onboarding/onboarding.dart';
import 'package:dennic_project/screens/tab_box/home/home_screen.dart';
import 'package:dennic_project/screens/tab_box/tab_box_screen.dart';
import 'package:dennic_project/utils/images/app_images.dart';
import 'package:flutter/material.dart';

import '../../data/local/storage_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Start the fade-in animation after a small delay
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Check if the user is new and navigate accordingly after the splash screen
    bool isNewUser = StorageRepository.getBool(key: "is_new_user");
    debugPrint("WWWWWWWWWWWWWWWWWWWW ${isNewUser.toString()}");
    Future.delayed(
      const Duration(seconds: 4),
          () {
        if (isNewUser) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const TabBoxScreen(),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 2),
          child: Image.asset(
            AppImages.splash,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
