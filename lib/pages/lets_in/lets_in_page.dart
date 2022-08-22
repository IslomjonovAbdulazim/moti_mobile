import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moti/pages/lets_in/lets_in_controller.dart';
import 'package:moti/pages/lets_in/lets_in_view/lets_in_tab_bar.dart';
import 'package:moti/utils/dimensions.dart';

import 'lets_in_view/lets_in_items.dart';

class LetsInPage extends StatelessWidget {
  const LetsInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LetsInController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: LetsInTabBar(
            onTap: () {
              controller.setCurrentPageIndex =
                  controller.getCurrentPageIndex == 0 ? 1 : 0;
            },
            currentPageIndex: controller.getCurrentPageIndex,
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(Dimensions.latsInBetweenTabChildren),
            child: const SizedBox.shrink(),
          ),
        ),
        body: PageView(
          controller: controller.pageController,
          onPageChanged: (int newIndex) {
            controller.setCurrentPageIndex = newIndex;
          },
          physics: const BouncingScrollPhysics(),
          children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              children: controller.itemsSignIn.map((item) => LetsInItem(item: item)).toList(),
            ),
            ListView(
              physics: const BouncingScrollPhysics(),
              children: controller.itemsSignUp.map((item) => LetsInItem(item: item)).toList(),
            ),
          ],
        ),
      );
    });
  }
}
