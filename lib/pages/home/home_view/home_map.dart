import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moti/pages/home/home_controller.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class HomeMap extends StatefulWidget {
import '../../../utils/dimensions.dart';
import '../../detail_page/detail_view/circle_icon.dart';


class HomeMap extends StatelessWidget {
  const HomeMap({Key? key}) : super(key: key);

  @override
  State<HomeMap> createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  _onMapCreated(YandexMapController controller) async{
    await controller.getCameraPosition().then((value) async{
      await controller.moveCamera(CameraUpdate.newCameraPosition(const CameraPosition(
          target: Point(latitude: 41.2995, longitude: 69.2401),
          zoom: 12.0)));
    });
  }


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
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap:(){
          controller.getAddressFromLatLong(controller.locationData!.latitude, controller.locationData!.longitude);
                  } ,
                  onDoubleTap: (){
                    //controller.jumpToCategoryProduct();
                  },
                  child:  Container(
                    margin: const EdgeInsets.only(right: 50, top: 50),
                    height: 40,
                    width: 100,
                    color: Colors.blueAccent,
                    child: const Center(
                      child: Text(
                        "Bicycle road"
                      ),
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
