import 'package:flutter/material.dart';
import 'package:moti/utils/dimensions.dart';

class CheckOutMap extends StatelessWidget {
  const CheckOutMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Dimensions.checkOutItemPaddingBetween),
      height: Dimensions.checkOutMapHeight,
      width: Dimensions.checkOutMapWidth,
      decoration: BoxDecoration(
        color: Colors.green,//todo
        borderRadius: BorderRadius.circular(Dimensions.checkOutMapRadius),
      ),
    );
  }
}
