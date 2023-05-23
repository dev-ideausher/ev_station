import 'package:ev_station/app/components/ev_station_rounded_box.dart';

import 'package:ev_station/app/services/responsive_size.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../components/ev_station_button.dart';
import '../../../components/common_image_view.dart';
import '../../../constants/image_constant.dart';
import '../../../services/colors.dart';
import '../../../services/text_style_util.dart';
import '../controllers/otp_verification_controller.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  const OtpVerificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        // ignore: unnecessary_null_comparison
        if (controller.otpController.text == null) {
          controller.isOtp.value = false;
        }
      },
      child: Scaffold(
          body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CommonImageView(
            height: 100.h,
            width: 100.w,
            fit: BoxFit.cover,
            imagePath: ImageConstant.pngOtpBackground,
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.39),
                Colors.black.withOpacity(0.86),
              ],
            )),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: 20.paddingHorizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  LocaleKeys.otp_verification_otp_verification.tr
                      .text600(28.kh, color: Colors.white),
                  8.kheightBox,
                  LocaleKeys.otp_verification_otp_has_been.tr
                      .text500(14.kh, color: Colors.white),
                  20.kheightBox,
                  Obx(
                    () => EvStationRoundedBox(
                        onTap: () => controller.isOtp.value = true,
                        height: 48.kh,
                        color: ColorUtil.textField,
                        child: controller.isOtp.value
                            ? Padding(
                                padding: 10.paddingBottom,
                                child: OtpTextField(
                                  onSubmit: (value) {
                                    controller.otpController.text = value;
                                  },
                                  autoFocus: true,
                                  enabledBorderColor: Colors.grey,
                                  textStyle: TextStyleUtil.genSans500(
                                      fontSize: 16.kh, color: Colors.black),
                                  borderColor: Colors.black,
                                  focusedBorderColor: Colors.black,
                                  numberOfFields: 6,
                                ),
                              )
                            : Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: 24.paddingLeft,
                                  child: LocaleKeys
                                      .otp_verification_enter_otp.tr
                                      .text400(16.kh,
                                          color: ColorUtil.hintText),
                                ),
                              )),
                  ),
                  16.kheightBox,
                  EvStationButton(
                      onPressed: () => controller.onContinueTap(),
                      label: LocaleKeys.otp_verification_scontinue.tr),
                  24.kheightBox,
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: LocaleKeys.otp_verification_didnt_received.tr,
                            style: TextStyleUtil.genSans500(fontSize: 16.kh)),
                        TextSpan(
                            text: LocaleKeys.otp_verification_send_again.tr,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('hello');
                              },
                            style: TextStyleUtil.genSans600(
                                fontSize: 16.kh, color: ColorUtil.mainColor1)),
                      ])),
                  156.kheightBox
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
