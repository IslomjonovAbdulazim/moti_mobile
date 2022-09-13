import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moti/models/using/text_field_model.dart';
import 'package:moti/utils/colors.dart';

import '../../utils/dimensions.dart';

class CheckOutController extends GetxController {
  late List<TextFieldModel> textFields;
  late List<TextFieldModel> textFields2;
  late List<String> hints;
  late List<String> hints2;
  late List<TextEditingController> controllers;
  late List<TextEditingController> controllers2;
  int _currentPageIndex = 0;
  late final PageController pageController;

  @override
  void onInit() {
    super.onInit();
    _initFields();
  }

  void _initFields() {
    pageController = PageController();
    hints = [
      "Name",
      "Phone Number",
      "District",
      "Street",
      "Home",
      "Entrance",
      "Floor",
      "Home Number",
    ];
    hints2 = [
      "Comments",
      "On time",
    ];
    controllers2 = List.generate(2, (index) => TextEditingController());
    controllers =
        List.generate(hints.length, (index) => TextEditingController());
    textFields = List.generate(
      hints.length,
      (index) => TextFieldModel(
        validator: ((p0) {
          return null;
        }),
        controller: controllers[index],
        hintStyle: TextStyle(
          color: AppColors.instance.mainText,
          fontSize: Dimensions.font16,
        ),
        hintText: hints[index],
      ),
    );
    textFields2 = List.generate(
      hints2.length,
      (index) => TextFieldModel(
        validator: (p0) {
          return null;
        },
        controller: controllers2[index],
        hintStyle: TextStyle(
          color: AppColors.instance.mainText,
          fontSize: Dimensions.font16,
        ),
        hintText: hints2[index],
      ),
    );
  }

  //getters
  int get getCurrentPageIndex => _currentPageIndex;

  //setters
  set setCurrentPageIndex(int newIndex) {
    _currentPageIndex = newIndex;
    pageController.animateToPage(
      _currentPageIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
    update();
  }
}
