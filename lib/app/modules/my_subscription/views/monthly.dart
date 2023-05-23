import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Monthly extends StatelessWidget {
  List<String> data = [
    LocaleKeys.my_subscription_free_unlimited_in.tr,
    LocaleKeys.my_subscription_share_your_charge.tr,
    LocaleKeys.my_subscription_optimized_media_centre.tr,
    LocaleKeys.my_subscription_earn_50_of.tr,
    LocaleKeys.my_subscription_earn_5_on.tr,
  ];
  Monthly({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LocaleKeys.my_subscription_star_membership.tr
            .text600(20.kh, color: Colors.white),
        24.kheightBox,
        Column(
          children: List.generate(
              data.length,
              (index) => Column(
                    children: [
                      Row(
                        children: [
                          CommonImageView(
                            height: 16.kh,
                            width: 16.kh,
                            svgPath: ImageConstant.svgSuccessTick,
                          ),
                          16.kwidthBox,
                          Expanded(
                              child: data[index]
                                  .text500(14.kh, color: Colors.white))
                        ],
                      ),
                      20.kheightBox
                    ],
                  )),
        )
      ],
    );
  }
}
