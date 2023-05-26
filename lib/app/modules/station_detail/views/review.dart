import 'package:ev_station/app/modules/station_detail/controllers/station_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../services/index.dart';

class Review extends GetView<StationDetailController> {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            DecoratedBox(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      offset: const Offset(0, 0),
                      spreadRadius: 1,
                      color: Color(0xff767676).withOpacity(0.08))
                ]),
                child: EvStationRoundedBox(
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
                                          backgroundColor:
                                              const Color(0xffe6e6e6),
                                          progressColor: ColorUtil.mainColor1,
                                        )
                                      ],
                                    ),
                                    2.kheightBox
                                  ],
                                )),
                      ),
                    ],
                  ).paddingOnly(
                      left: 20.kw, right: 14.kw, top: 29.kh, bottom: 17.kh),
                )),
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
          ],
        ).paddingSymmetric(horizontal: 20.kw),
        14.kheightBox,
        SizedBox(
          height: 67.kh,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return index == 0
                    ? 16.kwidthBox
                    : Row(
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
        Column(
          children: [
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
          ],
        ).paddingSymmetric(horizontal: 20.kw),
        10.kheightBox
      ],
    );
  }
}
