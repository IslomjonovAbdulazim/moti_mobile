import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moti/utils/colors.dart';
import 'package:moti/utils/dimensions.dart';

import '../../models/using/text_field_model.dart';

class LetsInController extends GetxController {
  int _currentPageIndex = 0;
  late final PageController pageController;
  late List<TextFieldModel> itemsSignIn;
  late List<TextFieldModel> itemsSignUp;
  late List<TextEditingController> controllersSignIn;
  late List<TextEditingController> controllersSignUp;
  late List<String> hintsSignIn;
  late List<String> hintsSignUp;

  @override
  void onInit() {
    super.onInit();
    _initFields();
  }

  void _initFields() {
    controllersSignIn = List.generate(2, (index) => TextEditingController());
    controllersSignUp = List.generate(3, (index) => TextEditingController());
    hintsSignIn = [
      "Phone Number",
      "Sms code",
    ];
    pageController = PageController();
    hintsSignUp = [
      "Name",
      "Phone Number",
      "Sms code",
    ];
    itemsSignIn = List.generate(
      controllersSignIn.length,
      (index) => TextFieldModel(
        controller: controllersSignIn[index],
        hintStyle: TextStyle(
          color: AppColors.instance.mainText,
          fontSize: Dimensions.font16,
        ),
        hintText: hintsSignIn[index],
      ),
    );
    itemsSignUp = List.generate(
      controllersSignUp.length,
      (index) => TextFieldModel(
        controller: controllersSignUp[index],
        hintStyle: TextStyle(
          color: AppColors.instance.mainText,
          fontSize: Dimensions.font16,
        ),
        hintText: hintsSignUp[index],
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
