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
import 'package:device_preview/device_preview.dart';
import 'package:moti/services/lang_service.dart';

import 'pages/check_out/check_out_page.dart';
const String token =
    "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI5OTg5MzY5ODE4MDMiLCJyb2xlcyI6W3siYXV0aG9yaXR5IjoiUk9MRV9VU0VSIn1dLCJpYXQiOjE2NjUzMDY3NzcsImV4cCI6Mzc2NjUzMDY3Nzd9.EhuickRu0TJVOnFXLzqrDuhFJ5RSiTwhnYhy6KSqZFok8eUuwrr1QJAqqlwAEOtDX4FIfNh5Wt56191xZXuu3Q"; //getters

void main() async {
  await InitService.init;
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const _Moti(), // Wrap your app
    ),
  );
}

class _Moti extends StatelessWidget {
  const _Moti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HistoryAndFavouritePage(),
    );
  }
}
