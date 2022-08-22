import 'package:flutter/material.dart';
import 'package:moti/models/using/radio_model.dart';
import 'package:moti/utils/colors.dart';
import 'package:moti/utils/dimensions.dart';
import 'package:moti/utils/text_utils/header_text.dart';

class PaymentInfoItems extends StatelessWidget {
  final RadioModel info;

  const PaymentInfoItems({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        splashRadius: 20,
        // iconSize: Dimensions.paymentInfoButtonWidth,
        icon: Icon(info.isSelected ? Icons.circle : Icons.circle_outlined),
        onPressed: info.onTap,
        color: info.isSelected
            ? AppColors.instance.selectedRadio
            : AppColors.instance.unselectedRadio,
      ),
      title: HeaderText(
        text: info.text,
        color: info.isSelected
            ? AppColors.instance.selectedRadio
            : AppColors.instance.unselectedRadio,
        size: Dimensions.font20,
      ),
    );
  }
}
