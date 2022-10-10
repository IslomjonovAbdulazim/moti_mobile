import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController{
  int currentPage = 0;

  void onPageChanged(int index) {
    currentPage = index;
    update();
  }
}
