import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moti/utils/colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'home_view/home_map.dart';
import 'home_view/home_panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {    final height = Get.height;

  return Scaffold(
    backgroundColor: AppColors.appColors.bg,
      body: SlidingUpPanel(
        parallaxEnabled: true,
        parallaxOffset: .5,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        color: AppColors.appColors.bg,
        minHeight: height * .3,
        maxHeight: height * .85,
        body: const HomeMap(),
        panelBuilder: (ScrollController controller) => HomePanel(controller: controller),
      ),
    );
  }
}
