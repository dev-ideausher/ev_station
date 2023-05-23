import 'package:ev_station/app/components/ev_station_bottom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../services/index.dart';
import '../controllers/profile_detail_controller.dart';

class ProfileDetailView extends GetView<ProfileDetailController> {
  const ProfileDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          bottomNavigationBar: EvSattionBottomButton(
              onPressed: () {},
              label: LocaleKeys.profile_detail_edit_details.tr),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: paddingOnly(left: 20.kw, right: 20.kw, top: 60.kh),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: CommonImageView(
                          height: 30.kh,
                          width: 30.kh,
                          fit: BoxFit.contain,
                          svgPath: ImageConstant.svgRoundedBack,
                        ),
                      ),
                    ),
                    16.kwidthBox,
                    LocaleKeys.my_profile_profile_details.tr.text600(20.kh,
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
                        28.kheightBox,
                        Center(
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              EvStationRoundedBox(
                                  height: 115.kh,
                                  width: 115.kh,
                                  borderWidth: 4.kh,
                                  isBorder: true,
                                  borderRadius: 100,
                                  borderColor: const Color(0xff0F75BC),
                                  child: Container()),
                              CommonImageView(
                                height: 30.kh,
                                width: 30.kh,
                                svgPath: ImageConstant.svgCameraButton,
                              )
                            ],
                          ),
                        ),
                        16.kheightBox,
                        'Jonathan, 20'
                            .text600(18.kh, textAlign: TextAlign.center),
                        24.kheightBox,
                        LocaleKeys.profile_detail_full_name.tr.text500(16.kh),
                        8.kheightBox,
                        EvStationTextField(
                            radius: 4.kh,
                            isBorder: true,
                            hint: LocaleKeys.profile_detail_full_name.tr),
                        16.kheightBox,
                        LocaleKeys.profile_detail_email.tr.text500(16.kh),
                        8.kheightBox,
                        EvStationTextField(
                            radius: 4.kh,
                            isBorder: true,
                            hint: LocaleKeys.profile_detail_email.tr),
                        16.kheightBox,
                        LocaleKeys.profile_detail_number.tr.text500(16.kh),
                        8.kheightBox,
                        EvStationTextField(
                            radius: 4.kh,
                            isBorder: true,
                            hint: LocaleKeys.profile_detail_number.tr),
                        16.kheightBox,
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
