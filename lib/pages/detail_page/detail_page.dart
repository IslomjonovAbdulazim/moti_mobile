import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moti/utils/colors.dart';
import 'package:moti/utils/text_utils/expandable_text.dart';
import 'package:moti/utils/text_utils/header_text.dart';
import 'package:moti/utils/text_utils/subHeader_text.dart';
import '../../models/parsing/product_model.dart';
import '../../utils/dimensions.dart';
import '../../utils/icons.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({Key? key, required this.product}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top:5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                child: Padding(
                    padding: EdgeInsets.only(left: Dimensions.width20),
                    child: HeaderText(size: Dimensions.font20,text: product.productName!, color: Colors.black,)),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.instance.bg,
            expandedHeight: Dimensions.detailPhotoHeight,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: product.imageUrl!,
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                        SvgPicture.asset(
                          Ic.instance.price,
                          color: Colors.greenAccent,
                          height: Dimensions.iconSize24,
                        ),
                          SizedBox(width: Dimensions.width5,),
                          SubHeaderText(text: product.price!.toString(), color: Colors.greenAccent,)
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        Ic.instance.readyTime,
                        color: Colors.redAccent,
                        height: Dimensions.iconSize16,
                      ),
                      SizedBox(width: Dimensions.width5,),
                      SubHeaderText(text: "45 min", color: Colors.redAccent,)
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: Dimensions.height30, top: Dimensions.height10),
                    child: ExpandableTextWidget(text: product.description!),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Padding(
            padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Container(
                //   padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(Dimensions.radius20),
                //       color: Colors.white
                //   ),
                //   child: Icon(
                //     Icons.favorite,
                //     color: AppColors.instance.selectedBNB,
                //     size: Dimensions.iconSize24,
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius12),
                    color: Colors.greenAccent,
                  ),
                  child: HeaderText(text: "ADD to cart",color: Colors.white,),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
