import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox('offline_prescriptions');
  }

  static Box get offlineBox => Hive.box('offline_prescriptions');
}