import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:moti/pages/lets_in/lets_in_page.dart';
import 'package:moti/services/db_service.dart';
import 'package:moti/services/init_service.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  await InitService.init;
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) =>const _Moti(), // Wrap your app
  ),);
}

class _Moti extends StatelessWidget {
  const _Moti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final db = DBService.instance;
    return GetMaterialApp(
      home: LetsInPage(),
    );
  }
}
