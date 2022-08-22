import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'check_out_controller.dart';
import 'check_out_view/check_out_delivery.dart';
import 'check_out_view/check_out_pick_up.dart';
import 'check_out_view/check_out_tab_bar.dart';
import 'check_out_view/next_button.dart';
import '../../utils/icons.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutController>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: SvgPicture.asset(
                Ic.instance.navigateBack,
                height: 30,
              ),
              splashRadius: 25,
              onPressed: () {},
            ),
            title: CheckOutTabBar(
              currentPageIndex: controller.getCurrentPageIndex,
              onTap: () {
                controller.setCurrentPageIndex =
                controller.getCurrentPageIndex == 1 ? 0 : 1;
              },
            ),
            // HeaderText(
            //   text: 'Checkout',
            //   color: AppColors.instance.mainText,
            //   fontWeight: FontWeight.bold,
            //   size: Dimensions.font20,
            // ),
          ),
          body: PageView(
            onPageChanged: (int newIndex) {
              controller.setCurrentPageIndex = newIndex;
            },
            controller: controller.pageController,
            children: [
              CheckOutDelivery(
                textFields: controller.textFields,
                textFields2: controller.textFields2,
              ),
              CheckOutPickUp(
                textFields: controller.textFields,
                textFields2: controller.textFields2,
              ),
            ],
          ),
          floatingActionButton: const CheckOutNextButton(),
        );
      },
    );
  }
}
