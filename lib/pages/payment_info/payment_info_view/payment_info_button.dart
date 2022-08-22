import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moti/utils/colors.dart';
import 'package:moti/utils/dimensions.dart';
import 'package:moti/utils/icons.dart';
import 'package:moti/utils/text_utils/header_text.dart';

class PaymentInfoButton extends StatelessWidget {
  const PaymentInfoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
          Dimensions.paymentInfoButtonWidth,
          Dimensions.paymentInfoButtonHeight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Dimensions.checkOutButtonRadius,
          ),
        ),
        primary: AppColors.instance.mainButtonBG,
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeaderText(
            text: "Next",
            color: AppColors.instance.buttonText,
          ),
          const SizedBox(width: 10),
          SvgPicture.asset(Ic.instance.navigateNext),
        ],
      ),
    );
  }
}
