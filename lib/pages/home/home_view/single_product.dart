import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:moti/models/parsing/product_model.dart';
import 'package:moti/utils/colors.dart';
import 'package:moti/utils/icons.dart';
import 'package:moti/utils/styles.dart';

class SingleProduct extends StatelessWidget {
  final Product item;
  const SingleProduct({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.instance.motiProductItemHomeBG,
      ),
      child: Row(
        children: [
          Expanded(flex: 4, child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.network(item.imageUrl!, fit: BoxFit.cover,))),
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.id!.toString(),
                        style: TextStyles.textStyles.productMain,
                      ),
                      Text(
                        item.price.toString(),
                        style: TextStyles.textStyles.productSubtitle,
                      ),
                      Text(
                        item.price.toString(),
                        style: TextStyles.textStyles.productPrice,
                      ),
                      const SizedBox.shrink(),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          Ic.instance.heart,
                          height: 25,
                        ),
                        color: AppColors.instance.likeButton,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          Ic.instance.cart,
                          height: 25,
                        ),
                        color: AppColors.instance.cartBG,
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
