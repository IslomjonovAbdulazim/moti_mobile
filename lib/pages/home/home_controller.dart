import 'package:get/get_state_manager/get_state_manager.dart';

import '../../models/parsing/moti_product_model.dart';

class HomeController extends GetxController {
  List<MotiProductModel> products = List.generate(10, (index) => MotiProductModel(name: 'name: $index', isLiked: index.isEven, price: index * 10000, title: 'title: $index', imagePath: 'https://unsplash.com/photos/Xlo7N1ctmZc'),);
}