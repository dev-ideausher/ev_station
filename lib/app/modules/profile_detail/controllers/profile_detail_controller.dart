import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ev_station/app/services/dio/api_service.dart';
import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:image_picker/image_picker.dart';
import '../../../services/storage.dart';

class ProfileDetailController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? profilrURL;

  RxBool isReadOnly = true.obs;

  File? profilePicture;

  @override
  void onInit() {
    super.onInit();
    nameController.text = Get.find<GetStorageService>().getName;
    emailController.text = Get.find<GetStorageService>().getEmail;
    numberController.text = Get.find<GetStorageService>().getPhone;
    profilrURL = Get.find<GetStorageService>().getProfileUrl;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future pickDoc(ImageSource source) async {
    ImagePicker picker = ImagePicker();
    try {
      XFile? pickedFile =
          await picker.pickImage(source: source, imageQuality: 80);
      if (pickedFile != null) {
        profilePicture = File(pickedFile.path);
      }
    } on PlatformException catch (e) {
      printError(info: 'failed to pick images:$e');
    }
    update();
  }

  onUploadPictureTap() {
    Get.bottomSheet(
      Padding(
        padding: EdgeInsets.only(left: 16.kw, right: 16.kw, bottom: 28.kh),
        child: EvStationRoundedBox(
          borderRadius: 20.kh,
          child: Padding(
            padding: EdgeInsets.all(16.kh),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () async {
                    Get.back();
                    await pickDoc(ImageSource.camera);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.camera_alt,
                        color: ColorUtil.mainColor1,
                        size: 25.kh,
                      ),
                      20.kwidthBox,
                      Expanded(
                        child: Text(
                          LocaleKeys.common_camera.tr,
                          style: TextStyleUtil.genSans500(
                              fontSize: 15.kh, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                15.kheightBox,
                GestureDetector(
                  onTap: () async {
                    Get.back();
                    await pickDoc(ImageSource.gallery);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.image,
                        color: ColorUtil.mainColor1,
                        size: 25.kh,
                      ),
                      20.kwidthBox,
                      Expanded(
                        child: Text(
                          LocaleKeys.common_gallery.tr,
                          style: TextStyleUtil.genSans500(
                              fontSize: 15.kh, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onEditSaveTap() {
    if (isReadOnly.value) {
      isReadOnly.value = false;
    } else {
      if (formKey.currentState!.validate()) {
        updateProfileDetailsAPI();
      }
    }
  }

  nameValidator(String? value) {
    if (!(value?.isAlphabetOnly ?? true) && (value?.isEmpty ?? false)) {
      return LocaleKeys.create_account_please_enter_a_proper_name.tr;
    }
  }

  emailValidator(String? value) {
    if (!(value?.isEmail ?? true) && (value?.isEmpty ?? false)) {
      return LocaleKeys.social_login_please_enter_proper_email.tr;
    }
  }

  numberValidator(String? value) {
    if (!(value?.isPhoneNumber ?? true) && (value?.isEmpty ?? false)) {
      return LocaleKeys.social_login_please_enter_a_proper_number.tr;
    }
  }

  uploadProfilePictureAPI() async {
    if (profilePicture != null) {
      try {
        await APIManager.postUploadFileAPI(
            body: FormData.fromMap({
          "type": "userProfile",
          "file": await MultipartFile.fromFile(profilePicture?.path ?? '')
        })).then((value) {
          profilrURL = value.data['urls'][0];
          Get.find<GetStorageService>().setProfileUrl = value.data['urls'][0];
        });
      } on Exception catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  updateProfileDetailsAPI() async {
    print({
      "name": nameController.text,
      "email": emailController.text,
      "phone": numberController.text,
      "image": profilrURL,
    });
    await uploadProfilePictureAPI();
    try {
      await APIManager.patchLoginAPI(
          userId: Get.find<GetStorageService>().getuserId,
          body: {
            "name": nameController.text,
            "email": emailController.text,
            "phone": numberController.text,
            "image": profilrURL,
          }).then((value) {
        Get.find<GetStorageService>().setName = value.data['user']['name'];
        Get.find<GetStorageService>().setPhone = value.data['user']['phone'];
        Get.find<GetStorageService>().setEmail = value.data['user']['email'];
        Get.find<GetStorageService>().setProfileUrl =
            value.data['user']['image'];
        isReadOnly.value = true;
      });
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
