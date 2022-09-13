import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class TextFieldModel {
  late String hintText;
  late TextStyle hintStyle;
  late TextEditingController controller;
  late List<TextInputFormatter>? formatters;
  late String? Function(String?)? validator;

  TextFieldModel({
    required this.controller,
    required this.hintStyle,
    required this.hintText,
    this.formatters,
    required this.validator,
  });
}
