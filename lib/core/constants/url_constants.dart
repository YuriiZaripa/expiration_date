import 'package:expiration_date/core/secrets.dart';

sealed class UrlConstants {

  //change ip
  static const String baseUrl = 'http://$IP_ADDRES:8080/product-expiration-date/api/v1';
  // static const String baseUrl = 'http://localhost:8080/product-axpiration-date/api/v1';

  static const String suppliers = '/suppliers';
  static const String suppliersByCondition = '/suppliers/byReturnConditionType';
}