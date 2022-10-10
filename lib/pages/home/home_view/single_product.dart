import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:moti/models/parsing/product_model.dart';
import 'package:moti/pages/order/order_controller.dart';
import 'package:moti/utils/colors.dart';
import 'package:moti/utils/dimensions.dart';
import 'package:moti/utils/icons.dart';
import 'package:moti/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:moti/utils/text_utils/subHeader_text.dart';


class SingleProduct extends StatelessWidget {
  final Product item;
  const SingleProduct({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orderController = Get.put(OrderController());
    return Container(
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
                  child: CachedNetworkImage( imageUrl: item.imageUrl!, fit: BoxFit.cover,))),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: Dimensions.height8, horizontal: Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      item.productName!.length >20 ?
                      SizedBox(
                        width: Dimensions.marqueeWidth,
                        height: Dimensions.font20 + 10,
                        child: Marquee(
                          text: item.productName!,
                          style: TextStyles.textStyles.productMain,
                          blankSpace: Dimensions.width45,
                          velocity: 70,
                          accelerationCurve: Curves.bounceOut,
                          decelerationCurve: Curves.bounceIn,
                          showFadingOnlyWhenScrolling: false,
                          pauseAfterRound: const Duration(seconds: 1),
                        ),
                      ):
                      Text(
                        item.productName!.toString(),
                        style: TextStyles.textStyles.productMain,
                      ),
                      SubHeaderText(text: item.categoryName!,color: Colors.black.withOpacity(0.6),),

                      SubHeaderText(text: item.price!.toStringAsFixed(0),color: Colors.black.withOpacity(0.6),size: Dimensions.font20,),

                      const SizedBox.shrink(),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {

                        },
                        icon: SvgPicture.asset(
                          Ic.instance.heart,
                          height: Dimensions.iconSize24 -2,
                        ),
                        color: AppColors.instance.likeButton,
                      ),
                      GetBuilder<OrderController>(
                        init: OrderController(),
                        builder: (controller) {
                          bool isBooked = controller.checkProduct(item);
                          return IconButton(
                            onPressed: () {
                              !isBooked ?
                              orderController.addToCart(item)
                              :orderController.removeToCart(item);
                            },
                            icon: SvgPicture.asset(
                              isBooked ? Ic.instance.cart2
                              : Ic.instance.cart,
                              height: Dimensions.iconSize29,

                            ),
                          );
                        }
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
