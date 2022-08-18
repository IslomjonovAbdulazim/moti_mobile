import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moti/pages/home/home_controller.dart';
import 'package:moti/pages/home/home_view/moti_product_item.dart';

class HomePanel extends StatelessWidget {
  final ScrollController controller;
  const HomePanel({Key? key, required this.controller,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return ListView(
          controller: this.controller,
          children: controller.products.map((product) => HomeMotiProductItem(item: product)).toList(),
        );
      }
    );
  }
}
