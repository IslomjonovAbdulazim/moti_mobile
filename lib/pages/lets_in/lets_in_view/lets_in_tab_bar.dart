import 'package:flutter/material.dart';
import 'package:moti/utils/colors.dart';
import 'package:moti/utils/dimensions.dart';
import 'package:moti/utils/text_utils/content_text.dart';

class LetsInTabBar extends StatelessWidget {
  final int currentPageIndex;
  final VoidCallback onTap;

  const LetsInTabBar({
    Key? key,
    required this.currentPageIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Dimensions.checkOutItemPaddingBetween * 2),
      height: Dimensions.checkOutTabBarHeight,
      width: Dimensions.checkOutTabBarWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.checkOutTabBarRadius),
        color: AppColors.instance.tabBarBG,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentPageIndex == 0) ...{
            _MakeButton(
              isCurrent: true,
              onTap: onTap,
              text: "Sign in",
            ),
            _MakeButton(
              isCurrent: false,
              onTap: onTap,
              text: "Sign up",
            ),
          } else ...{
            _MakeButton(
              isCurrent: false,
              onTap: onTap,
              text: "Sign in",
            ),
            _MakeButton(
              isCurrent: true,
              onTap: onTap,
              text: "Sign up",
            ),
          },
        ],
      ),
    );
  }
}

class _MakeButton extends StatelessWidget {
  final bool isCurrent;
  final VoidCallback onTap;
  final String text;

  const _MakeButton({
    Key? key,
    required this.isCurrent,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isCurrent ? null : onTap,
      child: Container(
        width: Dimensions.checkOutSelectedTabBarWidth,
        height: Dimensions.checkOutSelectedTabBarHeight,
        alignment: Alignment.center,
        margin: EdgeInsets.all(Dimensions.checkOutTabBarPadding),
        decoration: BoxDecoration(
          color: isCurrent ? AppColors.instance.bg : AppColors.instance.tabBarBG,
          borderRadius: BorderRadius.circular(
            Dimensions.checkOutTabBarSelectedRadius,
          ),
        ),
        child: ContentText(
          text: text,
          color: AppColors.instance.mainText,
        ),
      ),
    );
  }
}
