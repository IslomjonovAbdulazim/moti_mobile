import 'dart:ui';

import 'package:flutter/material.dart';

abstract class _AppColors {
  Color get likeButton;

  Color get cartBG;

  Color get bg;

  Color get motiProductItemHomeBG;

  Color get mainText;

  Color get subtitleText;

  Color get selectedRadio;

  Color get unselectedRadio;

  Color get mainButtonBG;

  Color get textOnTextField;

  Color get selectedBNB;

  Color get unselectedBNB;

  Color get liked;

  Color get tabBarBG;

  Color get currentTabBar;

  Color get buttonRadius;

  Color get repeatAndCanceled;

  Color get cancelAndQuantity;

  Color get secondaryText;

  Color get textFieldBG;

  Color get buttonText;
}

class AppColors extends _AppColors {

  AppColors._();

  static AppColors instance = AppColors._();

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

  @override
  Color get selectedRadio {
    return const Color(0xff0FA958);
  }

  @override
  Color get unselectedRadio {
    return const Color(0xff919191);
  }
  @override
  Color get mainButtonBG {
    return const Color(0xff0FA958);
  }
  @override
  Color get textOnTextField {
    return const Color(0xff0FA958);
  }

  @override
  Color get selectedBNB {
    return const Color(0xff000000);
  }

  @override
  Color get unselectedBNB {
   return const Color(0xff808080);
  }

  @override
  Color get liked {
    return const Color(0xffFF0038);
  }

  @override
  Color get currentTabBar {
    return const Color(0xffF7F7F7);
  }

  @override
  Color get tabBarBG {
    return const Color(0xffEDEDED);
  }

  @override
  Color get buttonRadius {
    return const Color(0xffF7F7F7);
  }

  @override
  Color get repeatAndCanceled {
    return const Color(0xff919191);
  }

  @override
  Color get cancelAndQuantity {
    return const Color(0xffFF0038);
  }

  @override
  Color get secondaryText {
    return Colors.black.withOpacity(.6);
  }

  @override
  Color get textFieldBG {
    return const Color(0xffEEEEEE);
  }

  @override
  Color get buttonText {
    return const Color(0xffFFFFFF);
  }
}