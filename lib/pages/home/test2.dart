import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moti/pages/home/tester.dart';
import 'package:moti/utils/dimensions.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../utils/colors.dart';
import 'home_controller.dart';
import 'home_view/home_map.dart';
import 'home_view/single_product.dart';

class HomeTestForScroll extends StatefulWidget {
  const HomeTestForScroll({Key? key}) : super(key: key);

  @override
  State<HomeTestForScroll> createState() => _HomeTestForScrollState();
}

class _HomeTestForScrollState extends State<HomeTestForScroll> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          // appBar: AppBar(
          //   toolbarHeight: 40,
          //   elevation: 0,
          //   backgroundColor: Colors.grey,
          //   title: Container(
          //     height: 40,
          //     child: ListView.separated(
          //       padding: const EdgeInsets.only(left: 10, bottom: 5),
          //       shrinkWrap: true,
          //       scrollDirection: Axis.horizontal,
          //       itemCount: controller.allCategory.length,
          //       itemBuilder: (BuildContext context, int index){
          //         return GestureDetector(
          //           onTap:(){
          //             controller.jumpToCategoryProduct(controller.allCategory[index].id!);
          //           },
          //           child: Container(
          //               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(20),
          //                 color: Colors.white,
          //
          //               ),
          //               height: 20,
          //               child: Center(child: Text(controller.allCategory[index].name!, style: const TextStyle(color: Colors.black),))),
          //         );
          //       }, separatorBuilder: (BuildContext context, int index) {
          //       return const SizedBox(width: 10,);
          //     },),
          //   ),
          //
          // ),

          backgroundColor: AppColors.instance.bg,
          // body: Center(
          //   child: ElevatedButton(
          //     onPressed: () {
          //       showModalBottomSheet(context: context,
          //           isDismissible: false,
          //           backgroundColor: Colors.transparent,
          //           isScrollControlled: true,
          //           builder: (context){
          //
          //         return DraggableScrollableSheet(
          //             initialChildSize: 0.4,
          //             minChildSize: 0.4,
          //             maxChildSize: 0.9,
          //             builder: ( _,  cont) {
          //               return ClipRRect(
          //                 borderRadius: BorderRadius.only(
          //                   topLeft: Radius.circular(Dimensions.radius20),
          //                   topRight: Radius.circular(Dimensions.radius20),
          //                 ),
          //                 child: ColoredBox(
          //                   color: Colors.grey,
          //                   child: Column(
          //                     mainAxisSize: MainAxisSize.min,
          //                     children: [
          //                       Center(
          //                         child: Padding(
          //                           padding: const EdgeInsets.all(8.0),
          //                           child: Container(
          //                             width: 40,
          //                             color: Colors.grey[300],
          //                             height: 2,
          //                           ),
          //                         ),
          //                       ),
          //                       Container(
          //                         height: 40,
          //                         child: ListView.separated(
          //                           padding: const EdgeInsets.only(left: 10, bottom: 5),
          //                           shrinkWrap: true,
          //                           scrollDirection: Axis.horizontal,
          //                           itemCount: controller.allCategory.length,
          //                           itemBuilder: (BuildContext context, int index){
          //                             return GestureDetector(
          //                               onTap:(){
          //                                 controller.jumpToCategoryProduct(controller.allCategory[index].id!);
          //                               },
          //                               child: Container(
          //                                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //                                   decoration: BoxDecoration(
          //                                     borderRadius: BorderRadius.circular(20),
          //                                     color: Colors.white,
          //
          //                                   ),
          //                                   height: 20,
          //                                   child: Center(child: Text(controller.allCategory[index].name!, style: const TextStyle(color: Colors.black),))),
          //                             );
          //                           }, separatorBuilder: (BuildContext context, int index) {
          //                           return const SizedBox(width: 10,);
          //                         },),
          //                       ),
          //                       Expanded(
          //                         child: ScrollablePositionedList.builder(
          //                           physics: ScrollPhysics(),
          //                           itemScrollController: controller.itemScrollProductController,
          //                           shrinkWrap: true,
          //                           addAutomaticKeepAlives: true,
          //                           itemCount: controller.allProducts.length,
          //                           itemBuilder: (BuildContext context, int index) {
          //                             return SingleProduct(item: controller.allProducts[index]);
          //                           },
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               );
          //             });
          //       });
          //     },
          //     child: Text("press"),
          //   ),
          // )
          // ScrollablePositionedList.builder(
          //   itemScrollController: controller.itemScrollProductController,
          //   shrinkWrap: true,
          //   addAutomaticKeepAlives: true,
          //   itemCount: controller.allProducts.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     return SingleProduct(item: controller.allProducts[index]);
          //   },
          // ),
          body:
          DraggableScrollableSheet(
            expand: true,
              snap: true,
              initialChildSize: 0.4,
              minChildSize: 0.4,
              maxChildSize: 0.9,
              builder: ( _,  cont) {
                return Material(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    ),
                    child: ColoredBox(
                      color: Colors.grey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 40,
                                color: Colors.grey[300],
                                height: 2,
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            child: ListView.separated(
                              padding: const EdgeInsets.only(left: 10, bottom: 5),
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
                          Expanded(
                            child: ScrollablePositionedList.builder(
                              physics: ScrollPhysics(),
                              itemScrollController: controller.itemScrollProductController,
                              shrinkWrap: true,
                              addAutomaticKeepAlives: true,
                              itemCount: controller.allProducts.length,
                              itemBuilder: (BuildContext context, int index) {
                                return SingleProduct(item: controller.allProducts[index]);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
          ///old one
          // Stack(
          //   children: [
          //     Positioned.fill(
          //         bottom: MediaQuery.of(context).size.height * 0.3,
          //         child: const HomeMap()
          //     ),
          //
          //     Positioned.fill(
          //       child: NotificationListener<DraggableScrollableNotification>(
          //         onNotification: (notification) {
          //           // setState(() {
          //           //   homeController.percent = 2 * notification.extent - 0.8;
          //           // });
          //           return true;
          //         },
          //         child: DraggableScrollableSheet(
          //
          //           snap: true,
          //           maxChildSize: 0.9,
          //           minChildSize: 0.4,
          //           initialChildSize: 0.4,
          //           builder: (_, controlle) {
          //             return Material(
          //               elevation: 10,
          //               borderRadius: const BorderRadius.vertical(
          //                 top: Radius.circular(20),
          //               ),
          //               color: Colors.white,
          //               child: Padding(
          //                 padding: const EdgeInsets.only(left: 20.0),
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Center(
          //                       child: Padding(
          //                         padding: const EdgeInsets.all(10.0),
          //                         child: Container(
          //                           width: 40,
          //                           color: Colors.grey[300],
          //                           height: 2,
          //                         ),
          //                       ),
          //                     ),
          //                     const SizedBox(height: 5),
          //                     const Text(
          //                       'It\'s good to see you',
          //                       style: TextStyle(color: Colors.grey, fontSize: 13),
          //                     ),
          //                     const SizedBox(height: 5),
          //                     const Text(
          //                       'Where are you going?',
          //                       style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          //                     ),
          //                     const SizedBox(height: 25),
          //                     TextField(
          //                       decoration: InputDecoration(
          //                         prefixIcon: Icon(
          //                           Icons.search,
          //                           color: Colors.purple[300],
          //                         ),
          //                         hintText: 'Search destination',
          //                       ),
          //                     ),
          //                     Expanded(
          //                       child:
          //                       ScrollablePositionedList.builder(
          //                         itemScrollController: controller.itemScrollProductController,
          //                         shrinkWrap: true,
          //                         addAutomaticKeepAlives: true,
          //                         itemCount: controller.allProducts.length,
          //                         itemBuilder: (BuildContext context, int index) {
          //                           return SingleProduct(item: controller.allProducts[index]);
          //                         },
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             );
          //           },
          //         ),
          //       ),
          //     ),
          //     // Positioned(
          //     //   left: 0,
          //     //   right: 0,
          //     //   top: -170 * (1 - homeController.percent),
          //     //   child: Opacity(
          //     //     opacity: homeController.percent,
          //     //     child: _SearchDestination(),
          //     //   ),
          //     // ),
          //     // Positioned(
          //     //   left: 0,
          //     //   right: 0,
          //     //   bottom: -50 * (1 - _percent),
          //     //   child: Opacity(
          //     //     opacity: _percent,
          //     //     child: _PickPlaceInMap(),
          //     //   ),
          //     // ),
          //   ],
          // ),

          // Stack(
          //   children: <Widget>[
          //     DraggableScrollableSheet(
          //         initialChildSize: 0.15,
          //         minChildSize: 0.15,
          //         maxChildSize: 1.0,
          //         builder: (BuildContext context, ScrollController scrollController) {
          //           return Container(
          //             color: Colors.blue[200],
          //             child: SingleChildScrollView(
          //               child: ScrollablePositionedList.builder(
          //                                         physics: ScrollPhysics(),
          //                                         itemScrollController: controller.itemScrollProductController,
          //                                         shrinkWrap: true,
          //                                         addAutomaticKeepAlives: true,
          //                                         itemCount: controller.allProducts.length,
          //                                         itemBuilder: (BuildContext context, int index) {
          //                                           return SingleProduct(item: controller.allProducts[index]);
          //                                         },
          //                                       ),
          //             ),
          //           );
          //         })
          //   ],
          // ),
        );
      }
    );
  }
}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
