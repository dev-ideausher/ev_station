import 'package:ev_station/app/components/ev_station_appbar.dart';
import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

import '../controllers/add_comment_controller.dart';

class AddCommentView extends GetView<AddCommentController> {
  const AddCommentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          bottomNavigationBar: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(
                height: 0,
                color: const Color(0xffDDE2E3),
                thickness: 1.kh,
              ),
              Padding(
                padding: paddingOnly(
                    left: 20.kw, right: 20.kw, top: 9.kh, bottom: 43.kh),
                child: EvStationButton(
                  onPressed: () {},
                  label: LocaleKeys.common_submit.tr,
                ),
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: paddingOnly(left: 20.kw, right: 20.kw, top: 60.kh),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: CommonImageView(
                            fit: BoxFit.contain,
                            svgPath: ImageConstant.svgBack,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: LocaleKeys.add_a_comment_add_a_comment.tr.text600(
                          20.kh,
                          textAlign: TextAlign.center,
                          color: const Color(0xff077335)),
                    ),
                    Expanded(flex: 2, child: Row())
                  ],
                ),
              ),
              Padding(
                padding: 20.paddingHorizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LocaleKeys.add_a_comment_rate_your_experience.tr
                        .text500(16.kh, textAlign: TextAlign.center),
                    16.kheightBox,
                    Center(
                      child: RatingBar.builder(
                        glowRadius: 0,
                        itemPadding: EdgeInsets.symmetric(horizontal: 14.kw),
                        // ignoreGestures: true,
                        initialRating: 5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 30.kh,
                        unratedColor: ColorUtil.evGray,
                        itemBuilder: (context, _) => CommonImageView(
                          svgPath: ImageConstant.svgYellowStar,
                          height: 24.kh,
                          width: 24.kh,
                        ),
                        onRatingUpdate: (value) {},
                      ),
                    ),
                    38.kheightBox,
                    LocaleKeys.add_a_comment_write_your_review.tr
                        .text500(16.kh),
                    8.kheightBox,
                    EvStationRoundedBox(
                        isBorder: true,
                        width: 0.5.kh,
                        borderColor: const Color(0xff9F9F9F),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            EvStationTextField(
                              controller: controller.reviewController,
                              hint: '',
                              maxLines: 10,
                              textFillColor: Colors.transparent,
                            ),
                            Padding(
                              padding: 8.paddingAll,
                              child: CommonImageView(
                                height: 24.kh,
                                width: 24.kh,
                                fit: BoxFit.contain,
                                svgPath: ImageConstant.svgCamera,
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
