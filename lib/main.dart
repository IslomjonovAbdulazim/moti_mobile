import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:moti/pages/home/home_screen.dart';
import 'package:moti/pages/splash/splash_page.dart';
import 'package:moti/services/init_service.dart';
import 'package:moti/services/lang_service.dart';

void main() async {
  await InitService.init;
  runApp(const _Moti());
}

class _Moti extends StatelessWidget {
  const _Moti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.greenAccent
      ),
      translations: LangService(),
      locale: LangService.locale,
      fallbackLocale: LangService.fallbackLocale,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
