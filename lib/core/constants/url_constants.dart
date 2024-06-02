import 'package:expiration_date/core/secrets.dart';

sealed class UrlConstants {

  //change ip
  static const String baseUrl = 'http://$IP_ADDRES:8080/product-expiration-date/api/v1';
  // static const String baseUrl = 'http://localhost:8080/product-axpiration-date/api/v1';

  static const String suppliersUrl = '/suppliers';
  static const String suppliersByConditionUrl = '/suppliers/byReturnConditionType';

  static const String productsUrl = '/products';

  static const String reportsUrl = '/reports';
  static const String dailyReportUrl = '$reportsUrl/daily';
}