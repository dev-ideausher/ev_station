import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ev_station/app/services/index.dart';
import '../controllers/create_account_controller.dart';

class CreateAccountView extends GetView<CreateAccountController> {
  const CreateAccountView({Key? key}) : super(key: key);
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
                  imagePath: ImageConstant.pngNewAccBackground,
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
                        LocaleKeys.create_account_create_new_account.tr
                            .text600(28.kh, color: Colors.white),
                        8.kheightBox,
                        LocaleKeys.create_account_give_us_some.tr
                            .text400(14.kh, color: Colors.white),
                        20.kheightBox,
                        EvStationTextField(
                            controller: controller.nameController,
                            validator: (value) =>
                                controller.nameValidator(value),
                            hint: LocaleKeys.create_account_name.tr),
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
                        20.kheightBox,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: LocaleKeys
                                              .create_account_by_clicking.tr),
                                      TextSpan(
                                          text: LocaleKeys
                                              .create_account_terms_and_conditions
                                              .tr,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              //TODO
                                            },
                                          style: const TextStyle(
                                              color: ColorUtil.labelGreen)),
                                      const TextSpan(text: ' & '),
                                      TextSpan(
                                          text: LocaleKeys
                                              .create_account_privacy_policy.tr,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              //TODO
                                            },
                                          style: const TextStyle(
                                              color: ColorUtil.labelGreen)),
                                      const TextSpan(text: '.'),
                                    ],
                                    style: TextStyleUtil.genSans400(
                                        fontSize: 16.kh)),
                              ),
                            )
                          ],
                        ),
                        24.kheightBox,
                        EvStationButton(
                            onPressed: () => controller.onCreateAccountTap(),
                            label: LocaleKeys.create_account_create_account.tr),
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
                            LocaleKeys.create_account_or_signup_with.tr
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
                                  text: LocaleKeys
                                      .create_account_already_have_an.tr,
                                  style: TextStyleUtil.genSans500(
                                      fontSize: 16.kh)),
                              TextSpan(
                                  text: LocaleKeys.onboarding_sign_in.tr,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('hello');
                                    },
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
