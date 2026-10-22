import 'package:hive_ce/hive.dart';
import 'hive_setup.dart';

class SeedData {
  static Future<void> seedDatabaseIfEmpty() async {
    final box = Hive.box(HiveSetup.vehiclesBox);
    if (box.isEmpty) {
      await box.add({'id': '1', 'make': 'تويوتا', 'model': 'كامري', 'year': 2023, 'dailyPrice': 250.0, 'city': 'الرياض', 'seats': 5, 'isActive': true});
      await box.add({'id': '2', 'make': 'هيونداي', 'model': 'النترا', 'year': 2022, 'dailyPrice': 180.0, 'city': 'جدة', 'seats': 5, 'isActive': true});
    }
  }
}