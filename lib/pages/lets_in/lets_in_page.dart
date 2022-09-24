import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moti/pages/lets_in/lets_in_controller.dart';
import 'package:moti/pages/lets_in/lets_in_view/lets_in_tab_bar.dart';
import 'package:moti/utils/colors.dart';
import 'package:moti/utils/dimensions.dart';
import 'package:provider/provider.dart';

import '../../utils/masks.dart';
import 'lets_in_view/lets_in_items.dart';

class LetsInPage extends StatelessWidget {
  LetsInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.instance;
    return GetBuilder<LetsInController>(
      builder: (controller) {
        return Form(
          key: controller.formKey,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: LetsInTabBar(
                onTap: () {
                  controller.setCurrentPageIndex =
                      controller.getCurrentPageIndex == 0 ? 1 : 0;
                },
                currentPageIndex: controller.getCurrentPageIndex,
              ),
              bottom: PreferredSize(
                preferredSize:
                    Size.fromHeight(Dimensions.latsInBetweenTabChildren),
                child: const SizedBox.shrink(),
              ),
            ),
            body: PageView(
              controller: controller.pageController,
              onPageChanged: (int newIndex) {
                controller.setCurrentPageIndex = newIndex;
              },
              physics: const BouncingScrollPhysics(),
              children: [
                ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ...controller.itemsSignIn.map((item) {
                      if (controller.isSMSCodeSignIn ||
                          item.hintText != "Sms code") {
                        return LetsInItem(
                          item: item,
                        );
                      }
                      return const SizedBox.shrink();
                    }).toList(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: Dimensions.height30),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          primary: colors.mainButtonBG,
                          fixedSize: const Size.fromHeight(50),
                        ),
                        onPressed: () async {
                          if (!controller.isSMSCodeSignIn) {
                            final p = controller.controllersSignIn[0].text;
                            int phone = 0;
                            for (int i = 0; i < p.length; i++) {
                              if (int.tryParse(p[i]) != null) {
                                phone = 10 * phone + int.parse(p[i]);
                              }
                            }
                            final bl = await controller.doSignIn(
                              phone.toString(),
                            );
                            print(bl);
                          } else {
                            final sms = controller.controllersSignIn[1].text;
                            final p = controller.controllersSignIn[0].text;
                            int phone = 0;
                            for (int i = 0; i < p.length; i++) {
                              if (int.tryParse(p[i]) != null) {
                                phone = 10 * phone + int.parse(p[i]);
                              }
                            }
                            print('sms: $sms,$phone');
                            await controller.verifyCode(phone.toString(), sms);
                          }
                        },
                        child: Text(
                            controller.isSMSCodeSignUp ? "Verify" : "Sing in"),
                      ),
                    ),
                  ],
                ),
                ListView(
                  // key: UniqueKey(),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ...controller.itemsSignUp.map((item) {
                      if (controller.isSMSCodeSignUp ||
                          item.hintText != "Sms code") {
                        return LetsInItem(
                          item: item,
                        );
                      }
                      return const SizedBox.shrink();
                    }).toList(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: Dimensions.height30),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          primary: colors.mainButtonBG,
                          fixedSize: const Size.fromHeight(50),
                        ),
                        onPressed: () async {
                          if (!controller.isSMSCodeSignUp) {
                            final p = controller.controllersSignUp[1].text;
                            final name = controller.controllersSignUp[0].text;
                            int phone = 0;
                            for (int i = 0; i < p.length; i++) {
                              if (int.tryParse(p[i]) != null) {
                                phone = 10 * phone + int.parse(p[i]);
                              }
                            }
                            final bl = await controller.doSignUp(
                              phone.toString(),
                              name,
                            );
                            print(bl);
                          } else {
                            final sms = controller.controllersSignUp[2].text;
                            final p = controller.controllersSignUp[1].text;
                            int phone = 0;
                            for (int i = 0; i < p.length; i++) {
                              if (int.tryParse(p[i]) != null) {
                                phone = 10 * phone + int.parse(p[i]);
                              }
                            }
                            print('sms: $sms,$phone');
                            await controller.verifyCode(phone.toString(), sms);
                          }
                        },
                        child: Text(
                            controller.isSMSCodeSignIn ? "Verify" : "Sing up"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
