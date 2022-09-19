import 'package:get/get.dart';
import 'package:moti/pages/check_out/check_out_controller.dart';
import 'package:moti/pages/history_and_favourite/history_and_favourite_controller.dart';
import 'package:moti/pages/home/home_controller.dart';
import 'package:moti/pages/lets_in/lets_in_controller.dart';
import 'package:moti/pages/payment_info/payment_info_controller.dart';
import 'package:moti/pages/profile/profile_controller.dart';

class DIService {
  static void get init {
    Get.put(() => HomeController());
    Get.lazyPut(() => CheckOutController(), fenix: true);
    Get.lazyPut(() => HistoryAndFavouriteController(), fenix: true);
    Get.lazyPut(() => LetsInController(), fenix: true);
    Get.lazyPut(() => PaymentInfoController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
  }
}
