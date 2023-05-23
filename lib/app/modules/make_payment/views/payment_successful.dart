import 'package:ev_station/app/components/ev_station_bottom_button.dart';
import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class PaymentSuccessful extends StatelessWidget {
  const PaymentSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: EvSattionBottomButton(
          onPressed: () {}, label: LocaleKeys.otp_verification_scontinue.tr),
      body: Stack(
        children: [
          CommonImageView(
            width: 100.w,
            fit: BoxFit.cover,
            height: 375.kh,
            imagePath: ImageConstant.gifPaymentSuccess,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonImageView(
                fit: BoxFit.contain,
                svgPath: ImageConstant.svgSuccessTick,
              ),
              45.kheightBox,
              LocaleKeys.payment_successful_payment_successful.tr.text600(20.kh,
                  color: ColorUtil.mainDarkColor1, textAlign: TextAlign.center),
              8.kheightBox,
              LocaleKeys.payment_successful_click_on_continue.tr
                  .text500(14.kh, textAlign: TextAlign.center)
            ],
          ),
        ],
      ),
    );
  }
}
