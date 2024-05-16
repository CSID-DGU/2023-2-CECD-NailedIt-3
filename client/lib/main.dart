import 'package:flutter/material.dart';
import 'package:nailed_it/app/main_app.dart';

import 'package:intl/date_symbol_data_local.dart';

void main() async {
  // WidgetsBinding
  WidgetsFlutterBinding.ensureInitialized();

  // Date Binding
  await initializeDateFormatting();

  // Run App
  runApp(const MainApp());
}


