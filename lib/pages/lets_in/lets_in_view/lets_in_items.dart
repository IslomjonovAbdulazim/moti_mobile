import 'package:flutter/material.dart';
import 'package:moti/models/using/text_field_model.dart';
import 'package:moti/utils/colors.dart';

import '../../../utils/dimensions.dart';

class LetsInItem extends StatelessWidget {
  final TextFieldModel item;

  const LetsInItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.checkOutItemPadding,
      ),
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.checkOutItemPaddingBetween,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.checkOutItemRadius),
      ),
      // height: Dimensions.checkOutItemHeight,
      child: TextFormField(
        controller: item.controller,
        validator: item.validator,
        inputFormatters: item.formatters,
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
            borderRadius: BorderRadius.circular(Dimensions.checkOutItemRadius),
          ),
          fillColor: AppColors.instance.textFieldBG,
          hintText: item.hintText,
          hintStyle: item.hintStyle,
        ),
      ),
    );
  }
}
