import 'package:moti/utils/enums.dart';

class MotiOrderModel {
  late DateTime time;
  late String title;
  late int price;
  late int quantity;
  late String imagePath;
  late EnumOrderTypes type;

  MotiOrderModel({
    required this.title,
    required this.price,
    required this.time,
    required this.quantity,
    required this.type,
    required this.imagePath,
  });
}
