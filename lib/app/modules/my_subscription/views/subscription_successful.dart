import 'package:ev_station/app/components/ev_station_bottom_button.dart';
import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SubscriptionSuccessful extends StatelessWidget {
  const SubscriptionSuccessful({super.key});

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
          Padding(
            padding: 20.paddingHorizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CommonImageView(
                  fit: BoxFit.contain,
                  svgPath: ImageConstant.svgSuccessTick,
                ),
                45.kheightBox,
                LocaleKeys.my_subscription_congratulations.tr.text600(20.kh,
                    color: ColorUtil.mainDarkColor1,
                    textAlign: TextAlign.center),
                8.kheightBox,
                LocaleKeys.my_subscription_youre_subscription_is.tr
                    .text500(14.kh, textAlign: TextAlign.center)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
