import 'package:ev_station/app/routes/app_pages.dart';
import 'package:ev_station/app/services/auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
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

  onProfileDetailsTap() {
    Get.toNamed(Routes.PROFILE_DETAIL);
  }

  onMyBookingsTap() {
    Get.toNamed(Routes.MY_BOOKINGS);
  }

  onMySubscriptionTap() {
    Get.toNamed(Routes.MY_SUBSCRIPTION);
    // Get.to(() => SubscriptionSuccessful());
  }

  onLogoutTap() {
    Get.find<AuthService>().logOutUser();
  }
}
