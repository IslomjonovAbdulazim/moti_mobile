import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as GeoCode;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:location/location.dart';
import 'package:moti/models/parsing/AllCategory.dart';
import 'package:moti/models/parsing/CategoryContent.dart';
import 'package:moti/services/apis.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../../models/parsing/moti_product_model.dart';
import '../../models/parsing/product_model.dart';
import '../../services/network_service.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin{
  var network = NetworkService.instance;
  var api = Apis.instance;
  List<Product> allProducts = [];
  List<CategoryContent> allCategory = [];
  var response;

  late ItemScrollController itemScrollProductController = ItemScrollController();
  late DraggableScrollableController scrollController =
  DraggableScrollableController();
  PageController pageController = PageController();
  double percent = 0.0;
  double hight = 0;
  double splashRadius = 3;
  double borderRadius = 20;
  bool isRisen = false;
  double minScroll = 0.4;
  double maxScroll = 0.9;
  double initScrol = 0.4;
  Location location = Location();
  String currentAddress = 'Not initialized yet';
  LocationData? locationData;
  var currentPoint;
  double? distanceImMeter = 0.0;
  double? distanceImMeter2 = 0.0;
  late YandexMapController yandexController;
  late AnimationController animController;
  late Animation<double> animation;
  late Animation<Color?> animationColor;
  bool colorBool = true;
  bool? isLocIcon;
  int duration = 600;

  var motiFirstPoint = const Point(latitude: 41.2995, longitude: 69.2401);
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
    update();
  }

  Future<void> getAddressFromLatLong(latitude, longitude)async {
    List<GeoCode.Placemark?> placeMarks = await GeoCode.placemarkFromCoordinates(latitude!, longitude!);
    GeoCode.Placemark place = placeMarks[0]!;
    currentAddress = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    update();
  }
  onCameraPositionChanged(CameraPosition cameraPosition,CameraUpdateReason cameraUpdateReason, bool bullet){
    currentPoint = cameraPosition.target;
    update();

    colorBool = bullet;
    if(bullet == false && !animController.isAnimating){
      animController.repeat(reverse: true);
    }

    if(bullet){
      Future.delayed(const Duration(milliseconds: 1000),(){
        animController.stop();
      });
      return;
    }
    //print(currentAddress);
  }

  onMapCreated(YandexMapController controller) async{
    yandexController = controller;
    await yandexController.getCameraPosition().then((value) async{
      await yandexController.moveCamera(
          CameraUpdate.newCameraPosition(  CameraPosition(
              target:
              locationData != null ?
              Point(latitude:
                   locationData!.latitude!
                 , longitude: locationData!.longitude!)
              :  const Point(latitude:
                   41.2995,
                  longitude:  69.2401),
              zoom: 17.0)));
      animController.forward();
    });
  }
  Future getTheDistance() async {
    distanceImMeter = Geolocator.distanceBetween(
      currentPoint.latitude,
      currentPoint.longitude,
        41.299863,
        69.272839
    );
    distanceImMeter2 = Geolocator.distanceBetween(
        currentPoint.latitude,
        currentPoint.longitude,
        41.310168,
        69.287344
    );

    var distance = (distanceImMeter!.round().toInt()/1000).toStringAsFixed(1);
    var distance2 = (distanceImMeter2!.round().toInt()/1000).toStringAsFixed(1);
    print("Distance from Moti 1(Oybek metro) is : $distance\nDistance from Moti 2 is : $distance2\n ");

  }

  void getProducts() async{
    String? resAllProducts = await network.GET(api.baseUrl,api.allProducts);
    if(resAllProducts != null){
      response = jsonDecode(resAllProducts);
      allProducts.addAll(productListFromJson(resAllProducts));
      print(allProducts.last.imageUrl);
      update();
    }
  }
  void getCategory() async{
    String? resAllCategory = await network.GET(api.baseUrl, api.allCategory);
    if(resAllCategory != null){
      response = jsonDecode(resAllCategory);
      var res = AllCategory.fromJson(response);
      allCategory.addAll(res.content!);
      print(allCategory.length);
      update();
    }
  }
  List<MotiProductModel> products = List.generate(10, (index) => MotiProductModel(name: 'name: $index', isLiked: index.isEven, price: index * 10000, title: 'title: $index', imagePath: 'https://images.unsplash.com/photo-1657299171251-2a61ea716fbf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),);
  jumpToCategoryProduct(int categoryID){
   int? test = allProducts.indexWhere((element) => element.categoryId == categoryID);
   print(test);
   if(test != -1){
     itemScrollProductController.scrollTo(
         index: test,
         alignment: 0.1,
         duration: const Duration(milliseconds: 500),
         curve: Curves.linear);
   }else{
     return;
   }
  }
  @override
  void onInit() {
    getPosition();
    animController = AnimationController(
      vsync: this,
      duration:  Duration(milliseconds: duration),
    );

    animation = Tween<double>(
      begin: 60,
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
    scrollController.dispose();
    super.onClose();
  }

}

