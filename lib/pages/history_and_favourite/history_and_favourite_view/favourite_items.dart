import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moti/models/parsing/moti_product_model.dart';
import 'package:moti/utils/colors.dart';
import 'package:moti/utils/dimensions.dart';
import 'package:moti/utils/icons.dart';
import 'package:moti/utils/text_utils/header_text.dart';
import 'package:moti/utils/text_utils/subHeader_text.dart';

class FavouriteItems extends StatelessWidget {
  final MotiProductModel item;

  const FavouriteItems({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.historyAndFavouriteItemHeight,
      width: Dimensions.historyAndFavouriteItemWidth,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.instance.motiProductItemHomeBG,
        borderRadius: BorderRadius.circular(
          Dimensions.historyAndFavouriteItemRadius,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Dimensions.historyAndFavouriteImageWidth,
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderText(
                        text: item.title,
                        color: AppColors.instance.mainText,
                        size: Dimensions.font20,
                        fontWeight: FontWeight.w500,
                      ),
                      SubHeaderText(
                        text: item.name,
                        size: Dimensions.font16,
                        color: AppColors.instance.secondaryText,
                      ),
                      SubHeaderText(
                        text: item.price.toString(),
                        size: Dimensions.font16,
                        color: AppColors.instance.secondaryText,
                      ),
                      const SizedBox.shrink(),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          Ic.instance.filledHeart,
                          color: AppColors.instance.liked,
                          height: Dimensions.historyAndFavouriteHeartHeight,
                          width: Dimensions.historyAndFavouriteHeartWidth,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          Ic.instance.cart,
                          height: Dimensions.historyAndFavouriteCartHeight,
                          width: Dimensions.historyAndFavouriteCartWidth,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
