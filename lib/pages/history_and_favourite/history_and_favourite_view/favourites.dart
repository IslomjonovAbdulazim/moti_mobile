import 'package:flutter/material.dart';
import 'package:moti/models/parsing/moti_product_model.dart';
import 'package:moti/pages/history_and_favourite/history_and_favourite_view/favourite_items.dart';

import '../../../models/parsing/moti_order_model.dart';
import '../../../utils/dimensions.dart';
import 'history_items.dart';

class Favourites extends StatelessWidget {
  final List<MotiProductModel> favourites;

  const Favourites({
    Key? key,
    required this.favourites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(Dimensions.historyAndFavouriteItemPadding),
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: Dimensions.historyAndFavouriteItemSpace,
      ),
      itemCount: favourites.length,
      itemBuilder: (BuildContext context, int index) => FavouriteItems(
        item: favourites[index],
      ),
    );
  }
}
