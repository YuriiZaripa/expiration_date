import 'dart:io';

import 'package:expiration_date/core/secrets.dart';
import 'package:flutter/foundation.dart';

sealed class UrlConstants {

  static late String baseUrl = kIsWeb
      ? 'http://localhost:8080/product-expiration-date/api/v1'
      : 'http://${IP_ADDRES}:8080/product-expiration-date/api/v1';

  static const String suppliersUrl = '/suppliers';
  static const String suppliersByConditionUrl = '/suppliers/byReturnConditionType';

  static const String productsUrl = '/products';

  static const String reportsUrl = '/reports';
  static const String dailyReportUrl = '$reportsUrl/daily';
}