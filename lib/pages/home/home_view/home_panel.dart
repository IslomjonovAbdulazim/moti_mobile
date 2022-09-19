import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moti/pages/home/home_controller.dart';
import 'package:moti/pages/home/home_view/single_product.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePanel extends StatelessWidget {
  final ScrollController controller;
  const HomePanel({Key? key, required this.controller,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
   return CustomScrollView(
     slivers: [
       // SliverAppBar(
       //   leadingWidth: 0,
       //   elevation: 0,
       //   backgroundColor: Colors.white,
       //   shape: RoundedRectangleBorder(
       //     borderRadius: BorderRadius.circular(12)
       //   ),
       //   pinned: true,
       //   title:
       //   SizedBox(
       //    height: 20,
       //    child:
       //      ListView.builder(
       //          primary: true,
       //          shrinkWrap: true,
       //          scrollDirection: Axis.horizontal,
       //          itemCount: controller.allCategory.length,
       //          itemBuilder: (BuildContext context, int index){
       //          return Text(controller.allCategory[index].name!, style: TextStyle(color: Colors.black),);
       //      }),
       //     ),
       //    ),
       SliverToBoxAdapter(
         child: SingleChildScrollView(
           padding: EdgeInsets.only(top: 50),
           child: ScrollablePositionedList.builder(
             physics: NeverScrollableScrollPhysics(),
             shrinkWrap: true,
             addAutomaticKeepAlives: true,
             itemScrollController: controller.itemScrollProductController,
             itemCount: controller.allProducts.length,
             //itemPositionsListener: ,
             itemBuilder: (BuildContext context, int index) {
               return SingleProduct(item: controller.allProducts[index]);
             },

           ),
         ),

       )
     ],
   );
      }
    );
  }
}



