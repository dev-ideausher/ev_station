import 'package:ev_station/app/constants/image_constant.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SearchedController extends GetxController {
  List<Map<String, String>> data = [
    {'label': 'Charger A', 'logo': ImageConstant.svgCcs2, 'type': 'CCS-2'},
    {
      'label': 'Charger B',
      'logo': ImageConstant.svgAcType2,
      'type': 'AC Type-2'
    },
    {'label': 'Charger C', 'logo': ImageConstant.svgDc001, 'type': 'DC001'},
    {'label': 'Charger D', 'logo': ImageConstant.svgDc001, 'type': 'DC001'},
  ];
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

  onStationTap() {
    Get.toNamed(Routes.STATION_DETAIL);
  }
}
