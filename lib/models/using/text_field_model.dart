import 'package:flutter/widgets.dart';

class TextFieldModel {
  late String hintText;
  late TextStyle hintStyle;
  late TextEditingController controller;

  TextFieldModel({
    required this.controller,
    required this.hintStyle,
    required this.hintText,
  });
}
