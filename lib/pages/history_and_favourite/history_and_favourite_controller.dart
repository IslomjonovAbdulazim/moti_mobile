import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moti/models/parsing/favourites_model.dart';
import 'package:moti/models/parsing/history_model.dart';
import 'package:moti/models/parsing/moti_order_model.dart';
import 'package:moti/models/parsing/moti_product_model.dart';
import 'package:moti/services/apis.dart';
import 'package:moti/services/db_service.dart';
import 'package:moti/services/network_service.dart';
import 'package:moti/utils/enums.dart';
import 'package:moti/utils/keys.dart';

import '../../main.dart';

class HistoryAndFavouriteController extends GetxController {
  List<HistoryModel> orders = [];
  FavouritesModel favourites = FavouritesModel(body: []);
  late PageController pageController;
  int _currentPageIndex = 0;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    _initFields();
  }

  void doLike(int id) async {
    isLoading = true;
    update();
    await network.POST(
      "${api.addFavourite}$id",
      null,
      myHeader: network.headersWithToken(token),
    );
    await getFavourite();
    isLoading = false;
    update();
  }

  Future<void> getFavourite() async {
    final db = DBService.instance;
    final k = Keys.instance;
    final network = NetworkService.instance;
    final api = Apis.instance;
    var token = await db.receive(k.token);
    print('token: $token');
    token =
        "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI5OTg5MzY5ODE4MDMiLCJyb2xlcyI6W3siYXV0aG9yaXR5IjoiUk9MRV9VU0VSIn1dLCJpYXQiOjE2NjUzMDY3NzcsImV4cCI6Mzc2NjUzMDY3Nzd9.EhuickRu0TJVOnFXLzqrDuhFJ5RSiTwhnYhy6KSqZFok8eUuwrr1QJAqqlwAEOtDX4FIfNh5Wt56191xZXuu3Q";
    if (token == null) return null;
    final data = await network.GET(
      api.baseUrl,
      api.getFavourite,
      header: network.headersWithToken(token!),
    );
    if (data == null) return;
    final json = jsonDecode(data);
    favourites =
        FavouritesModel.fromJson(Map<String, dynamic>.from(json as Map));
    print(favourites.toJson());
    update();
  }

  void _initFields() async {
    isLoading = true;
    update();
    getFavourite();
    pageController = PageController(initialPage: _currentPageIndex);
    final data = await network.GET(
      api.baseUrl,
      api.getHistory,
      header: network.headersWithToken(token),
    );
    if (data != null) {
      List jsonData = jsonDecode(data);
      orders = jsonData.map((json) => HistoryModel.fromJson(json)).toList();
    }
    isLoading = false;
    update();
  }

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
