import 'package:dio/dio.dart';
import 'package:expiration_date/core/constants/url_constants.dart';
import 'package:expiration_date/data/network_service/network_service.dart';

Future<Response?> get(
  String path, {
  Map<String, dynamic>? queryParameters,
}) async {
  Response response = await NetworkService.instance.dio.get(
    '${UrlConstants.baseUrl}$path',
  );
  return response;
}

Future<Response?> post(
  String path, {
  Map<String, dynamic>? queryParameters,
  dynamic data,
}) async {
  Response response = await NetworkService.instance.dio.post(
    '${UrlConstants.baseUrl}$path',
    data: data,
  );
  return response;
}

Future<Response?> put(
    String path, {
      Map<String, dynamic>? queryParameters,
      dynamic data,
    }) async {
  Response response = await NetworkService.instance.dio.post(
    '${UrlConstants.baseUrl}$path',
    data: data,
  );
  return response;
}
