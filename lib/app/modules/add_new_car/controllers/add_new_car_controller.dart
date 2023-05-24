import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ev_station/app/services/dio/api_service.dart';
import 'package:ev_station/app/services/snackbar.dart';
import 'package:ev_station/app/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:image_picker/image_picker.dart';
import '../../../services/index.dart';

class AddNewCarController extends GetxController {
  TextEditingController carNameController = TextEditingController();
  TextEditingController modelNameController = TextEditingController();
  TextEditingController chassisNoController = TextEditingController();
  TextEditingController chargerTypeController = TextEditingController();
  TextEditingController chargerCapacityController = TextEditingController();
  TextEditingController currentTypeController = TextEditingController();

  String? carImageUrl;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  File? carFile;

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

  onSubmitTap() async {
    if (!(formKey.currentState!.validate())) {
    } else if (carFile == null) {
      showMySnackbar(msg: LocaleKeys.cars_please_select_car_image.tr);
    } else {
      await addCarAPI();
    }
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

  Future pickDoc(ImageSource source) async {
    ImagePicker picker = ImagePicker();
    try {
      XFile? pickedFile =
          await picker.pickImage(source: source, imageQuality: 80);
      if (pickedFile != null) {
        carFile = File(pickedFile.path);
      }
    } on PlatformException catch (e) {
      printError(info: 'failed to pick images:$e');
    }
    update();
  }

  validator(String? value, int type) {
    switch (type) {
      case 0:
        if ((value?.isEmpty ?? false)) {
          return LocaleKeys.cars_enter_car_name.tr;
        }
        break;
      case 1:
        if ((value?.isEmpty ?? false)) {
          return LocaleKeys.cars_enter_chassis_number.tr;
        }
        break;
      case 2:
        if ((value?.isEmpty ?? false)) {
          return LocaleKeys.cars_enter_charger_type.tr;
        }
        break;
      case 3:
        if ((value?.isEmpty ?? false)) {
          return LocaleKeys.cars_enter_charger_capacity.tr;
        }
        break;
      case 4:
        if ((value?.isEmpty ?? false)) {
          return LocaleKeys.cars_enter_current_type.tr;
        }
        break;
      case 5:
        if ((value?.isEmpty ?? false)) {
          return LocaleKeys.cars_enter_model_name.tr;
        }
        break;
      default:
    }
  }

  uploadProfilePictureAPI() async {
    if (carFile != null) {
      try {
        await APIManager.postUploadFileAPI(
            body: FormData.fromMap({
          "type": "car",
          "file": await MultipartFile.fromFile(carFile?.path ?? '')
        })).then((value) => carImageUrl = value.data['urls'][0]);
      } on Exception catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  addCarAPI() async {
    await uploadProfilePictureAPI();
    try {
      await APIManager.postAddCarsAPI(body: {
        "user": Get.find<GetStorageService>().getuserId,
        "name": carNameController.text,
        "modelName": modelNameController.text,
        "images": [carImageUrl],
        "chassisNumber": chassisNoController.text,
        "chargerType": chargerTypeController.text,
        "chargerCapacity": chargerCapacityController.text,
        "currentType": currentTypeController.text
      }).then((value) => value.data['status'] ? Get.back(result: true) : null);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
