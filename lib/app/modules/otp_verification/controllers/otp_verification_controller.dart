import 'package:ev_station/app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../routes/app_pages.dart';
import '../../../services/dio/api_service.dart';
import '../../../services/snackbar.dart';

class OtpVerificationController extends GetxController {
  RxBool isOtp = false.obs;

  TextEditingController otpController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onContinueTap() async {
    if (otpController.text.length == 6) {
      if (await Get.find<AuthService>()
          .verifyMobileOtp(otp: otpController.text)) {
        //Todo
        if (Get.arguments != null && Get.arguments[0] == 'createAccount') {
          await onboardingApi();
        } else {
          await loginApi();
        }
      } else {
        showMySnackbar(msg: 'Wrong OTP!');
      }
    }
  }

  onboardingApi() async {
    print('onboarding');
    await APIManager.postOnboardingAPI(
        body: {"name": Get.arguments[1], "role": "user"}).then((value) {
      print(value.data);
      value.data['status']
          ? Get.offAllNamed(Routes.RENTER_NAVIGATION)
          : showMySnackbar(msg: LocaleKeys.common_something_went_wrong.tr);
    });
  }

  loginApi() async {
    print('login');
    await APIManager.postLoginAPI().then((value) {
      print(value.data);
      value.data['status']
          ? Get.offAllNamed(Routes.RENTER_NAVIGATION)
          : showMySnackbar(msg: LocaleKeys.common_something_went_wrong.tr);
    });
  }
}
