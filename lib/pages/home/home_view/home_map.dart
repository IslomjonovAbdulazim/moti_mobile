import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moti/pages/home/home_controller.dart';
import 'package:moti/pages/order/order_controller.dart';
import 'package:moti/pages/order/order_page.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../utils/dimensions.dart';
import '../../detail_page/detail_view/circle_icon.dart';


class HomeMap extends StatelessWidget {
  const HomeMap({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return
      GetBuilder(
        init: HomeController(),
        builder: (HomeController controller) {
          return Stack(
            children: [
              YandexMap(
                mapObjects: controller.mapObjects,
                tiltGesturesEnabled: true,
                zoomGesturesEnabled: true,
                rotateGesturesEnabled: true,
                scrollGesturesEnabled: true,
                modelsEnabled: true,
                nightModeEnabled: false,
                indoorEnabled: false,
                liteModeEnabled: false,
                onMapCreated: controller.onMapCreated,
                onCameraPositionChanged: controller.onCameraPositionChanged,
              ),
              IgnorePointer(
                child: Center(
                  child:  AnimatedBuilder(
                    animation: controller.animation,
                    builder: (context, child) {
                      return AnimatedPadding(
                        padding: EdgeInsets.only(bottom: controller.animation.value),
                        duration: const Duration(milliseconds: 500),
                        child:  Icon(
                          Icons.location_on,
                          color: controller.animationColor.value,
                          size: 50,
                        ),
                      );
                    },
                  ),
                ),

              ),
              // Align(
              //   alignment: Alignment.topRight,
              //   child: GestureDetector(
              //     onTap:(){
              //       Get.to(()=>const OrderPage());                  } ,
              //     // onDoubleTap: (){
              //     //   Get.to(()=>const OrderPage());
              //     // },
              //     child: SafeArea(
              //         child: GetBuilder<OrderController>(
              //           init: OrderController(),
              //           builder: (controller) {
              //             return controller.orders.orders.isNotEmpty ?
              //              Padding(
              //                 padding: EdgeInsets.only(right: Dimensions.width20),
              //                 child: Badge(
              //                     badgeColor: Theme.of(context).primaryColor,
              //                     badgeContent: Text(controller.orders.orders.length.toString(), style: const TextStyle(color: Colors.white),),
              //                     child: CircleIcon(size: Dimensions.height40, iconData: CupertinoIcons.shopping_cart,)),)
              //             :
              //             Padding(
              //               padding: EdgeInsets.only(right: Dimensions.width20),
              //               child: CircleIcon(size: Dimensions.height40, iconData: CupertinoIcons.shopping_cart,),
              //             );
              //           }
              //         )),
              //   ),
              // ),
              Align(
                alignment: Alignment.topLeft,
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                    child: Row(
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
                              child: TextField(
                                showCursor: false,
                                onChanged: (value)=>controller.filterProduct(value),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "search".tr,
                                  hintStyle: TextStyle(fontSize: Dimensions.font16)
                                ),
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
                    ),
                  ),
                ),
              )
            ],
          );
        }
      );
  }
}
