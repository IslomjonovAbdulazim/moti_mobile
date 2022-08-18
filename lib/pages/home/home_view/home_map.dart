import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class HomeMap extends StatefulWidget {
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
      YandexMap(
        tiltGesturesEnabled: true,
        zoomGesturesEnabled: true,
        rotateGesturesEnabled: true,
        scrollGesturesEnabled: true,
        modelsEnabled: true,
        nightModeEnabled: false,
        indoorEnabled: false,
        liteModeEnabled: false,
        onMapCreated: _onMapCreated);
  }
}
