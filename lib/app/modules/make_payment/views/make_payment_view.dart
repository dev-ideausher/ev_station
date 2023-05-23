import 'package:ev_station/app/components/ev_station_bottom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../services/index.dart';
import '../controllers/make_payment_controller.dart';

class MakePaymentView extends GetView<MakePaymentController> {
  const MakePaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          bottomNavigationBar: EvSattionBottomButton(
              onPressed: () => controller.onConfirmSlotTap(),
              label: LocaleKeys.book_slot_confirm_slot.tr),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            svgPath: ImageConstant.svgRoundedBack,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: LocaleKeys.make_payment_make_payment.tr.text600(
                          20.kh,
                          textAlign: TextAlign.center,
                          color: const Color(0xff077335)),
                    ),
                    Expanded(flex: 2, child: Row())
                  ],
                ),
              ),
              36.kheightBox,
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: 20.paddingHorizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        10.kheightBox,
                        Row(
                            children:
                                List.generate(controller.cards.length, (index) {
                          return Row(
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5,
                                        spreadRadius: 0,
                                        color: const Color(0xff707070)
                                            .withOpacity(0.15),
                                        // color: Colors.black,
                                        offset: const Offset(0, 0)),
                                  ],
                                ),
                                child: EvStationRoundedBox(
                                  child: Padding(
                                    padding: paddingSymmetric(
                                        horizontal: 14.kh, vertical: 7.kh),
                                    child: CommonImageView(
                                      height: 37.kh,
                                      width: 37.kh,
                                      svgPath: controller.cards[index],
                                    ),
                                  ),
                                ),
                              ),
                              25.kwidthBox
                            ],
                          );
                        })),
                        24.kheightBox,
                        LocaleKeys.make_payment_card_number.tr.text500(16.kh),
                        8.kheightBox,
                        const EvStationTextField(
                          hint: '123456789',
                          isBorder: true,
                        ),
                        16.kheightBox,
                        LocaleKeys.make_payment_card_holder_name.tr
                            .text500(16.kh),
                        8.kheightBox,
                        const EvStationTextField(
                          hint: 'Thomas',
                          isBorder: true,
                        ),
                        16.kheightBox,
                        LocaleKeys.make_payment_card_holder_name.tr
                            .text500(16.kh),
                        8.kheightBox,
                        Row(
                          children: [
                            Expanded(
                              child: EvStationTextField(
                                hint: LocaleKeys.make_payment_month.tr,
                                isBorder: true,
                              ),
                            ),
                            15.kwidthBox,
                            Expanded(
                              child: EvStationTextField(
                                hint: LocaleKeys.make_payment_year.tr,
                                isBorder: true,
                              ),
                            ),
                          ],
                        ),
                        16.kheightBox,
                        LocaleKeys.make_payment_cvv_number.tr.text500(16.kh),
                        8.kheightBox,
                        EvStationTextField(
                          radius: 4.kh,
                          hint: '456',
                          isBorder: true,
                        ),
                        16.kheightBox,
                        Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                splashRadius: 0,
                                side:
                                    const BorderSide(color: Color(0xffbababc)),
                                visualDensity: VisualDensity.compact,
                                activeColor: ColorUtil.mainColor1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.kh),
                                ),
                                value: controller.isCheck.value,
                                onChanged: (value) =>
                                    controller.isCheck.toggle(),
                              ),
                            ),
                            4.kwidthBox,
                            LocaleKeys.make_payment_save_this_information.tr
                                .text500(14.kh)
                          ],
                        ),
                        36.kheightBox,
                        LocaleKeys.make_payment_additional_note.tr
                            .text500(16.kh),
                        8.kheightBox,
                        const EvStationTextField(
                          hint: 'Peter',
                          maxLines: 3,
                          isBorder: true,
                        ),
                        20.kheightBox
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
