import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moti/pages/check_out/check_out_controller.dart';

import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';

class CheckOutBranch extends StatelessWidget {
  const CheckOutBranch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = AppColors.instance;
    return GetBuilder<CheckOutController>(builder: (controller) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.checkOutItemPadding,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: Dimensions.checkOutItemPadding,
          vertical: Dimensions.checkOutItemPaddingBetween,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.checkOutItemRadius),
          color: c.textFieldBG,
        ),
        child: DropdownButton<String>(
          isExpanded: true,
          value: controller.branch,
          hint: const Text("Select branch"),
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          elevation: 16,
          focusColor: c.textFieldBG,
          dropdownColor: c.textFieldBG,
          borderRadius: BorderRadius.circular(Dimensions.checkOutItemRadius),
          style: const TextStyle(color: Colors.deepPurple),
          underline: const SizedBox.shrink(),
          onChanged: (String? value) {
            controller.branch = value;
          },
          items:
              controller.branches.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  color: c.mainText,
                  fontSize: Dimensions.font16,
                ),
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}
