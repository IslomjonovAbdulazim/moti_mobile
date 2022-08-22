import 'package:get/get.dart';
import 'package:moti/models/using/radio_model.dart';

class PaymentInfoController extends GetxController {
  late List<RadioModel> radios;

  @override
  void onInit() {
    super.onInit();
    _initFields();
  }

  void _initFields() {
    radios = List.generate(
      10,
      (index) => RadioModel(
        text: 'text: $index',
        onTap: () {
          setRadio = index;
        },
      ),
    );
  }

  // setters
  set setRadio(int newIndex) {
    for (int i = 0; i < radios.length; i++) {
      radios[i].isSelected = (i == newIndex);
    }
    update();
  }
}
