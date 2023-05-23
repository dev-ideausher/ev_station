import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class DetermineLocation {
  DetermineLocation._();

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  static Future<Position> determinePosition() async {
    await handleLocationPermission();
    return await Geolocator.getCurrentPosition();
  }

  static Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Get.snackbar(
      //   "Message",
      //   'Location services are disabled. Please enable the services',
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
      onLocationPermission();
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Get.snackbar(
        //   "Message",
        //   'Location permissions are denied',
        //   backgroundColor: Colors.red,
        //   colorText: Colors.white,
        // );
        onLocationPermission();
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
        "Message",
        'Location permissions are permanently denied, we cannot request permissions.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }

  static onLocationPermission() {
    Get.bottomSheet(
      isScrollControlled: true,
      Container(
          // height: 360.kh,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.kh),
                topRight: Radius.circular(24.kh),
              )),
          child: Padding(
            padding: 20.paddingHorizontal,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                20.kheightBox,
                Align(
                  alignment: Alignment.center,
                  child: EvStationRoundedBox(
                    borderRadius: 5.kh,
                    height: 5.kh,
                    width: 50.kw,
                    color: const Color(0xff999999),
                    child: Container(),
                  ),
                ),
                37.kheightBox,
                LocaleKeys.home_turn_on_your_location.tr.text600(20.kh,
                    color: ColorUtil.mainDarkColor1,
                    textAlign: TextAlign.center),
                24.kheightBox,
                CommonImageView(
                  fit: BoxFit.contain,
                  svgPath: ImageConstant.svgLocationArt,
                ),
                35.kheightBox,
                LocaleKeys.home_please_turn_on.tr.text400(14.kh),
                45.kheightBox,
                const Divider(),
                6.kheightBox,
                EvStationButton(
                  onPressed: () async {
                    Get.back();
                    return await handleLocationPermission();
                  },
                  label: LocaleKeys.home_enable_location.tr,
                ),
                43.kheightBox,
              ],
            ),
          )),
    );
  }
}
