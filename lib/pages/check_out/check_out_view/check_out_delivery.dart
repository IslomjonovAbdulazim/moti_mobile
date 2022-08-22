import 'package:flutter/material.dart';
import 'package:moti/models/using/text_field_model.dart';

import 'check_out_items.dart';
import 'check_out_map.dart';

class CheckOutDelivery extends StatelessWidget {
  final List<TextFieldModel> textFields;
  final List<TextFieldModel> textFields2;

  const CheckOutDelivery({
    Key? key,
    required this.textFields,
    required this.textFields2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        for (int i = 0; i < textFields.length; i++) ...{
          if (i.isEven) ...{
            CheckOutItems(
              items: textFields.sublist(i, i + 2),
            ),
          },
        },
        const CheckOutMap(),
        ...textFields2.map(
          (item) => CheckOutItem(item: item),
        ),
      ],
    );
  }
}
