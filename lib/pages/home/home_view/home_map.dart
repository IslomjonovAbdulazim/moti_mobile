import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moti/pages/home/home_controller.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';


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
                          size: 30,
                        ),
                      );
                    },
                  ),
                ),

              ),
            ],
          );
        }
      );
  }
}
