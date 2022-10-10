import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moti/pages/home/home_controller.dart';
import 'package:moti/utils/colors.dart';
import 'package:moti/utils/dimensions.dart';
import 'package:moti/utils/text_utils/header_text.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'home_view/home_map.dart';
import 'home_view/home_panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const id = '/home_page';
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: AppColors.instance.bg,
      body:
           SlidingUpPanel(
            boxShadow: const [
              BoxShadow(
                color: Colors.transparent,
                blurRadius: 0.0,
                offset: Offset.zero
              ),
            ],
            panelSnapping: true,
            header: Container(
              width: MediaQuery.of(context).size.width,
              color: AppColors.instance.bg,
              height: Dimensions.categoryItemHeight,
              child:
              GetBuilder<HomeController>(
                init: HomeController(),
                builder: (controller) {
                  return ListView.separated(
                    padding: EdgeInsets.only(left: Dimensions.width10, bottom: Dimensions.height10),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.allCategory.length,
                      itemBuilder: (BuildContext context, int index){
                        if (controller.filteredProducts.isNotEmpty && controller.filteredProducts[controller.currentIndex].categoryId == controller.allCategory[index].id) {
                          return GestureDetector(
                          onTap:(){
                            controller.jumpToCategoryProduct(controller.allCategory[index].id!);
                            },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                              padding:  EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: const Color(0xff69F0AE),

                            ),
                              height: Dimensions.categoryItemHeight,
                              child: Center(child: HeaderText(text: controller.allCategory[index].name!,fontWeight: FontWeight.w500, fontFamily: "Inter", color: Colors.white,))),
                        );
                        } else {
                          return GestureDetector(
                          onTap:(){
                            controller.jumpToCategoryProduct(controller.allCategory[index].id!);
                          },
                          child: AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              padding:  EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white,

                              ),
                              height: Dimensions.categoryItemHeight,
                              child: Center(child: HeaderText(text: controller.allCategory[index].name!,fontWeight: FontWeight.w500, fontFamily: "Inter",))),
                        );
                        }
                      }, separatorBuilder: (BuildContext context, int index) {
                      return SizedBox( width: Dimensions.width10,);
                  },
                  //   separatorBuilder: (BuildContext context, int index) {
                  //       return SizedBox(width: Dimensions.width10,);
                  // },
                  );
                }
              ),
            ),
                padding:  EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height10),
                parallaxEnabled: false,
                parallaxOffset: .5,
                borderRadius:  BorderRadius.vertical(top: Radius.circular(Dimensions.radius12)),
                color: AppColors.instance.bg,
                minHeight: MediaQuery.of(context).size.height * .3,
                maxHeight: MediaQuery.of(context).size.height * .85,
                body: const HomeMap(),
                panelBuilder: (ScrollController controller) =>
                    HomePanel(controller: controller,),

          ),
    );
  }
}
