import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moti/pages/home/home_controller.dart';
import 'package:moti/pages/home/home_view/home_map.dart';


class DraggableScrollableSheetAnimation extends StatefulWidget {
  const DraggableScrollableSheetAnimation({super.key});

  @override
  _DraggableScrollableSheetAnimationState createState() => _DraggableScrollableSheetAnimationState();
}

class _DraggableScrollableSheetAnimationState extends State<DraggableScrollableSheetAnimation> {
  var homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: MediaQuery.of(context).size.height * 0.3,
            child: const HomeMap()
          ),

          Positioned.fill(
            child: NotificationListener<DraggableScrollableNotification>(
              onNotification: (notification) {
                setState(() {
                  homeController.percent = 2 * notification.extent - 0.8;
                });
                return true;
              },
              child: DraggableScrollableSheet(
                snap: true,
                maxChildSize: 0.9,
                minChildSize: 0.4,
                initialChildSize: 0.4,
                builder: (_, controller) {
                  return Material(
                    elevation: 10,
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
                          const Text(
                            'It\'s good to see you',
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Where are you going?',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(height: 25),
                          TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.purple[300],
                              ),
                              hintText: 'Search destination',
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.only(bottom: 40),
                              controller: controller,
                              itemCount: 20,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: const Icon(Icons.location_on_outlined),
                                  title: Text('Address :$index'),
                                  subtitle: Text('City $index'),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: -170 * (1 - homeController.percent),
            child: Opacity(
              opacity: homeController.percent,
              child: _SearchDestination(),
            ),
          ),
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
