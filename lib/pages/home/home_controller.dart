import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as GeoCode;
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:location/location.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../../models/parsing/moti_product_model.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin{
  Location location = Location();
  String currentAddress = 'search';
  late LocationData locationData;
  late YandexMapController yandexController;
  late AnimationController animController;
  late Animation<double> animation;
  late Animation<Color?> animationColor;
  bool colorBool = true;
  int duration = 600;
  List<MapObject> mapObjects = [  PlacemarkMapObject(
    mapId: const MapObjectId('placeMark_2'),
    point: const Point(latitude: 41.2995, longitude: 69.2401),
    icon: PlacemarkIcon.single(
      PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage("assets/icons/loc4.png",),
          scale: 0.5),
    ),),
  ];
  getPosition()async{
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationData = await location.getLocation();
    await yandexController.moveCamera(
        CameraUpdate.newCameraPosition(  CameraPosition(
            target: Point(latitude: locationData.latitude!, longitude: locationData.longitude!),
            zoom: 17.0)));
  }
  Future<void> getAddressFromLatLong(latitude, longitude)async {
    List<GeoCode.Placemark?> placeMarks = await GeoCode.placemarkFromCoordinates(latitude!, longitude!);
    GeoCode.Placemark place = placeMarks[0]!;
    currentAddress = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    update();
  }
  onCameraPositionChanged(CameraPosition cameraPosition,CameraUpdateReason cameraUpdateReason, bool bullet){
    print("Latitude: ${cameraPosition.target.latitude}, Longitude: ${cameraPosition.target.longitude}, bool: $bullet,");
    getAddressFromLatLong(cameraPosition.target.latitude, cameraPosition.target.longitude);
    colorBool = bullet;
    if(bullet == false){
      animController.forward();
    }
    if(animController.isCompleted || bullet == false){
      animController.repeat(reverse: true);
    }else{
      animController.stop();
    }
    print(currentAddress);
  }

  onMapCreated(YandexMapController controller) async{
    yandexController = controller;
    await yandexController.getCameraPosition().then((value) async{
      await yandexController.moveCamera(
          CameraUpdate.newCameraPosition( const CameraPosition(
              target: Point(latitude: 41.2995, longitude: 69.2401),
              zoom: 17.0)));
    });
  }




  List<MotiProductModel> products = List.generate(10, (index) => MotiProductModel(name: 'name: $index', isLiked: index.isEven, price: index * 10000, title: 'title: $index', imagePath: 'https://images.unsplash.com/photo-1657299171251-2a61ea716fbf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),);

  @override
  void onInit() {
    getPosition();
    animController = AnimationController(
      vsync: this,
      duration:  Duration(milliseconds: duration),
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
    super.onInit();
  }

  @override
  void onClose() {
    yandexController.dispose();
    super.onClose();
  }

}

