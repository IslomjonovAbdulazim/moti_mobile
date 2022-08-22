import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moti/pages/home/home_controller.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';


class HomeMap extends StatefulWidget {
  const HomeMap({Key? key}) : super(key: key);

  @override
  State<HomeMap> createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap>  with SingleTickerProviderStateMixin{
  late AnimationController animController;
  late Animation<double> animation;
  late Animation<Color?> animationColor;
  onCameraPositionChanged(CameraPosition cameraPosition,CameraUpdateReason cameraUpdateReason, bool bullet){
    print("Latitude: ${cameraPosition.target.latitude}, Longitude: ${cameraPosition.target.longitude}, bool: $bullet,");
    HomeController().getAddressFromLatLong(cameraPosition.target.latitude, cameraPosition.target.longitude);
    HomeController().colorBool = bullet;
    if(bullet == false){
      animController.forward();
    }
    if(animController.isCompleted || bullet == false){
      animController.repeat(reverse: true);
    }else{
      animController.stop();
    }
    print(HomeController().currentAddress);
  }
  @override
  void initState(){
    animController = AnimationController(
      vsync: this,
      duration:  Duration(milliseconds: HomeController().duration),
    );

    animation = Tween<double>(
      begin: 20,
      end: 0,
    ).animate(CurvedAnimation(
      parent: animController,
      curve: const Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
    ));

    animationColor = ColorTween(begin: Colors.orange, end: Colors.red)
        .animate(animController);
    animationColor.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animController.repeat(reverse: true);
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    animController.dispose();
    super.dispose();
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
                onCameraPositionChanged: onCameraPositionChanged,
              ),
              IgnorePointer(
                child: Center(
                  child:  AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return AnimatedPadding(
                        padding: EdgeInsets.only(bottom: animation.value),
                        duration: const Duration(milliseconds: 500),
                        child:  Icon(
                          Icons.location_on,
                          color: animationColor.value,
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
