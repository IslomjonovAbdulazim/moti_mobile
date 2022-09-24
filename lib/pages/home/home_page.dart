import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moti/pages/home/home_controller.dart';
import 'package:moti/utils/colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'home_view/home_map.dart';
import 'home_view/home_panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const id = '/home_page';
  @override
  Widget build(BuildContext context) {
    var suke = Get.put(HomeController());
  return Scaffold(
    backgroundColor: AppColors.instance.bg,
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return SlidingUpPanel(
            header: Container(
              width: MediaQuery.of(context).size.width,
              color: AppColors.instance.bg,
              height: 50,
              child:
              ListView.separated(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.allCategory.length,
                  itemBuilder: (BuildContext context, int index){

                    return GestureDetector(
                      onTap:(){
                        controller.jumpToCategoryProduct(controller.allCategory[index].id!);
                        },
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,

                        ),
                          height: 20,
                          child: Center(child: Text(controller.allCategory[index].name!, style: const TextStyle(color: Colors.black),))),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 10,);
              },),
            ),
                padding: const EdgeInsets.only(top: 10),
                parallaxEnabled: false,
                parallaxOffset: .5,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                color: AppColors.instance.bg,
                minHeight: MediaQuery.of(context).size.height * .3,
                maxHeight: MediaQuery.of(context).size.height * .85,
                body: const HomeMap(),
                panelBuilder: (ScrollController controller) =>
                    HomePanel(controller: controller,),
          );
        },
      ),
    );
  }
}
