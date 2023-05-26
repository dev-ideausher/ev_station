import 'package:ev_station/app/modules/card_payment/controllers/card_payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/index.dart';

class AddNewCard extends GetView<CardPaymentController> {
  const AddNewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        bottomNavigationBar: EvStationButton(
          onPressed: () => controller.onAddNewCardTap(),
          label: LocaleKeys.card_payment_add_card.tr,
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
                  LocaleKeys.card_payment_add_a_new_card.tr.text600(20.kh,
                      textAlign: TextAlign.center,
                      color: const Color(0xff077335)),
                ],
              ),
            ),
            40.kheightBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LocaleKeys.card_payment_card_holder_Name.tr.text500(16.kh),
                8.kheightBox,
                EvStationTextField(
                  hint: '',
                  borderWidth: 0.25.kh,
                  isBorder: true,
                  radius: 4.kh,
                ),
                16.kheightBox,
                LocaleKeys.card_payment_account_name.tr.text500(16.kh),
                8.kheightBox,
                EvStationTextField(
                  hint: '',
                  borderWidth: 0.25.kh,
                  isBorder: true,
                  radius: 4.kh,
                ),
                16.kheightBox,
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LocaleKeys.card_payment_mm_yy.tr.text500(16.kh),
                          8.kheightBox,
                          EvStationTextField(
                            hint: '',
                            borderWidth: 0.25.kh,
                            isBorder: true,
                            radius: 4.kh,
                          ),
                        ],
                      ),
                    ),
                    20.kwidthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LocaleKeys.card_payment_cvv.tr.text500(16.kh),
                          8.kheightBox,
                          EvStationTextField(
                            hint: '',
                            borderWidth: 0.25.kh,
                            isBorder: true,
                            radius: 4.kh,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //  const Spacer(),
                20.kheightBox,
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        splashRadius: 0,
                        side: const BorderSide(color: Color(0xffbababc)),
                        visualDensity: VisualDensity.compact,
                        activeColor: ColorUtil.mainColor1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.kh),
                        ),
                        value: controller.isCheck.value,
                        onChanged: (value) => controller.isCheck.toggle(),
                      ),
                    ),
                    LocaleKeys.card_payment_save_for_future_use.tr
                        .text400(14.kh)
                  ],
                )
              ],
            ).paddingSymmetric(horizontal: 20.kw)
          ],
        ),
      ),
    );
  }
}
