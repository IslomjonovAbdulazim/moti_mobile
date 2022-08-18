import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:moti/pages/home/home_controller.dart';

class DIService {
  static void get init {
    Get.lazyPut(() => HomeController(), fenix: true);
}
}