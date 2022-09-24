import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moti/pages/profile/profile_controller.dart';
import 'package:moti/services/db_service.dart';
import 'package:moti/utils/colors.dart';
import 'package:moti/utils/dimensions.dart';
import 'package:moti/utils/keys.dart';
import 'package:moti/utils/text_utils/content_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return  Scaffold(
          backgroundColor: AppColors.instance.bg,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: false,
            title: Text(
              "Profile",
              style: TextStyle(
                color: AppColors.instance.mainText,
                fontSize: Dimensions.font20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Dimensions.profileInfoRadius,
              ),
              color: AppColors.instance.motiProductItemHomeBG,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                  controller.signInInfo.length,
                  (index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ContentText(
                          text: controller.signInInfo[index],
                          color: AppColors.instance.mainText,
                          size: Dimensions.font20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (index < controller.signInInfo.length - 1)
                        Divider(
                          thickness: 1,
                          color: AppColors.instance.mainText,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
