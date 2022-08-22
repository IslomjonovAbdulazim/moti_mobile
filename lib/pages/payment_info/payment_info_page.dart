import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moti/pages/payment_info/payment_info_controller.dart';
import 'package:moti/pages/payment_info/payment_info_view/payment_info_button.dart';
import 'package:moti/pages/payment_info/payment_info_view/payment_info_items.dart';
import 'package:moti/utils/colors.dart';
import 'package:moti/utils/dimensions.dart';

class PaymentInfoPage extends StatelessWidget {
  const PaymentInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentInfoController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: false,
            title: Text(
              "Payment info",
              style: TextStyle(
                color: AppColors.instance.mainText,
                fontSize: Dimensions.font20,
              ),
            ),
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ...controller.radios.map(
                (radio) => PaymentInfoItems(info: radio),
              ),
            ],
          ),
          floatingActionButton: const PaymentInfoButton(),
        );
      },
    );
  }
}
