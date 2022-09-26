import 'package:flutter/material.dart';
import 'package:moti/models/using/text_field_model.dart';
import 'package:moti/utils/colors.dart';

import '../../../utils/dimensions.dart';

class CheckOutItems extends StatelessWidget {
  final List<TextFieldModel> items;

  const CheckOutItems({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(items[0].hintText);
    print(items[1].hintText);
    print(items[0].controller.text);
    print(items[1].controller.text);
    return Row(
      children: items
          .map(
            (item) => Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.checkOutItemPadding,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: Dimensions.checkOutItemPaddingBetween,
                ),
                height: Dimensions.checkOutItemHeight,
                width: Dimensions.checkOutItemWidth,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.checkOutItemRadius),
                ),
                child: TextField(
                  controller: item.controller,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    fontSize: Dimensions.font16,
                    color: AppColors.instance.textOnTextField,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.circular(Dimensions.checkOutItemRadius),
                    ),
                    fillColor: AppColors.instance.textFieldBG,
                    hintText: item.hintText,
                    hintStyle: item.hintStyle,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class CheckOutItem extends StatelessWidget {
  final TextFieldModel item;
  const CheckOutItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.checkOutItemPadding,
      ),
      height: Dimensions.checkOutItemHeight,
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.checkOutItemPaddingBetween,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(Dimensions.checkOutItemRadius),
      ),
      child: TextField(
        cursorColor: Colors.black,
        style: TextStyle(
          fontSize: Dimensions.font16,
          color: AppColors.instance.textOnTextField,
        ),
        decoration: InputDecoration(
          filled: true,
          contentPadding: const EdgeInsets.only(left: 10),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius:
            BorderRadius.circular(Dimensions.checkOutItemRadius),
          ),
          fillColor: AppColors.instance.textFieldBG,
          hintText: item.hintText,
          hintStyle: item.hintStyle,
        ),
      ),
    );
  }
}
