import 'package:ev_station/app/modules/station_detail/views/chargers.dart';
import 'package:ev_station/app/modules/station_detail/views/info.dart';
import 'package:ev_station/app/modules/station_detail/views/review.dart';
import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

import '../controllers/station_detail_controller.dart';

class StationDetailView extends GetView<StationDetailController> {
  const StationDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar: Obx(
        //   () => controller.type.value == 'Open'
        //       ? EvStationButton(
        //           onPressed: () => controller.onBookASlotTap(),
        //           label: LocaleKeys.station_detail_book_a_slot.tr)
        //       : EvStationButton(
        //           color: controller.isAlert.value ? ColorUtil.mainRed : null,
        //           onPressed: () => controller.onSetRemoveAlertTap(),
        //           label: controller.isAlert.value
        //               ? LocaleKeys.station_detail_remove_alert.tr
        //               : LocaleKeys.station_detail_set_alert.tr,
        //         ),
        // ).paddingOnly(left: 20.kw, right: 20.kw, bottom: 43.kh),
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: CommonImageView(
                fit: BoxFit.contain,
                svgPath: ImageConstant.svgBack,
              ),
            ),
            actions: [
              CommonImageView(
                  svgPath: ImageConstant.svgOption, fit: BoxFit.contain)
            ],
            expandedHeight: 42.h,
            // floating: false,
            // pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: CommonImageView(
                  imagePath: ImageConstant.pngStationBackground,
                  fit: BoxFit.cover),
            ),
          ),
        ];
      },
      body: ListView(
        padding: EdgeInsets.zero,
        // mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          20.kheightBox,
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              'Walgreens - Brooklyn, NY'.text600(24.kh),
              8.kheightBox,
              'Brooklyn, 589 Prospect Avenue'.text400(16.kh),
              16.kheightBox,
              Row(
                children: [
                  '4.0'.text500(14.kh),
                  4.kwidthBox,
                  RatingBar.builder(
                    ignoreGestures: true,
                    initialRating: controller.rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 16.kh,
                    unratedColor: ColorUtil.evGray,
                    itemBuilder: (context, _) => CommonImageView(
                      svgPath: ImageConstant.svgStar,
                      height: 16.kh,
                      width: 16.kh,
                    ),
                    onRatingUpdate: (value) {},
                  ),
                  ' | '.text500(14.kh),
                  '(123 reviews)'
                      .text500(14.kh, color: const Color(0xff767676)),
                ],
              ),
              12.kheightBox,
              Row(
                children: [
                  Obx(
                    () => EvStationRoundedBox(
                        borderRadius: 4.kh,
                        color: controller.type.value == 'Open'
                            ? ColorUtil.labelGreen
                            : ColorUtil.mainRed,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.kw, vertical: 7.kh),
                          child: controller.type.value == 'Open'
                              ? LocaleKeys.searched_open.tr
                                  .text500(12.kh, color: Colors.white)
                              : LocaleKeys.station_detail_close.tr
                                  .text500(12.kh, color: Colors.white),
                        )),
                  ),
                  15.kwidthBox,
                  CommonImageView(
                    svgPath: ImageConstant.svgLocation3,
                    height: 16.kh,
                    width: 16.kh,
                  ),
                  4.kwidthBox,
                  '3.7Km'.text500(14.kh),
                  10.kwidthBox,
                  CommonImageView(
                    svgPath: ImageConstant.svgCarOff,
                    svgColor: ColorUtil.labelGreen,
                    height: 16.kh,
                    width: 16.kh,
                  ),
                  4.kwidthBox,
                  '9 mins'.text500(14.kh),
                ],
              )
            ],
          ).paddingSymmetric(horizontal: 20.kw),
          20.kheightBox,
          Divider(
            color: const Color(0xffA3A3A3),
            height: 0.5.kh,
            thickness: 0.5.kh,
          ),
          Row(
            children: [
              Expanded(
                child: EvStationButton(
                  fontSize: 14.kh,
                  onPressed: () {},
                  label: LocaleKeys.station_detail_get_directions.tr,
                ),
              ),
              16.kwidthBox,
              Expanded(
                child: EvStationButton(
                  fontSize: 14.kh,
                  isBorder: true,
                  borderWidth: 2.kh,
                  borderColor: ColorUtil.labelGreen,
                  color: Colors.white,
                  labelColor: ColorUtil.labelGreen,
                  onPressed: () {},
                  label: LocaleKeys.station_detail_route_planner.tr,
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 20.kw, vertical: 16.kh),
          Divider(
            color: const Color(0xffA3A3A3),
            height: 0.5.kh,
            thickness: 0.5.kh,
          ),
          15.kheightBox,
          TabBar(
              padding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              indicatorColor: ColorUtil.labelGreen,
              indicatorSize: TabBarIndicatorSize.label,
              // indicator: BoxDecoration(
              //   borderRadius: BorderRadius.circular(4.kh),
              //   color: ColorUtil.mainColor1,
              // ),
              controller: controller.tabController,
              indicatorWeight: 2.5.kh,
              labelColor: ColorUtil.labelGreen,
              labelStyle: TextStyleUtil.genSans500(fontSize: 16.kh),
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: TextStyleUtil.genSans400(fontSize: 16.kh),
              tabs: [
                Tab(text: LocaleKeys.station_detail_info.tr),
                Tab(text: LocaleKeys.station_detail_chargers.tr),
                Tab(text: LocaleKeys.station_detail_reviews.tr)
              ]),
          25.kheightBox,
          GetBuilder(builder: (StationDetailController controller) {
            return [
              Info(),
              Chargers(),
              Review()
            ][controller.tabController!.index];
          }),
          30.kheightBox
        ],
      ),
    ));
  }
}
