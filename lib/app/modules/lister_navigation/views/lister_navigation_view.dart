import 'package:ev_station/app/modules/lister_home/views/lister_home_view.dart';
import 'package:ev_station/app/modules/lister_profile/views/lister_profile_view.dart';
import 'package:ev_station/app/modules/my_chargers/views/my_chargers_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../services/index.dart';
import '../controllers/lister_navigation_controller.dart';

class ListerNavigationView extends GetView<ListerNavigationController> {
  const ListerNavigationView({Key? key}) : super(key: key);
  final List<Widget> pages = const [
    ListerHomeView(),
    MyChargersView(),
    ListerProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageViewController,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorUtil.selectedLabel,
          unselectedItemColor: ColorUtil.unSelectedLabel,
          selectedLabelStyle: TextStyleUtil.genSans600(fontSize: 12.kh),
          unselectedLabelStyle: TextStyleUtil.genSans600(fontSize: 12.kh),
          currentIndex: controller.pageNo.value,
          onTap: (value) => controller.onIconTap(value),
          items: [
            BottomNavigationBarItem(
              label: LocaleKeys.renter_navigation_home.tr,
              icon: CommonImageView(
                svgPath: ImageConstant.svgHomeOff,
                height: 24.kh,
                width: 24.kh,
              ),
              activeIcon: CommonImageView(
                svgPath: ImageConstant.svgHomeOn,
                height: 24.kh,
                width: 24.kh,
              ),
            ),
            BottomNavigationBarItem(
              label: LocaleKeys.lister_navigation_my_chargers.tr,
              icon: CommonImageView(
                svgPath: ImageConstant.svgCarOff,
                height: 24.kh,
                width: 24.kh,
              ),
              activeIcon: CommonImageView(
                svgPath: ImageConstant.svgCarOn,
                height: 24.kh,
                width: 24.kh,
              ),
            ),
            BottomNavigationBarItem(
              label: LocaleKeys.renter_navigation_profile.tr,
              icon: CommonImageView(
                svgPath: ImageConstant.svgProfileOff,
                height: 24.kh,
                width: 24.kh,
              ),
              activeIcon: CommonImageView(
                svgPath: ImageConstant.svgProfileOn,
                height: 24.kh,
                width: 24.kh,
              ),
            ),
          ],
          elevation: 15,
        ),
      ),
    );
  }
}
