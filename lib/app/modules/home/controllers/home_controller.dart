import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../routes/app_pages.dart';
import '../../../services/determine_location.dart';

class HomeController extends GetxController {
  List<Map<String, String>> data = [
    {'icon': ImageConstant.svgBolt, 'label': 'Type - 2'},
    {'icon': ImageConstant.svgRefuel, 'label': '10Kw/h'},
    {'icon': ImageConstant.svgDollar, 'label': '\$2.51 / Kw'},
  ];

  Completer<GoogleMapController>? gMapController;

  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(36.175, -115.136389),
    zoom: 11,
  );

  List<Map<String, double>> pin = [
    {'lat': 36.198017723932324, 'long': -115.11351722040818},
    {'lat': 36.138705540111275, 'long': -115.12519019363481},
  ];

  List<Marker> markers = <Marker>[];

  @override
  void onInit() {
    super.onInit();
    setLocation();
  }

  @override
  void onReady() {
    super.onReady();
    // onLocationPermission();
    setMarker(Get.context!);
  }

  @override
  void onClose() {
    super.onClose();
  }

  onMapCreate(GoogleMapController gmap) async {
    // gMapController = Completer();
    // gMapController?.complete(gmap);
  }

  setLocation() async {
    await DetermineLocation.determinePosition();
  }

  setMarker(BuildContext context) async {
    for (var i = 0; i < pin.length; i++) {
      markers.add(Marker(
        markerId: MarkerId([i].toString()),
        position: LatLng(pin[i]['lat'] ?? 0, pin[i]['long'] ?? 0),
        icon: await bitmapDescriptorFromSvgAsset(
            context, ImageConstant.svgEvStationPinDrop),
        //   infoWindow: InfoWindow(title: 'Hao'),
      ));
    }
    // print(bikes[0].location?.coordinates?[1] ?? 0);
    // print(bikes[0].location?.coordinates?[0] ?? 0);

    update();
  }

  onSearchTap() {
    Get.toNamed(Routes.SEARCH);
  }

  Future<BitmapDescriptor> bitmapDescriptorFromSvgAsset(
      BuildContext context, String assetName) async {
    // Read SVG file as String
    String svgString =
        await DefaultAssetBundle.of(context).loadString(assetName);
    // Create DrawableRoot from SVG String
    DrawableRoot svgDrawableRoot = await svg.fromSvgString(svgString, 'null');

    ui.Picture picture =
        svgDrawableRoot.toPicture(size: Size(24.kw * 6, 24.kh * 6));

    ui.Image image =
        await picture.toImage((24.kw * 6).toInt(), (24.kh * 6).toInt());
    ByteData bytes =
        await image.toByteData(format: ui.ImageByteFormat.png) ?? ByteData(0);
    return BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
  }

  onLocationPermission() {
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
                  onPressed: () => Get.back(),
                  label: LocaleKeys.home_enable_location.tr,
                ),
                43.kheightBox,
              ],
            ),
          )),
    );
  }
}
