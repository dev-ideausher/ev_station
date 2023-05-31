class Endpoints {
  Endpoints._();

  /// google API keys
  static const String googlePlacesAPIKey =
      'AIzaSyA4GNoA0fXKmwu0QLcvx57SZzwH_wKxojA';

  // base url
  static const String baseUrl = "http://18.218.245.223:8000";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  //Post APIs
  static const String userOnboarding = "/user/onboarding";
  static const String userLogin = "/user/login";
  static const String fileUpload = "/file-upload";
  static const String addCars = "/cars";

  //Patch APIs
  static const String updateUser = "/user/";

  //Get APIs
  static const String getAllCars = "/cars/all/app";
}
