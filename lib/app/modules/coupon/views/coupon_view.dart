import 'package:ev_station/app/components/ev_station_bottom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../services/index.dart';
import '../controllers/coupon_controller.dart';

class CouponView extends GetView<CouponController> {
  const CouponView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: EvSattionBottomButton(
            onPressed: () {}, label: LocaleKeys.book_slot_apply_coupons.tr),
        backgroundColor: const Color(0xffFAFFFC),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: paddingOnly(left: 20.kw, right: 20.kw, top: 54.kh),
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
                    child: LocaleKeys.book_slot_coupons.tr.text600(20.kh,
                        textAlign: TextAlign.center,
                        color: const Color(0xff077335)),
                  ),
                  Expanded(flex: 2, child: Row())
                ],
              ),
            ),
            24.kheightBox,
            Padding(
              padding: 20.paddingHorizontal,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 3,
                        color: const Color(0xff53A175).withOpacity(0.4))
                  ],
                ),
                child: EvStationRoundedBox(
                    isBorder: true,
                    borderWidth: 2.kh,
                    borderColor: ColorUtil.labelGreen,
                    color: Color(0xff9D9D9D),
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Row(
                        children: [
                          SizedBox(
                            width: 43.kw,
                            child: RotatedBox(
                                quarterTurns: 3,
                                child: Padding(
                                  padding: 8.paddingVertical,
                                  child: '15% OFF'
                                      .text600(18.kh, color: Colors.white),
                                )),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8.kh),
                                    bottomRight: Radius.circular(8.kh)),
                                color: const Color(0xffFBFBFB),
                              ),
                              padding: 12.paddingAll,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CommonImageView(
                                        height: 30.kh,
                                        width: 30.kh,
                                        svgPath:
                                            ImageConstant.svgAmericanExpress,
                                      ),
                                      11.kwidthBox,
                                      'AX100'.text600(16.kh)
                                    ],
                                  ),
                                  11.kheightBox,
                                  'Add more \$6.5 to avail this offer'.text400(
                                      12.kh,
                                      color: ColorUtil.kBlack02),
                                  8.kheightBox,
                                  'Get up to 15% cashback using American Express Card'
                                      .text400(14.kh),
                                  14.kheightBox,
                                  'Maximum discount up to \$20. '.text400(12.kh,
                                      color: ColorUtil.kBlack02),
                                  6.kheightBox,
                                  Text(
                                    LocaleKeys.book_slot_terms_and_condition.tr,
                                    style: TextStyleUtil.genSans500(
                                      fontSize: 10.kh,
                                      color: ColorUtil.kGreen04,
                                    ),
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    })),
              ),
            )
          ],
        ));
  }
}
