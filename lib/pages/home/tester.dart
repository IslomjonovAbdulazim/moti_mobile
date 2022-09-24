import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:moti/pages/home/home_controller.dart';
import 'package:moti/pages/home/home_view/home_map.dart';
import 'package:moti/pages/home/home_view/single_product.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


class DraggableScrollableSheetAnimation extends StatefulWidget {
  const DraggableScrollableSheetAnimation({super.key});

  @override
  _DraggableScrollableSheetAnimationState createState() => _DraggableScrollableSheetAnimationState();
}

class _DraggableScrollableSheetAnimationState extends State<DraggableScrollableSheetAnimation> {
  var homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.controller1  = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        backgroundColor: Colors.grey,
        title: Container(
          height: 40,
          child: ListView.separated(
            padding: const EdgeInsets.only(left: 10, bottom: 5),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: homeController.allCategory.length,
            itemBuilder: (BuildContext context, int index){
              return GestureDetector(
                onTap:(){
                  homeController.scrollToCounter(homeController.allCategory[index].id!);
                  //homeController.jumpToCategoryProduct(homeController.allCategory[index].id!);
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,

                    ),
                    height: 20,
                    child: Center(child: Text(homeController.allCategory[index].name!, style: const TextStyle(color: Colors.black),))),
              );
            }, separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 10,);
          },),
        ),

      ),
      body: Stack(
        children: [
          Positioned.fill(
            bottom: MediaQuery.of(context).size.height * 0.3,
            child: const HomeMap()
          ),

          Positioned.fill(
            child: DraggableScrollableSheet(
              snap: true,
              maxChildSize: 0.9,
              minChildSize: 0.4,
              initialChildSize: 0.4,
              builder: (_, controller) {
                return Container(
                  height: 600,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    controller: controller,
                    child: Material(
                      elevation: 20,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: 40,
                                  color: Colors.grey[300],
                                  height: 2,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),

                            Expanded(
                              child: ListView.builder(
                                padding: const EdgeInsets.only(bottom: 40),
                                //controller: controller,

                                controller: homeController.controller1,
                                itemCount: 20,
                                itemBuilder: (context, index) {
                                  return AutoScrollTag(
                                    key: ValueKey(index),
                                    controller: homeController.controller1,
                                    index: index,
                                    child: SingleProduct(item: homeController.allProducts[index],

                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   top: -170 * (1 - homeController.percent),
          //   child: Opacity(
          //     opacity: homeController.percent,
          //     child: _SearchDestination(),
          //   ),
          // ),
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   bottom: -50 * (1 - _percent),
          //   child: Opacity(
          //     opacity: _percent,
          //     child: _PickPlaceInMap(),
          //   ),
          // ),
        ],
      ),
    );
  }
}

// class _PickPlaceInMap extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 10,
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.place_sharp, color: Colors.grey),
//             const SizedBox(width: 10),
//             Text('Pick in the map'),
//           ],
//         ),
//       ),
//     );
//   }
// }

class _SearchDestination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )
      ),
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: const [
              BackButton(),
              Text(
                'Choose destination',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    hintText: 'Avenue 24 NO 219',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    hintText: 'Where are we going?',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
