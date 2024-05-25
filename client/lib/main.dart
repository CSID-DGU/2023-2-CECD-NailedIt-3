import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:nailed_it/main_app.dart';

void main() async {
  // WidgetsBinding
  WidgetsFlutterBinding.ensureInitialized();

  // Date Binding
  await initializeDateFormatting();

  // Run App
  runApp(const MainApp());
}
