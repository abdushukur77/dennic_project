import 'package:dennic_project/app/app.dart';
import 'package:dennic_project/data/local/storage_repository.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   StorageRepository.init();

  runApp(const App());
}
