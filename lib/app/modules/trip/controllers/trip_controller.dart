import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:ev_station/app/services/responsive_size.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../constants/image_constant.dart';
import '../../../routes/app_pages.dart';

class TripController extends GetxController with GetTickerProviderStateMixin {
  RxBool isSelecting = false.obs;

  late Rx<AnimationController> animate = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  ).obs;

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
  }

  @override
  void onReady() {
    super.onReady();
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

  onTextfieldTap() {
    isSelecting.toggle();
  }

  onStationTap(int index) {
    Get.toNamed(Routes.TRIP_NAVIGATION);
  }
}
