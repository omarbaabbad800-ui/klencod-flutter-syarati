import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app/app.dart';
import 'data/datasources/local/hive_setup.dart';
import 'data/datasources/local/seed_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar', null);
  await HiveSetup.initHive();
  await SeedData.seedDatabaseIfEmpty();

  runApp(
    const ProviderScope(
      child: SyaratiApp(),
    ),
  );
}