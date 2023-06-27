import 'package:ev_station/app/services/auth.dart';
import 'package:ev_station/app/services/dio/api_service.dart';
import 'package:ev_station/app/services/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../routes/app_pages.dart';
import '../../../services/storage.dart';

class CreateAccountController extends GetxController {
  RxBool isCheck = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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

  onCreateAccountTap() async {
    if (formKey.currentState!.validate()) {
      if (!isCheck.value) {
        showMySnackbar(msg: LocaleKeys.create_account_please_agree_the.tr);
      } else {
        if (emailPhoneController.text.isNum) {
          await Get.find<AuthService>()
              .mobileOtp(phoneno: '+91${emailPhoneController.text}')
              .then((value) => Get.toNamed(Routes.OTP_VERIFICATION,
                  arguments: ['createAccount', nameController.text]));
        } else {
          await Get.find<AuthService>()
              .createEmailPass(
                  email: emailPhoneController.text,
                  pass: passwordController.text)
              .then((value) async => value
                  ? await onboardingApi()
                  : showMySnackbar(
                      msg: LocaleKeys.common_something_went_wrong.tr));
        }
      }
    }
  }

  nameValidator(String? value) {
    if (!(value?.isAlphabetOnly ?? true) && (value?.isEmpty ?? false)) {
      return LocaleKeys.create_account_please_enter_a_proper_name.tr;
    }
  }

  passwordValidator(String? value) {
    if (!emailPhoneController.text.isNum) {
      if ((value?.isEmpty ?? false)) {
        return LocaleKeys.social_login_please_enter_a_password.tr;
      } else if (!RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
          .hasMatch(value ?? '')) {
        return 'Minimum 1 Upper and lowercase case,\n Numeric Number and Special Character.\nCommon Allow Character ( ! @ # \$ & * ~ )';
      }
    }
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

  onboardingApi() async {
    print('onboarding');
    await APIManager.postOnboardingAPI(
        body: {"name": nameController.text, "role": "user"}).then((value) {
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
