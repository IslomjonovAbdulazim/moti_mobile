import 'package:get/get_state_manager/get_state_manager.dart';

import '../../models/parsing/moti_product_model.dart';

class HomeController extends GetxController {
  List<MotiProductModel> products = List.generate(10, (index) => MotiProductModel(name: 'name: $index', isLiked: index.isEven, price: index * 10000, title: 'title: $index', imagePath: 'https://images.unsplash.com/photo-1657299171251-2a61ea716fbf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),);
}