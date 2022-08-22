import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moti/pages/history_and_favourite/history_and_favourite_controller.dart';
import 'package:moti/pages/history_and_favourite/history_and_favourite_view/favourites.dart';
import 'package:moti/pages/history_and_favourite/history_and_favourite_view/histories.dart';
import 'package:moti/pages/history_and_favourite/history_and_favourite_view/history_and_favourite_tab_bar.dart';
import 'package:moti/pages/history_and_favourite/history_and_favourite_view/history_items.dart';
import 'package:moti/utils/dimensions.dart';

import '../../utils/colors.dart';

class HistoryAndFavouritePage extends StatelessWidget {
  const HistoryAndFavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryAndFavouriteController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.instance.bg,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: HistoryAndFavouritesTabBar(
              currentPageIndex: controller.getCurrentPageIndex,
              onTap: () {
                controller.setCurrentPageIndex =
                    controller.getCurrentPageIndex == 1 ? 0 : 1;
              },
            ),
          ),
          body: PageView(
            controller: controller.pageController,
            onPageChanged: (int newIndex) {
              controller.setCurrentPageIndex = newIndex;
            },
            children: [
              Histories(orders: controller.orders),
              Favourites(favourites: controller.favourites),
            ],
          ),
        );
      },
    );
  }
}
