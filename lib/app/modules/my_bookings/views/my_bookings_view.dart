import 'package:ev_station/app/modules/my_bookings/views/booked.dart';
import 'package:ev_station/app/modules/my_bookings/views/history.dart';
import 'package:ev_station/app/modules/my_bookings/views/ongoing.dart';
import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_bookings_controller.dart';

class MyBookingsView extends GetView<MyBookingsController> {
  const MyBookingsView({Key? key}) : super(key: key);
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
              LocaleKeys.my_profile_profile_details.tr.text600(20.kh,
                  textAlign: TextAlign.center, color: const Color(0xff077335)),
            ],
          ),
        ),
        36.kheightBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: 20.paddingHorizontal,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 1,
                          color: const Color(0xff707070).withOpacity(0.1),
                          // color: Colors.black,
                          offset: const Offset(0, -2)),
                    ],
                  ),
                  child: EvStationRoundedBox(
                    height: 40.kh,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.kw, vertical: 4.kh),
                      child: TabBar(
                          padding: EdgeInsets.zero,
                          labelPadding: EdgeInsets.zero,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.kh),
                            color: ColorUtil.mainColor1,
                          ),
                          controller: controller.tabController,
                          labelStyle: TextStyleUtil.genSans500(fontSize: 14.kh),
                          unselectedLabelColor: const Color(0xff868686),
                          unselectedLabelStyle:
                              TextStyleUtil.genSans500(fontSize: 14.kh),
                          tabs: [
                            Tab(text: LocaleKeys.my_bookings_Ongoing.tr),
                            Tab(text: LocaleKeys.my_bookings_booked.tr),
                            Tab(text: LocaleKeys.my_bookings_history.tr),
                          ]),
                    ),
                  ),
                ),
              ),
              36.kheightBox,
              Expanded(
                child: TabBarView(
                    controller: controller.tabController,
                    children: const [Ongoing(), Booked(), History()]),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
