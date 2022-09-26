import 'package:flutter/material.dart';
import 'package:moti/utils/colors.dart';
import 'package:moti/utils/dimensions.dart';

abstract class _Styles {

}

class TextStyles extends _Styles {
  TextStyles._();

  static TextStyles textStyles = TextStyles._();

  TextStyle productMain = TextStyle(color: AppColors.instance.mainText,fontWeight: FontWeight.w500, fontSize: Dimensions.font20, fontFamily: "Poppins");

  TextStyle productSubtitle = TextStyle(color: AppColors.instance.subtitleText, fontSize: Dimensions.font16);

  TextStyle productPrice = TextStyle(color: AppColors.instance.subtitleText, fontSize: Dimensions.font16);
}