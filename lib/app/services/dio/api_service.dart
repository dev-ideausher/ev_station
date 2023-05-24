import 'dart:convert';
import 'package:dio/dio.dart';
import 'client.dart';
import 'endpoints.dart';

class APIManager {
  ///Post API
  static Future<Response> postOnboardingAPI({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .post(Endpoints.userOnboarding, data: jsonEncode(body));

  static Future<Response> postLoginAPI() async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .post(Endpoints.userLogin);

  static Future<Response> postUploadFileAPI({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .post(Endpoints.fileUpload, data: body);

  static Future<Response> postAddCarsAPI({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .post(Endpoints.addCars, data: jsonEncode(body));

  ///Patch API
  static Future<Response> patchLoginAPI(
          {required String userId, required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .patch(Endpoints.updateUser + userId, data: jsonEncode(body));

  ///Get API
  static Future<Response> getAllCarsAPI() async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .get(Endpoints.getAllCars);
}
