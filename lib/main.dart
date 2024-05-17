import 'package:dennic_project/app/app.dart';
import 'package:dennic_project/data/local/storage_repository.dart';
import 'package:flutter/material.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  StorageRepository.instance;

  runApp(const App());
}
