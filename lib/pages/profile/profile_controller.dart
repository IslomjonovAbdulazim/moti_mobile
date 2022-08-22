import 'package:get/get.dart';

class ProfileController extends GetxController {
  late List<String> signInInfo;
  late List<String> info;

  @override
  void onInit() {
    super.onInit();
    _initFields();
  }

  void _initFields() {
    signInInfo = List.generate(6, (index) => 'sign in info: $index');
    info = List.generate(3, (index) => "info: $index");
  }
}