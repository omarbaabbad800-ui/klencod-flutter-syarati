import 'package:hive_ce_flutter/hive_flutter.dart';

class HiveSetup {
  static const String vehiclesBox = 'vehicles_box';
  static const String bookingsBox = 'bookings_box';

  static Future<void> initHive() async {
    await Hive.initFlutter();
    await Hive.openBox(vehiclesBox);
    await Hive.openBox(bookingsBox);
  }
}