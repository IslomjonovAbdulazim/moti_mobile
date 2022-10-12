import 'package:flutter/material.dart';
import 'package:moti/models/parsing/history_model.dart';
import 'package:moti/utils/colors.dart';
import 'package:moti/utils/dimensions.dart';
import 'package:moti/utils/text_utils/header_text.dart';
import 'package:moti/utils/text_utils/subHeader_text.dart';

class HistoryItems extends StatelessWidget {
  final HistoryModel item;

  const HistoryItems({
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
        children: [
          Container(
            width: Dimensions.historyAndFavouriteImageWidth,
            decoration: const BoxDecoration(
              color: Colors.red,
              // image: DecorationImage(
              //   fit: BoxFit.cover,
              //   image: NetworkImage(item.imagePath),
              // ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HeaderText(
                  text: item.address.toString(),
                  fontWeight: FontWeight.w500,
                  color: AppColors.instance.mainText,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SubHeaderText(
                      text: "${item.price} sum",
                      color: AppColors.instance.subtitleText,
                    ),
                    const SizedBox(width: 10),
                    SubHeaderText(
                      text: "tushunmadim",
                      color: AppColors.instance.cancelAndQuantity,
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      BorderSide(
                          width: 2, color: AppColors.instance.buttonRadius),
                    ),
                  ),
                  child: SubHeaderText(
                    text: item.status.toString(),
                    color: item.status == "ORDERED"
                        ? AppColors.instance.cancelAndQuantity
                        : AppColors.instance.subtitleText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
