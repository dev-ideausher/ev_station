import 'package:ev_station/app/components/ev_station_bottom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/ev_station_dropdown.dart';
import '../../../services/index.dart';
import '../controllers/book_slot_controller.dart';

class BookSlotView extends GetView<BookSlotController> {
  const BookSlotView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: Obx(() => controller.curPage.value == 0
              ? EvSattionBottomButton(
                  onPressed: () => controller.onSubmitTap(),
                  label: LocaleKeys.common_submit.tr)
              : Column(
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
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              '\$51.02'.text600(24.kh),
                              LocaleKeys.book_slot_inclusive_of_all_taxes.tr
                                  .text400(12.kh)
                            ],
                          ),
                          const Spacer(),
                          EvStationButton(
                              width: 160.kw,
                              onPressed: () => controller.onConfirmSlot(),
                              label: LocaleKeys.book_slot_confirm_slot.tr),
                        ],
                      ),
                    ),
                  ],
                )),
          body: Column(
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
                          onTap: () => controller.onBackTap(),
                          child: CommonImageView(
                            fit: BoxFit.contain,
                            svgPath: ImageConstant.svgRoundedBack,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: LocaleKeys.book_slot_book_a_slot.tr.text600(20.kh,
                          textAlign: TextAlign.center,
                          color: const Color(0xff077335)),
                    ),
                    Expanded(flex: 2, child: Row())
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (value) => controller.curPage.value = value,
                  controller: controller.pageViewController,
                  children: [bookSlot1(), bookSlot2()],
                ),
              ),
            ],
          )),
    );
  }

  Widget bookSlot1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: paddingSymmetric(horizontal: 20.kw),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  24.kheightBox,
                  LocaleKeys.book_slot_fill_all_the.tr.text400(14.kh),
                  16.kheightBox,
                  LocaleKeys.book_slot_select_your_vehicle.tr.text500(16.kh),
                  8.kheightBox,
                  EvStationRoundedBox(
                    borderRadius: 4.kh,
                    isBorder: true,
                    borderWidth: 0.5.kh,
                    borderColor: const Color(0xff9F9F9F),
                    child: Obx(
                      () => EvStationDropDown(
                        items: controller.dropdownItems,
                        onChanged: (value) => controller.onDropDownTap(value),
                        value: controller.dropDownValue.value,
                      ),
                    ),
                  ),
                  16.kheightBox,
                  LocaleKeys.book_slot_select_your_model.tr.text500(16.kh),
                  8.kheightBox,
                  EvStationTextField(
                    isBorder: true,
                    horizontal: 13.kw,
                    suffixIcon: Padding(
                      padding: paddingOnly(right: 11.kw),
                      child: CommonImageView(
                        svgPath: ImageConstant.svgSearch,
                      ),
                    ),
                    hint: 'Dodge Challenger Supercharge',
                    hintStyle: TextStyleUtil.genSans400(
                        fontSize: 14.kh, color: const Color(0xff9F9F9F)),
                    textFillColor: Colors.white,
                  ),
                  16.kheightBox,
                  LocaleKeys.book_slot_select_your_vehicle_fuel.tr
                      .text500(16.kh),
                  8.kheightBox,
                  EvStationRoundedBox(
                    borderRadius: 4.kh,
                    isBorder: true,
                    borderWidth: 0.5.kh,
                    borderColor: const Color(0xff9F9F9F),
                    child: Obx(
                      () => EvStationDropDown(
                        items: controller.dropdownItems,
                        onChanged: (value) => controller.onDropDownTap(value),
                        value: controller.dropDownValue.value,
                      ),
                    ),
                  ),
                  16.kheightBox,
                  LocaleKeys.book_slot_select_connecter_type.tr.text500(16.kh),
                  8.kheightBox,
                  EvStationRoundedBox(
                    borderRadius: 4.kh,
                    isBorder: true,
                    borderWidth: 0.5.kh,
                    borderColor: const Color(0xff9F9F9F),
                    child: Obx(
                      () => EvStationDropDown(
                        items: controller.dropdownItems,
                        onChanged: (value) => controller.onDropDownTap(value),
                        value: controller.dropDownValue.value,
                      ),
                    ),
                  ),
                  16.kheightBox,
                  LocaleKeys.book_slot_select_date_for.tr.text500(16.kh),
                  8.kheightBox,
                  Obx(
                    () => EvStationTextField(
                      onTap: () => controller.onDate(),
                      readOnly: true,
                      isBorder: true,
                      horizontal: 13.kw,
                      suffixIcon: Padding(
                        padding: paddingOnly(right: 11.kw),
                        child: CommonImageView(
                          height: 20.kh,
                          width: 20.kh,
                          svgPath: ImageConstant.svgCalendar,
                        ),
                      ),
                      hint: controller.date.value,
                      hintStyle: TextStyleUtil.genSans400(
                          fontSize: 14.kh, color: const Color(0xff9F9F9F)),
                      textFillColor: Colors.white,
                    ),
                  ),
                  16.kheightBox,
                  LocaleKeys.book_slot_select_time_for.tr.text500(16.kh),
                  8.kheightBox,
                  Obx(
                    () => EvStationTextField(
                      onTap: () => controller.onTime(),
                      readOnly: true,
                      isBorder: true,
                      horizontal: 13.kw,
                      suffixIcon: Padding(
                        padding: paddingOnly(right: 11.kw),
                        child: CommonImageView(
                          height: 20.kh,
                          width: 20.kh,
                          svgPath: ImageConstant.svgClock2,
                        ),
                      ),
                      hint: controller.time.value,
                      hintStyle: TextStyleUtil.genSans400(
                          fontSize: 14.kh, color: const Color(0xff9F9F9F)),
                      textFillColor: Colors.white,
                    ),
                  ),
                  20.kheightBox
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget bookSlot2() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: 20.paddingHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                36.kheightBox,
                CommonImageView(
                  fit: BoxFit.contain,
                  height: 127.kh,
                  imagePath: ImageConstant.pngDodgeCar,
                ),
                36.kheightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LocaleKeys.book_slot_vehicle.tr.text400(14.kh),
                    '4 Wheeler'.text500(14.kh)
                  ],
                ),
                16.kheightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LocaleKeys.book_slot_battery.tr.text400(14.kh),
                    '2.9Kwh'.text500(14.kh)
                  ],
                ),
                16.kheightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LocaleKeys.book_slot_slot_time.tr.text400(14.kh),
                    '9:00 AM'.text500(14.kh)
                  ],
                ),
                16.kheightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LocaleKeys.book_slot_slot_date.tr.text400(14.kh),
                    '23/03/2023'.text500(14.kh)
                  ],
                ),
                16.kheightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LocaleKeys.book_slot_connection_type.tr.text400(14.kh),
                    'Type-A'.text500(14.kh)
                  ],
                ),
                16.kheightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LocaleKeys.book_slot_booking_number.tr.text400(14.kh),
                    'GGC-12345548'.text500(14.kh)
                  ],
                ),
                16.kheightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LocaleKeys.book_slot_charge_time.tr.text400(14.kh),
                    '54 Mins'.text500(14.kh)
                  ],
                ),
                16.kheightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LocaleKeys.book_slot_charge_point_id.tr.text400(14.kh),
                    'GGC-12'.text500(14.kh)
                  ],
                ),
                16.kheightBox,
              ],
            ),
          ),
          Divider(
            thickness: 4.kh,
            color: const Color(0xffD9D9D9),
            height: 4.kh,
          ),
          Padding(
            padding: 20.paddingHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                16.kheightBox,
                LocaleKeys.book_slot_coupons.tr.text500(14.kh),
                16.kheightBox,
                EvStationRoundedBox(
                    onTap: () => controller.onApplyCouponTap(),
                    isBorder: true,
                    borderColor: Colors.black,
                    child: Padding(
                      padding:
                          paddingSymmetric(horizontal: 22.kw, vertical: 12.kh),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LocaleKeys.book_slot_apply_coupons.tr.text500(16.kh),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15.kh,
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          20.kheightBox
        ],
      ),
    );
  }
}
