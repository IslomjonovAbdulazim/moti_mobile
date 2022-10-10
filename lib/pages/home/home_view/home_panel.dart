import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moti/pages/home/home_controller.dart';
import 'package:moti/pages/home/home_view/single_product.dart';
import 'package:moti/utils/dimensions.dart';
import 'package:moti/utils/my_behaviour.dart';
import 'package:moti/utils/text_utils/header_text.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePanel extends StatelessWidget {
  ScrollController controller = ScrollController();
  HomePanel({Key? key, required this.controller,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
   return ScrollConfiguration(
     behavior: MyBehavior(),
     child: controller.filteredProducts.isNotEmpty ? ScrollablePositionedList.builder(
       physics: const ClampingScrollPhysics(),
       padding: EdgeInsets.only(top: Dimensions.height40),
       itemScrollController: controller.itemScrollProductController,
       shrinkWrap: true,
       itemPositionsListener: controller.itemPositionsListener,
       addAutomaticKeepAlives: true,
       itemCount: controller.filteredProducts.length,
       itemBuilder: (BuildContext context, int index) {
         return GestureDetector(
             onTap: (){
               controller.openDetailPage(controller.filteredProducts[index], context);
             },
             child: SingleProduct(item: controller.filteredProducts[index]));
       },
     ) : Padding(
       padding:  EdgeInsets.symmetric(vertical: Dimensions.checkOutMapHeight),
       child: HeaderText(text: "No element found", textAlign: TextAlign.center,),
     ),
   );
      }
    );
  }
}



