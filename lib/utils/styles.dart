import 'package:flutter/material.dart';
import 'package:moti/utils/colors.dart';

abstract class _Styles {

}

class TextStyles extends _Styles {
  TextStyles._();

  static TextStyles textStyles = TextStyles._();

  TextStyle productMain = TextStyle(color: AppColors.appColors.mainText, fontSize: 25);

  TextStyle productSubtitle = TextStyle(color: AppColors.appColors.subtitleText, fontSize: 16);

  TextStyle productPrice = TextStyle(color: AppColors.appColors.subtitleText, fontSize: 16);
}