import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:moti/services/init_service.dart';

import 'pages/home/home_page.dart';

void main() async {
  await InitService.init;
  runApp(const _Moti());
}

class _Moti extends StatelessWidget {
  const _Moti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomePage(),
    );
  }
}
