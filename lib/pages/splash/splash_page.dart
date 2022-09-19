import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moti/pages/home/home_controller.dart';
import 'package:moti/pages/home/home_page.dart';
class SplashPage extends StatefulWidget {
  static const String id = "splash_page";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  _initTimer()async{
    var cont = Get.put(HomeController());
    await cont.getPosition();
    cont.getProducts();
    cont.getCategory();
    Timer(const Duration(seconds: 3),(){
      Get.offAll(()=>const HomePage());
    });
  }
  @override
  void initState() {
    super.initState();
    _initTimer();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Center(
              child: Image.asset('assets/images/splash3.png', height: 200, width: 200,),
            ),
          ],
        ),
      ),
    );
  }
}