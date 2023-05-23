import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/index.dart';
import '../controllers/add_new_car_controller.dart';

class AddNewCarView extends GetView<AddNewCarController> {
  const AddNewCarView({Key? key}) : super(key: key);
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: paddingOnly(
                    left: 20.kw, right: 20.kw, top: 60.kh, bottom: 6.kh),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: CommonImageView(
                          fit: BoxFit.contain,
                          svgPath: ImageConstant.svgRoundedBack,
                        ),
                      ),
                    ),
                    16.kwidthBox,
                    LocaleKeys.cars_add_a_new_car.tr.text600(20.kh,
                        textAlign: TextAlign.center,
                        color: const Color(0xff077335)),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: 20.paddingHorizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        30.kheightBox,
                        LocaleKeys.cars_upload_image.tr.text500(16.kh),
                        8.kheightBox,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: EvStationRoundedBox(
                              isBorder: true,
                              borderWidth: 0.5.kh,
                              color: Colors.white,
                              height: 150.kh,
                              width: 167.kw,
                              borderColor: const Color(0xff979797),
                              child: Container()),
                        ),
                        16.kheightBox,
                        LocaleKeys.cars_car_name.tr.text500(16.kh),
                        8.kheightBox,
                        const EvStationTextField(
                          isBorder: true,
                          borderColor: Color(0xff979797),
                          hint: '',
                          textFillColor: Colors.transparent,
                        ),
                        16.kheightBox,
                        LocaleKeys.cars_chassis_number.tr.text500(16.kh),
                        8.kheightBox,
                        const EvStationTextField(
                          isBorder: true,
                          borderColor: Color(0xff979797),
                          hint: '',
                          textFillColor: Colors.transparent,
                        ),
                        16.kheightBox,
                        LocaleKeys.cars_charger_type.tr.text500(16.kh),
                        8.kheightBox,
                        const EvStationTextField(
                          isBorder: true,
                          borderColor: Color(0xff979797),
                          hint: '',
                          textFillColor: Colors.transparent,
                        ),
                        16.kheightBox,
                        LocaleKeys.cars_charger_capacity.tr.text500(16.kh),
                        8.kheightBox,
                        const EvStationTextField(
                          isBorder: true,
                          borderColor: Color(0xff979797),
                          hint: '',
                          textFillColor: Colors.transparent,
                        ),
                        16.kheightBox,
                        LocaleKeys.cars_current_type.tr.text500(16.kh),
                        8.kheightBox,
                        const EvStationTextField(
                          isBorder: true,
                          borderColor: Color(0xff979797),
                          hint: '',
                          textFillColor: Colors.transparent,
                        ),
                        32.kheightBox
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
