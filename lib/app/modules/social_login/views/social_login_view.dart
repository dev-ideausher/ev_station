import 'package:ev_station/app/components/ev_station_text_field.dart';
import 'package:ev_station/app/services/responsive_size.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../components/common_image_view.dart';
import '../../../components/ev_station_button.dart';
import '../../../constants/image_constant.dart';
import '../../../services/colors.dart';
import '../../../services/text_style_util.dart';
import '../controllers/social_login_controller.dart';

class SocialLoginView extends GetView<SocialLoginController> {
  const SocialLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: Colors.black,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CommonImageView(
                  height: 100.h,
                  width: 100.w,
                  fit: BoxFit.cover,
                  imagePath: ImageConstant.pngSocialBackground,
                ),
                Container(
                  height: 100.h,
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
                Padding(
                  padding: 20.paddingHorizontal,
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        LocaleKeys.social_login_welcome_back.tr
                            .text600(28.kh, color: Colors.white),
                        8.kheightBox,
                        LocaleKeys.social_login_login_with_your.tr
                            .text500(14.kh, color: Colors.white),
                        20.kheightBox,
                        EvStationTextField(
                            controller: controller.emailPhoneController,
                            validator: (value) =>
                                controller.emailPhoneNumberValidator(value),
                            hint:
                                LocaleKeys.social_login_email_phone_number.tr),
                        20.kheightBox,
                        EvStationTextField(
                          controller: controller.passwordController,
                          validator: (value) =>
                              controller.passwordValidator(value),
                          hint: LocaleKeys.social_login_password.tr,
                          suffixIcon: Padding(
                            padding: 20.paddingRight,
                            child: GestureDetector(
                              onTap: () {
                                //TODO
                              },
                              child: CommonImageView(
                                // fit: BoxFit.contain,
                                svgPath: ImageConstant.svgEye,
                                height: 30.kh,
                                width: 30.kh,
                              ),
                            ),
                          ),
                        ),
                        16.kheightBox,
                        GestureDetector(
                          onTap: () {
                            ///TODO
                          },
                          child: Text(
                            LocaleKeys.social_login_forgot_password.tr,
                            textAlign: TextAlign.right,
                            style: TextStyleUtil.genSans500(fontSize: 14.kh),
                          ),
                        ),
                        16.kheightBox,
                        EvStationButton(
                            onPressed: () => controller.onLoginTap(),
                            label: LocaleKeys.onboarding_login.tr),
                        24.kheightBox,
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 1.kh,
                                color: Colors.white,
                              ),
                            ),
                            11.kwidthBox,
                            LocaleKeys.social_login_or_login_with.tr
                                .text400(14.kh, color: Colors.white),
                            11.kwidthBox,
                            Expanded(
                              child: Container(
                                height: 1.kh,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        16.kheightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonImageView(
                              height: 56.kh,
                              width: 56.kh,
                              svgPath: ImageConstant.svgGoogleLogin,
                            ),
                            24.kwidthBox,
                            CommonImageView(
                              height: 56.kh,
                              width: 56.kh,
                              svgPath: ImageConstant.svgAppleLogin,
                            ),
                            24.kwidthBox,
                            CommonImageView(
                              height: 56.kh,
                              width: 56.kh,
                              svgPath: ImageConstant.svgFbLogin,
                            )
                          ],
                        ),
                        24.kheightBox,
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: LocaleKeys.social_login_new_here.tr,
                                  style: TextStyleUtil.genSans500(
                                      fontSize: 16.kh)),
                              TextSpan(
                                  text: LocaleKeys.social_login_sign_up.tr,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => controller.onSignUpTap(),
                                  style: TextStyleUtil.genSans600(
                                      fontSize: 16.kh,
                                      color: ColorUtil.mainColor1)),
                            ])),
                        50.kheightBox
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
