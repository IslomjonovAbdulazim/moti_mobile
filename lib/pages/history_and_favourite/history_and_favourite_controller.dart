import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moti/models/parsing/moti_order_model.dart';
import 'package:moti/models/parsing/moti_product_model.dart';
import 'package:moti/utils/enums.dart';

class HistoryAndFavouriteController extends GetxController {
  late List<MotiOrderModel> orders;
  late List<MotiProductModel> favourites;
  late PageController pageController;
  int _currentPageIndex = 1;

  @override
  void onInit() {
    super.onInit();
    _initFields();
  }

  void _initFields() {
    pageController = PageController(initialPage: _currentPageIndex);
    favourites = List.generate(
      10,
      (index) => MotiProductModel(
        imagePath: "",
        isLiked: true,
        name: "name: $index",
        title: "title: $index",
        price: index * 1000,
      ),
    );
    orders = List.generate(
        10,
        (index) => MotiOrderModel(
            title: 'title: $index',
            price: index * 1000,
            time: DateTime(20022, 2, index.isEven ? index : index + 1),
            quantity: index,
            type: index % 5 == 0
                ? EnumOrderTypes.CANCELED
                : index.isEven
                    ? EnumOrderTypes.ON_GOING
                    : EnumOrderTypes.COMPLETED,
            imagePath:
                "https://images.unsplash.com/photo-1599229526921-4f29d42b0b41?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8d2F0ZXJmcm9udHxlbnwwfHwwfHw%3D&w=1000&q=80"));
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
