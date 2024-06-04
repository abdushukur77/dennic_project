import 'package:dennic_project/app/app.dart';
import 'package:dennic_project/data/local/storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).whenComplete(() {
    runApp(const App());
  });
}
