import 'package:ev_station/app/components/ev_station_bottom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../services/index.dart';
import '../../../services/storage.dart';
import '../controllers/profile_detail_controller.dart';

class ProfileDetailView extends GetView<ProfileDetailController> {
  const ProfileDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          bottomNavigationBar: Obx(
            () => EvSattionBottomButton(
                onPressed: () => controller.onEditSaveTap(),
                label: controller.isReadOnly.value
                    ? LocaleKeys.profile_detail_edit_details.tr
                    : LocaleKeys.common_confirm.tr),
          ),
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
                        onTap: () => Get.back(result: true),
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
                              GetBuilder(builder:
                                  (ProfileDetailController controller) {
                                return EvStationRoundedBox(
                                    height: 115.kh,
                                    width: 115.kh,
                                    borderRadius: 100,
                                    child: controller.profilePicture == null
                                        ? CommonImageView(
                                            fit: BoxFit.cover,
                                            url: Get.find<GetStorageService>()
                                                .getProfileUrl,
                                          )
                                        : CommonImageView(
                                            file: controller.profilePicture,
                                          ));
                              }),
                              GestureDetector(
                                  onTap: () => controller.isReadOnly.value
                                      ? {}
                                      : controller.onUploadPictureTap(),
                                  child: CommonImageView(
                                    height: 30.kh,
                                    width: 30.kh,
                                    svgPath: ImageConstant.svgCameraButton,
                                  ))
                            ],
                          ),
                        ),
                        16.kheightBox,
                        Get.find<GetStorageService>()
                            .getName
                            .text600(18.kh, textAlign: TextAlign.center),
                        24.kheightBox,
                        LocaleKeys.profile_detail_full_name.tr.text500(16.kh),
                        8.kheightBox,
                        Obx(
                          () => Form(
                            key: controller.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                EvStationTextField(
                                    readOnly: controller.isReadOnly.value,
                                    controller: controller.nameController,
                                    radius: 4.kh,
                                    isBorder: true,
                                    hint:
                                        LocaleKeys.profile_detail_full_name.tr),
                                16.kheightBox,
                                LocaleKeys.profile_detail_email.tr
                                    .text500(16.kh),
                                8.kheightBox,
                                EvStationTextField(
                                    readOnly: controller.isReadOnly.value,
                                    controller: controller.emailController,
                                    radius: 4.kh,
                                    isBorder: true,
                                    hint: LocaleKeys.profile_detail_email.tr),
                                16.kheightBox,
                                LocaleKeys.profile_detail_number.tr
                                    .text500(16.kh),
                                8.kheightBox,
                                EvStationTextField(
                                    readOnly: controller.isReadOnly.value,
                                    controller: controller.numberController,
                                    radius: 4.kh,
                                    isBorder: true,
                                    hint: LocaleKeys.profile_detail_number.tr),
                              ],
                            ),
                          ),
                        ),
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
