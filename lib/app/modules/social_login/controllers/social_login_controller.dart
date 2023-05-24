import 'package:ev_station/app/services/dio/api_service.dart';
import 'package:ev_station/app/services/storage.dart';
import 'package:ev_station/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth.dart';
import '../../../services/snackbar.dart';

class SocialLoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

  onLoginTap() async {
    if (formKey.currentState!.validate()) {
      // print('object');
      if (emailPhoneController.text.isNum) {
        await Get.find<AuthService>()
            .mobileOtp(phoneno: '+91${emailPhoneController.text}');
        Get.toNamed(Routes.OTP_VERIFICATION);
      } else {
        await Get.find<AuthService>()
            .loginEmailPass(
                email: emailPhoneController.text, pass: passwordController.text)
            .then((value) async => value
                ? await loginApi()
                : showMySnackbar(
                    msg: LocaleKeys.common_something_went_wrong.tr));
      }
    }
  }

  onSignUpTap() {
    Get.toNamed(Routes.CREATE_ACCOUNT);
  }

  emailPhoneNumberValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.social_login_please_enter_email.tr;
    } else if ((value?.isNum ?? false) && value?.length != 10) {
      return LocaleKeys.social_login_please_enter_a_proper_number.tr;
    } else if (!(value?.isNum ?? true) && !(value?.isEmail ?? true)) {
      return LocaleKeys.social_login_please_enter_proper_email.tr;
    }
  }

  passwordValidator(String? value) {
    if (!emailPhoneController.text.isNum && (value?.isEmpty ?? false)) {
      return LocaleKeys.social_login_please_enter_a_password.tr;
    }
  }

  loginApi() async {
    print('login');
    await APIManager.postLoginAPI().then((value) {
      print(value.data);
      value.data['status']
          ? {
              Get.find<GetStorageService>().setuserId =
                  value.data['user']['_id'],
              Get.find<GetStorageService>().setName =
                  value.data['user']['name'],
              Get.find<GetStorageService>().setPhone =
                  value.data['user']['phone'],
              Get.find<GetStorageService>().setEmail =
                  value.data['user']['email'],
              Get.find<GetStorageService>().setProfileUrl =
                  value.data['user']['image'],
              Get.offAllNamed(Routes.RENTER_NAVIGATION)
            }
          : showMySnackbar(msg: LocaleKeys.common_something_went_wrong.tr);
    });
  }
}
