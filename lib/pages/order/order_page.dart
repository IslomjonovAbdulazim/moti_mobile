import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:moti/pages/order/order_controller.dart';
import 'package:moti/utils/text_utils/header_text.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../utils/styles.dart';
import '../../utils/text_utils/subHeader_text.dart';
class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orderController = Get.put(OrderController());
    return GetBuilder<OrderController>(
      init: OrderController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            backgroundColor: Colors.white,
            title:  HeaderText(text: "cart".tr, color: Colors.black,),
           leadingWidth: 30,
           leading: GestureDetector(
               onTap: () => Get.back(),
               child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black, size: Dimensions.iconSize24,)),
          ),
          body: ListView.builder(
            itemCount: orderController.orders.orders.length,
            itemBuilder: (context, index) {
              var order = orderController.orders.orders[index];
              return Stack(
                children: [
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.all(Dimensions.height8),
                    height: Dimensions.productItemHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius12),
                      color: AppColors.instance.motiProductItemHomeBG,
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius12),
                              bottomLeft: Radius.circular(Dimensions.radius12),
                            ),
                            child: SizedBox(
                                width: Dimensions.productImageWidth,
                                child: CachedNetworkImage( imageUrl: order.product.imageUrl!, fit: BoxFit.cover,))),
                        Expanded(
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: Dimensions.height8, horizontal: Dimensions.height10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    order.product.productName!.length >20 ?
                                    SizedBox(
                                      width: Dimensions.marqueeWidth,
                                      height: Dimensions.font20 + 10,
                                      child: Marquee(
                                        text: order.product.productName!,
                                        style: TextStyles.textStyles.productMain,
                                        blankSpace: Dimensions.width45,
                                        velocity: 70,
                                        accelerationCurve: Curves.bounceOut,
                                        decelerationCurve: Curves.bounceIn,
                                        showFadingOnlyWhenScrolling: false,
                                        pauseAfterRound: const Duration(seconds: 1),
                                      ),
                                    ) :
                                    Text(
                                      order.product.productName!.toString(),
                                      style: TextStyles.textStyles.productMain,
                                    ),
                                    SubHeaderText(text: order.product.categoryName!,color: Colors.black.withOpacity(0.6),),

                                    SubHeaderText(text: order.product.price!.toStringAsFixed(0),color: Colors.black.withOpacity(0.6), size: Dimensions.font20,),

                                    const SizedBox.shrink(),
                                  ],
                                ),
                                // IconButton(
                                //   onPressed: () {
                                //
                                //   },
                                //   icon: Icon(Icons.highlight_remove),
                                //   color: AppColors.instance.likeButton,
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: (){
                        orderController.removeToCart(order.product, quantity: order.quantity);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: Dimensions.height15, right: Dimensions.width15),
                        child: Icon(Icons.highlight_remove, color: AppColors.instance.likeButton, size: Dimensions.iconSize29,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: Dimensions.height20,
                    right: Dimensions.width15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // #minus
                        GestureDetector(
                          onTap: () => orderController.minus(order),
                          child: Icon(Icons.remove_circle,
                            color: Theme.of(context).primaryColor,
                            size: Dimensions.iconSize29,
                          ),
                        ),
                        const SizedBox(width: 10),

                        // #quantity

                        HeaderText(
                          text: order.quantity.toString(),
                        ),

                        const SizedBox(width: 10),

                        // #plus
                        GestureDetector(
                          onTap: () => orderController.plus(order),
                          child: Icon(Icons.add_circle,
                          color: AppColors.instance.likeButton,
                          size: Dimensions.iconSize29,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          bottomNavigationBar:  Container(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeaderText(text: "total".tr),

                HeaderText(text: "${orderController.orders.total.toStringAsFixed(0)} sum", fontWeight: FontWeight.w600,)
              ],
            ),
          ),
        );
      }
    );
  }
}