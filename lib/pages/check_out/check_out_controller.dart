import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moti/models/using/text_field_model.dart';
import 'package:moti/services/db_service.dart';
import 'package:moti/utils/colors.dart';
import 'package:moti/utils/keys.dart';

import '../../utils/dimensions.dart';

class CheckOutController extends GetxController {
  bool? isLoading;
  late List<TextFieldModel> textFields;
  late List<TextFieldModel> textFields2;
  late List<TextFieldModel> textFieldsPickUp;
  late List<TextFieldModel> textFields2PickUp;
  late List<String> hints;
  late List<String> hints2;
  late List<String> hintsPickUp;
  late List<String> hints2PickUp;
  late List<TextEditingController> controllers;
  late List<TextEditingController> controllers2;
  late List<TextEditingController> controllersPickUp;
  late List<TextEditingController> controllers2PickUp;
  int _currentPageIndex = 0;
  late PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    _initFields();
  }

  void _initFields() async {
    isLoading = true;
    update();
    final db = DBService.instance;
    final keys = Keys.instance;
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
    hintsPickUp = [
      "Name",
      "Phone number",
    ];
    hints2PickUp = [
      "Branch",
      "Comments",
      "On time",
    ];
    late String? name;
    late String? phone;
    await db.receive(keys.name).then((value) => name = value);
    await db.receive(keys.phoneNumber).then((value) => phone = value);
    print(name);
    print(phone);
    controllers2 = List.generate(
      2,
      (index) => TextEditingController(),
    );
    controllers = List.generate(
      hints.length,
      (index) => TextEditingController(
        text: index == 0
            ? name
            : index == 1
                ? phone
                : null,
      ),
    );
    controllers2PickUp = List.generate(
      hints2PickUp.length,
      (index) => TextEditingController(),
    );
    controllersPickUp = List.generate(
      hintsPickUp.length,
      (index) => TextEditingController(
        text: index == 0
            ? name
            : index == 1
                ? phone
                : null,
      ),
    );
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
    textFieldsPickUp = List.generate(
      hintsPickUp.length,
      (index) => TextFieldModel(
        validator: ((p0) {
          return null;
        }),
        controller: controllersPickUp[index],
        hintStyle: TextStyle(
          color: AppColors.instance.mainText,
          fontSize: Dimensions.font16,
        ),
        hintText: hintsPickUp[index],
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
    textFields2PickUp = List.generate(
      hints2PickUp.length,
      (index) => TextFieldModel(
        validator: (p0) {
          return null;
        },
        controller: controllers2PickUp[index],
        hintStyle: TextStyle(
          color: AppColors.instance.mainText,
          fontSize: Dimensions.font16,
        ),
        hintText: hints2PickUp[index],
      ),
    );
    isLoading = false;
    update();
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
