import 'package:ev_station/app/modules/cars/views/cars_view.dart';
import 'package:ev_station/app/modules/home/views/home_view.dart';
import 'package:ev_station/app/modules/profile/views/profile_view.dart';
import 'package:ev_station/app/modules/trip/views/trip_view.dart';
import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/renter_navigation_controller.dart';

class RenterNavigationView extends GetView<RenterNavigationController> {
  const RenterNavigationView({Key? key}) : super(key: key);
  final List<Widget> pages = const [
    HomeView(),
    CarsView(),
    TripView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
              label: LocaleKeys.renter_navigation_cars.tr,
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
              label: LocaleKeys.renter_navigation_trip.tr,
              icon: CommonImageView(
                svgPath: ImageConstant.svgTripOff,
                height: 24.kh,
                width: 24.kh,
              ),
              activeIcon: CommonImageView(
                svgPath: ImageConstant.svgTripOn,
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
