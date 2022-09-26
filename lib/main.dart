import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:moti/pages/history_and_favourite/history_and_favourite_page.dart';
import 'package:moti/pages/home/home_page.dart';
import 'package:moti/pages/lets_in/lets_in_controller.dart';
import 'package:moti/pages/lets_in/lets_in_page.dart';
import 'package:moti/pages/profile/profile.dart';
import 'package:moti/pages/profile/profile_page.dart';
import 'package:moti/pages/splash/splash_page.dart';
import 'package:moti/services/init_service.dart';

void main() async {
  await InitService.init;
  runApp(const _Moti());
}

class _Moti extends StatelessWidget {
  const _Moti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
