import 'package:flutter/material.dart';
import 'package:moti/models/parsing/history_model.dart';
import 'package:moti/utils/colors.dart';
import 'package:moti/utils/text_utils/subHeader_text.dart';

import '../../../models/parsing/moti_order_model.dart';
import '../../../utils/dimensions.dart';
import 'history_items.dart';

class Histories extends StatelessWidget {
  final List<HistoryModel> orders;
  DateTime? time;

  Histories({
    Key? key,
    required this.orders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(Dimensions.historyAndFavouriteItemPadding),
      separatorBuilder: (BuildContext context, int index) {
        if (time?.day == orders[index].deliveryTime) {
          return SizedBox(
            height: Dimensions.historyAndFavouriteItemSpace,
          );
        } else {
          // time = ;
          return Container(
            alignment: Alignment.center,
            height: Dimensions.historyAndFavouriteItemSpaceWithDate,
            child: SubHeaderText(
              text: orders[index].deliveryTime.toString() ?? "No time",
              color: AppColors.instance.secondaryText,
            ),
          );
        }
      },
      itemCount: orders.length,
      itemBuilder: (BuildContext context, int index) => HistoryItems(
        item: orders[index],
      ),
    );
  }
}
