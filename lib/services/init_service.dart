import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moti/services/di_service.dart';

class InitService {
  static Future<void> get init async {
    WidgetsFlutterBinding.ensureInitialized();
    DIService.init;
    await Hive.initFlutter();

  }
}
