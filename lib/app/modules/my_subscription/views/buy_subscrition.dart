import 'package:ev_station/app/modules/my_subscription/views/monthly.dart';
import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_subscription_controller.dart';

class BuySubscription extends GetView<MySubscriptionController> {
  const BuySubscription({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: Padding(
          padding: paddingOnly(right: 20.kw, left: 20.kw, bottom: 78.kh),
          child: EvStationButton(
            onPressed: () {},
            label: LocaleKeys.my_subscription_subscribe_now.tr,
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            CommonImageView(
              imagePath: ImageConstant.pngSubscriptionBack,
            ),
            Container(
              color: Colors.black.withOpacity(0.75),
            ),
            Padding(
              padding: 20.paddingHorizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  94.kheightBox,
                  CommonImageView(
                    fit: BoxFit.contain,
                    svgPath: ImageConstant.svgGgcTitleGreen,
                  ),
                  40.kheightBox,
                  Center(
                    child: EvStationRoundedBox(
                      width: 190.kw,
                      borderRadius: 6.kh,
                      child: TabBar(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.kw, vertical: 5.kh),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.kh),
                            color: ColorUtil.kGreen04,
                          ),
                          controller: controller.tabController,
                          labelStyle: TextStyleUtil.genSans600(fontSize: 12.kh),
                          unselectedLabelColor: Colors.black,
                          unselectedLabelStyle:
                              TextStyleUtil.genSans500(fontSize: 14.kh),
                          tabs: [
                            Tab(text: LocaleKeys.my_subscription_monthly.tr),
                            Tab(text: LocaleKeys.my_subscription_yearly.tr),
                          ]),
                    ),
                  ),
                  36.kheightBox,
                  Expanded(
                    child: TabBarView(
                        controller: controller.tabController,
                        children: [Monthly(), Monthly()]),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
