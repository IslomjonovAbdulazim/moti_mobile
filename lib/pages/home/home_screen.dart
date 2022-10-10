import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:moti/pages/home/home_controller.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../utils/my_behaviour.dart';
import '../../utils/text_utils/header_text.dart';
import '../detail_page/detail_view/circle_icon.dart';
import '../order/order_controller.dart';
import '../order/order_page.dart';
import 'home_view/single_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.bg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Row(
          children: [
            Expanded(child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: Dimensions.height40,
                    padding: EdgeInsets.only(left: Dimensions.width10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Dimensions.radius20)
                    ),
                    child: Center(
                      child: GetBuilder<HomeController>(
                        init: HomeController(),
                        builder: (controller) {
                          return TextField(
                            showCursor: false,
                            onChanged: (value)=>controller.filterProduct(value),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "search".tr,
                                hintStyle: TextStyle(fontSize: Dimensions.font16)
                            ),
                          );
                        }
                      ),
                    ),
                  ),
                ),
                SizedBox(width: Dimensions.width20,),
                GestureDetector(
                  onTap: () => Get.to(()=> const OrderPage()),
                  child: GetBuilder<OrderController>(
                      init: OrderController(),
                      builder: (controller) {
                        return controller.orders.orders.isNotEmpty ?
                        Badge(
                            padding: EdgeInsets.all(Dimensions.height5),
                            animationType: BadgeAnimationType.scale,
                            elevation: 0,
                            badgeColor: Theme.of(context).primaryColor,
                            badgeContent: Text(controller.orders.orders.length.toString(), style: const TextStyle(color: Colors.white),),
                            child: CircleIcon(size: Dimensions.height40, iconData: CupertinoIcons.shopping_cart,))
                            :
                        CircleIcon(size: Dimensions.height40, iconData: CupertinoIcons.shopping_cart,);
                      }
                  ),
                )
              ],
            ),)
          ],
        ),
      ),
      body:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.greenAccent
            ),
            margin: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height20),
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                    flex:1,child: SizedBox.shrink()),
                Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const Text("25%", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 55),),
                        const Text("Today`s Special!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                        Text("Get discount for every order, only valid for today", style: TextStyle(color: Colors.white.withOpacity(.7), fontWeight: FontWeight.normal, fontSize: 14),),
                      ],
                    )),
                Expanded(
                    flex: 5,
                    child: Image.network("https://www.freepnglogos.com/uploads/sushi-png/sushi-png-images-are-download-crazypngm-13.png", fit: BoxFit.contain,)),
              ],
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: const SizedBox.shrink(),
                  leadingWidth: 0,
                  title: Container(
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
                                      child: Center(child: HeaderText(text: controller.allCategory[index].name!,fontWeight: FontWeight.w500, fontFamily: "Inter", color: Colors.black,))),
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
                  pinned: true,
                  backgroundColor: AppColors.instance.bg,
                  elevation: 0,
                  toolbarHeight:  Dimensions.categoryItemHeight+1,
                ),
                SliverToBoxAdapter(
                  child: GetBuilder<HomeController>(
                      builder: (controller) {
                        return ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: controller.filteredProducts.isNotEmpty ? ScrollablePositionedList.builder(
                            physics: const ClampingScrollPhysics(),
                            itemScrollController: controller.itemScrollProductController,
                            shrinkWrap: true,
                            itemPositionsListener: controller.itemPositionsListener,
                            addAutomaticKeepAlives: true,
                            itemCount: controller.filteredProducts.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                  onTap: (){
                                    controller.openDetailPage(controller.filteredProducts[index], context);
                                  },
                                  child: SingleProduct(item: controller.filteredProducts[index]));
                            },
                          ) : Padding(
                            padding:  EdgeInsets.symmetric(vertical: Dimensions.checkOutMapHeight),
                            child: HeaderText(text: "No element found", textAlign: TextAlign.center,),
                          ),
                        );
                      }
                  ),
                )
              ],
            ),
          ),


        ],
      ),
    );
  }
}
