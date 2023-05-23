import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/index.dart';
import '../controllers/my_subscription_controller.dart';

class MySubscriptionView extends GetView<MySubscriptionController> {
  const MySubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: paddingOnly(left: 20.kw, right: 20.kw, top: 60.kh),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: CommonImageView(
                      height: 30.kh,
                      width: 30.kh,
                      fit: BoxFit.contain,
                      svgPath: ImageConstant.svgRoundedBack,
                    ),
                  ),
                ),
                16.kwidthBox,
                LocaleKeys.my_profile_my_subscription.tr.text600(20.kh,
                    textAlign: TextAlign.center,
                    color: const Color(0xff077335)),
              ],
            ),
          ),
          24.kheightBox,
          Padding(
            padding: 20.paddingHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                EvStationRoundedBox(
                    color: const Color(0xffF0F0F0),
                    child: Padding(
                      padding:
                          paddingSymmetric(horizontal: 20.kw, vertical: 15.kh),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              LocaleKeys.my_subscription_star_membership.tr
                                  .text600(16.kh),
                              8.kwidthBox,
                              CommonImageView(
                                height: 24.kh,
                                width: 24.kh,
                                svgPath: ImageConstant.svgVerifiedCheck,
                              )
                            ],
                          ),
                          10.kheightBox,
                          LocaleKeys.my_subscription_plan.tr
                              .text400(14.kh, color: const Color(0xff4D4D4D)),
                          4.kheightBox,
                          '\$9.99/ ${LocaleKeys.make_payment_month.tr}'
                              .text500(16.kh),
                          10.kheightBox,
                          LocaleKeys.my_subscription_next_billing_date.tr
                              .text400(14.kh, color: const Color(0xff4D4D4D)),
                          4.kheightBox,
                          'May 2023'.text500(16.kh),
                        ],
                      ),
                    )),
                16.kheightBox,
                LocaleKeys.my_subscription_youre_subscription_is.tr
                    .text500(14.kh)
              ],
            ),
          )
        ],
      ),
    );
  }
}
