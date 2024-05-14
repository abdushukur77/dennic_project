import 'package:dennic_project/app/app.dart';
import 'package:dennic_project/data/network/api_provider.dart';
import 'package:flutter/material.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                ApiProvider.forgetPassword(phoneNumber: "+998913597376");
              },
              child: Text("forget password"),
            ),
            TextButton(
              onPressed: () {
                ApiProvider.verifyOtpCode(
                    phoneNumber: "+998913597376", code: 7777);
              },
              child: Text("verify_otp_code"),
            ),
          ],
        ),
      ),
    );
  }
}
