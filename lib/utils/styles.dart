import 'package:flutter/material.dart';
import 'package:moti/utils/colors.dart';

abstract class _Styles {

}

class TextStyles extends _Styles {
  TextStyles._();

  static TextStyles textStyles = TextStyles._();

  TextStyle productMain = TextStyle(color: AppColors.instance.mainText, fontSize: 25);

  TextStyle productSubtitle = TextStyle(color: AppColors.instance.subtitleText, fontSize: 16);

  TextStyle productPrice = TextStyle(color: AppColors.instance.subtitleText, fontSize: 16);
}