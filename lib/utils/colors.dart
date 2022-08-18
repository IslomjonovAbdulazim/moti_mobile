import 'dart:ui';

abstract class _AppColors {
  Color get likeButton;

  Color get cartBG;

  Color get bg;

  Color get motiProductItemHomeBG;

  Color get mainText;

  Color get subtitleText;
}

class AppColors extends _AppColors {

  AppColors._();

  static AppColors appColors = AppColors._();

  @override
  Color get cartBG {
    return const Color(0xff6CC66F);
  }

  @override
  Color get likeButton {
    return const Color(0xffFF0000);
  }

  @override
  Color get bg {
    return const Color(0xffF7F7F7);
  }

  @override
  Color get motiProductItemHomeBG {
    return const Color(0xffFFFFFF);
  }

  @override
  Color get mainText {
    return const Color(0xff000000);
  }

  @override
  Color get subtitleText {
    return const Color(0xff666666);
  }

}