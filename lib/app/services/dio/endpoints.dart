class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://18.218.245.223:8000";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  //Post APIs
  static const String userOnboarding = "/user/onboarding";
  static const String userLogin = "/user/login";
}