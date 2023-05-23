import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../controllers/station_detail_controller.dart';

class Overview extends GetView<StationDetailController> {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 20.paddingHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: 'Northampton Charging Station'.text500(20.kh)),
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
            ],
          ),
          8.kheightBox,
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
              CommonImageView(
                svgPath: ImageConstant.svgWalking,
                height: 16.kh,
                width: 16.kh,
              ),
              4.kwidthBox,
              '3.7Km/20 mins'.text500(14.kh)
            ],
          ),
          24.kheightBox,
          Row(
            children: [
              EvStationRoundedBox(
                  borderRadius: 100,
                  height: 36.kh,
                  width: 36.kh,
                  color: Colors.black12,
                  child: Container()),
              15.kwidthBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  'Peter Thornton'.text500(16.kh),
                  'from 2019'.text300(12.kh),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CommonImageView(
                        svgPath: ImageConstant.svgBolt,
                        height: 20.kh,
                        width: 20.kh,
                      ),
                      '23'.text600(14.kh),
                    ],
                  ),
                  3.kheightBox,
                  LocaleKeys.common_available.tr.text500(12.kh),
                ],
              ),
            ],
          ),
          24.kheightBox,
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LocaleKeys.common_address.tr.text400(14.kh),
                    8.kheightBox,
                    '541, Centric Centre near 51  Avenue metro station'
                        .text500(16.kh)
                  ],
                ),
              ),
              EvStationRoundedBox(
                  borderRadius: 4.kh,
                  height: 80.kh,
                  width: 80.kw,
                  color: Colors.black12,
                  child: Container()),
            ],
          ),
          24.kheightBox,
          LocaleKeys.common_phone.tr.text400(14.kh),
          8.kheightBox,
          '+41 845 985 123'.text500(16.kh),
          24.kheightBox,
          LocaleKeys.station_detail_amenities.tr.text400(14.kh),
          20.kheightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                controller.data.length,
                (index) => Column(
                      children: [
                        EvStationRoundedBox(
                            borderRadius: 100,
                            height: 64.kh,
                            width: 64.kh,
                            color: const Color(0xfff1f1f1),
                            child: Center(
                              child: CommonImageView(
                                height: 42.kh,
                                width: 42.kh,
                                svgPath: controller.data[index]['icon'],
                              ),
                            )),
                        7.kheightBox,
                        (controller.data[index]['label'] ?? '').text400(14.kh)
                      ],
                    )),
          ),
          24.kheightBox,
          LocaleKeys.station_detail_reviews.tr.text400(14.kh),
          16.kheightBox,
          Padding(
            padding: EdgeInsets.only(
                left: 20.kw, right: 14.kw, top: 29.kh, bottom: 17.kh),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: '4.5/',
                          style: TextStyleUtil.genSans600(
                              fontSize: 32.kh, color: Colors.black)),
                      TextSpan(
                          text: '5',
                          style: TextStyleUtil.genSans600(
                              fontSize: 20.kh, color: Colors.black)),
                    ])),
                    8.kheightBox,
                    'Based on 100 reviews'.text400(14.kh),
                  ],
                ),
                const Spacer(),
                Column(
                  children: List.generate(
                      5,
                      (index) => Column(
                            children: [
                              Row(
                                children: [
                                  (5 - index).toString().text400(14.kh),
                                  13.kwidthBox,
                                  LinearPercentIndicator(
                                    width: 90.kw,
                                    padding: EdgeInsets.zero,
                                    barRadius: Radius.circular(5.kh),
                                    lineHeight: 5.kh,
                                    percent: controller.percent[index],
                                    backgroundColor: const Color(0xffe6e6e6),
                                    progressColor: ColorUtil.mainColor1,
                                  )
                                ],
                              ),
                              2.kheightBox
                            ],
                          )),
                ),
              ],
            ),
          ),
          8.kheightBox,
          Divider(
            color: Colors.black.withOpacity(0.4),
          ),
          7.kheightBox,
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
              ' · '.text600(25.kh),
              'Pretty Good'.text400(12.kh, color: const Color(0xff082E53))
            ],
          ),
          8.kheightBox,
          'Great experience, the charger points are available at every point when you visit this place'
              .text400(14.kh),
          14.kheightBox,
          SizedBox(
            height: 67.kh,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      EvStationRoundedBox(
                          borderRadius: 4.kh,
                          height: 67.kh,
                          width: 67.kh,
                          color: Colors.black12,
                          child: Container()),
                      16.kwidthBox
                    ],
                  );
                }),
          ),
          14.kheightBox,
          Divider(
            color: Colors.black.withOpacity(0.4),
          ),
          ListTile(
            onTap: () {},
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 15.kh,
              color: Colors.black,
            ),
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: LocaleKeys.station_detail_see_more.tr
                .text500(16.kh, color: ColorUtil.mainColor1),
          ),
          const Divider(),
          18.kheightBox,
          EvStationButton(
            onPressed: () => controller.onAddCommentTap(),
            label: LocaleKeys.station_detail_add_a_comment.tr,
          ),
          16.kheightBox,
        ],
      ),
    );
  }
}
