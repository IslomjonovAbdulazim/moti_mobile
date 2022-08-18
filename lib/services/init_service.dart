import 'package:flutter/material.dart';
import 'package:moti/services/di_service.dart';

class InitService {
  static Future<void> get init async {
    WidgetsFlutterBinding.ensureInitialized();
    DIService.init;
  }
}
