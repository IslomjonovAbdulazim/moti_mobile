import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moti/services/di_service.dart';

class InitService {
  static Future<void> get init async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom,SystemUiOverlay.top]);
    DIService.init;

  }
}
