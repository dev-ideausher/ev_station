
import 'package:ev_station/app/modules/station_detail/views/connectors.dart';
import 'package:ev_station/app/modules/station_detail/views/overview.dart';
import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/station_detail_controller.dart';

class StationDetailView extends GetView<StationDetailController> {
  const StationDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          flex: 5,
          child: Stack( 
            children: [
              CommonImageView(
                height: 100.h,
                imagePath: ImageConstant.pngStationBackground,
                fit: BoxFit.cover,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.kw, vertical: 54.kh),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: CommonImageView(
                        svgPath: ImageConstant.svgBack,
                      ),
                    ),
                    CommonImageView(
                      svgPath: ImageConstant.svgOption,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        30.kheightBox,
        Expanded(
          flex: 6,
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
                            Tab(text: LocaleKeys.station_detail_overview.tr),
                            Tab(
                              text: LocaleKeys.station_detail_connectors.tr,
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
              25.kheightBox,
              Expanded(
                child: TabBarView(
                    controller: controller.tabController,
                    children: const [Overview(), Connectors()]),
              ),
              const Divider(),
              6.kheightBox,
              Padding(
                padding: 20.paddingHorizontal,
                child: Obx(
                  () => controller.type.value == 'Open'
                      ? EvStationButton(
                          onPressed: () => controller.onBookASlotTap(),
                          label: LocaleKeys.station_detail_book_a_slot.tr)
                      : EvStationButton(
                          color: controller.isAlert.value
                              ? ColorUtil.mainRed
                              : null,
                          onPressed: () => controller.onSetRemoveAlertTap(),
                          label: controller.isAlert.value
                              ? LocaleKeys.station_detail_remove_alert.tr
                              : LocaleKeys.station_detail_set_alert.tr,
                        ),
                ),
              ),
              43.kheightBox,
            ],
          ),
        )
      ],
    ));
  }
}
