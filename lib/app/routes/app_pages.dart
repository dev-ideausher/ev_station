import 'package:get/get.dart';

import '../modules/add_comment/bindings/add_comment_binding.dart';
import '../modules/add_comment/views/add_comment_view.dart';
import '../modules/add_new_car/bindings/add_new_car_binding.dart';
import '../modules/add_new_car/views/add_new_car_view.dart';
import '../modules/admin_panel/bindings/admin_panel_binding.dart';
import '../modules/admin_panel/views/admin_panel_view.dart';
import '../modules/book_slot/bindings/book_slot_binding.dart';
import '../modules/book_slot/views/book_slot_view.dart';
import '../modules/card_payment/bindings/card_payment_binding.dart';
import '../modules/card_payment/views/card_payment_view.dart';
import '../modules/cars/bindings/cars_binding.dart';
import '../modules/cars/views/cars_view.dart';
import '../modules/coupon/bindings/coupon_binding.dart';
import '../modules/coupon/views/coupon_view.dart';
import '../modules/create_account/bindings/create_account_binding.dart';
import '../modules/create_account/views/create_account_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/lister_navigation/bindings/lister_navigation_binding.dart';
import '../modules/lister_navigation/views/lister_navigation_view.dart';
import '../modules/make_payment/bindings/make_payment_binding.dart';
import '../modules/make_payment/views/make_payment_view.dart';
import '../modules/my_bookings/bindings/my_bookings_binding.dart';
import '../modules/my_bookings/views/my_bookings_view.dart';
import '../modules/my_subscription/bindings/my_subscription_binding.dart';
import '../modules/my_subscription/views/my_subscription_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/otp_verification/bindings/otp_verification_binding.dart';
import '../modules/otp_verification/views/otp_verification_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profile_detail/bindings/profile_detail_binding.dart';
import '../modules/profile_detail/views/profile_detail_view.dart';
import '../modules/renter_navigation/bindings/renter_navigation_binding.dart';
import '../modules/renter_navigation/views/renter_navigation_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/searched/bindings/searched_binding.dart';
import '../modules/searched/views/searched_view.dart';
import '../modules/social_login/bindings/social_login_binding.dart';
import '../modules/social_login/views/social_login_view.dart';
import '../modules/station_detail/bindings/station_detail_binding.dart';
import '../modules/station_detail/views/station_detail_view.dart';
import '../modules/trip/bindings/trip_binding.dart';
import '../modules/trip/views/trip_view.dart';
import '../modules/trip_navigation/bindings/trip_navigation_binding.dart';
import '../modules/trip_navigation/views/trip_navigation_view.dart';
import '../services/storage.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.ADMIN_PANEL;
  static String? INITIAL;

  static assignInitial() {
    if (Get.find<GetStorageService>().getIsLoggedIn) {
      INITIAL = Routes.RENTER_NAVIGATION;
    } else {
      INITIAL = Routes.ONBOARDING;
    }
  }

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFICATION,
      page: () => const OtpVerificationView(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
      name: _Paths.SOCIAL_LOGIN,
      page: () => const SocialLoginView(),
      binding: SocialLoginBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_ACCOUNT,
      page: () => const CreateAccountView(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_PANEL,
      page: () => const AdminPanelView(),
      binding: AdminPanelBinding(),
    ),
    GetPage(
      name: _Paths.CARS,
      page: () => const CarsView(),
      binding: CarsBinding(),
    ),
    GetPage(
      name: _Paths.TRIP,
      page: () => const TripView(),
      binding: TripBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.RENTER_NAVIGATION,
      page: () => const RenterNavigationView(),
      binding: RenterNavigationBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.SEARCHED,
      page: () => const SearchedView(),
      binding: SearchedBinding(),
    ),
    GetPage(
      name: _Paths.STATION_DETAIL,
      page: () => const StationDetailView(),
      binding: StationDetailBinding(),
    ),
    GetPage(
      name: _Paths.ADD_COMMENT,
      page: () => const AddCommentView(),
      binding: AddCommentBinding(),
    ),
    GetPage(
      name: _Paths.ADD_NEW_CAR,
      page: () => const AddNewCarView(),
      binding: AddNewCarBinding(),
    ),
    GetPage(
      name: _Paths.TRIP_NAVIGATION,
      page: () => const TripNavigationView(),
      binding: TripNavigationBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_SLOT,
      page: () => const BookSlotView(),
      binding: BookSlotBinding(),
    ),
    GetPage(
      name: _Paths.MAKE_PAYMENT,
      page: () => const MakePaymentView(),
      binding: MakePaymentBinding(),
    ),
    GetPage(
      name: _Paths.COUPON,
      page: () => const CouponView(),
      binding: CouponBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_DETAIL,
      page: () => const ProfileDetailView(),
      binding: ProfileDetailBinding(),
    ),
    GetPage(
      name: _Paths.MY_BOOKINGS,
      page: () => const MyBookingsView(),
      binding: MyBookingsBinding(),
    ),
    GetPage(
      name: _Paths.MY_SUBSCRIPTION,
      page: () => const MySubscriptionView(),
      binding: MySubscriptionBinding(),
    ),
    GetPage(
      name: _Paths.CARD_PAYMENT,
      page: () => const CardPaymentView(),
      binding: CardPaymentBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.LISTER_NAVIGATION,
      page: () => const ListerNavigationView(),
      binding: ListerNavigationBinding(),
    ),
  ];
}
