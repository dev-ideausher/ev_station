import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../services/index.dart';
import '../controllers/card_payment_controller.dart';

class CardPaymentView extends GetView<CardPaymentController> {
  const CardPaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: EvStationButton(
          onPressed: () => controller.onAddNewCardTap(),
          label: LocaleKeys.cars_add_a_new_car.tr,
        ).paddingOnly(left: 20.kw, right: 20.kw, bottom: 45.kh),
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
                      onTap: () => Get.back(result: true),
                      child: CommonImageView(
                        height: 30.kh,
                        width: 30.kh,
                        fit: BoxFit.contain,
                        svgPath: ImageConstant.svgRoundedBack,
                      ),
                    ),
                  ),
                  16.kwidthBox,
                  LocaleKeys.my_profile_card_payments.tr.text600(20.kh,
                      textAlign: TextAlign.center,
                      color: const Color(0xff077335)),
                ],
              ),
            ),
            30.kheightBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LocaleKeys.card_payment_all_cards.tr.text500(16.kh),
                8.kheightBox,
                EvStationRoundedBox(
                    borderRadius: 4.kh,
                    isBorder: true,
                    borderWidth: 0.2.kh,
                    borderColor: const Color(0xff8C8C8C),
                    child: Row(
                      children: [
                        Radio(
                          value: 0,
                          groupValue: 0,
                          onChanged: (value) {},
                        ),
                        CommonImageView(svgPath: ImageConstant.svgMasterCard),
                        25.kwidthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LocaleKeys.card_payment_master_card.tr
                                .text600(16.kh),
                            4.kheightBox,
                            'xxxx xxxx xxxx xxxx'
                                .text500(12.kh, color: const Color(0xff787979)),
                          ],
                        )
                      ],
                    ).paddingOnly(top: 24.kh, bottom: 24.kh)),
              ],
            ).paddingSymmetric(horizontal: 20.kw)
          ],
        ));
  }
}
