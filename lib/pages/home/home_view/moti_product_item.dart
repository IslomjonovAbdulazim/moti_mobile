import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:moti/models/parsing/moti_product_model.dart';
import 'package:moti/utils/colors.dart';
import 'package:moti/utils/icons.dart';
import 'package:moti/utils/styles.dart';

class HomeMotiProductItem extends StatelessWidget {
  final MotiProductModel item;

  const HomeMotiProductItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.appColors.motiProductItemHomeBG,
      ),
      child: Row(
        children: [
          Expanded(flex: 4, child: Image.network(item.imagePath)),
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
                        item.name,
                        style: TextStyles.textStyles.productMain,
                      ),
                      Text(
                        item.title,
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
                          Ic.ic.heart,
                          height: 25,
                        ),
                        color: AppColors.appColors.likeButton,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          Ic.ic.cart,
                          height: 25,
                        ),
                        color: AppColors.appColors.cartBG,
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
