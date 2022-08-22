import 'package:flutter/foundation.dart';

class RadioModel {
  late String text;
  late bool isSelected;
  late VoidCallback onTap;

  RadioModel({
    required this.text,
    this.isSelected = false,
    required this.onTap,
  });
}
