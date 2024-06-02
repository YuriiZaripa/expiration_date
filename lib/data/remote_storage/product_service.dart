import 'package:dio/dio.dart';
import 'package:expiration_date/core/constants/url_constants.dart';
import 'package:expiration_date/domain/entities/product.dart';
import 'package:expiration_date/data/network_service/expiration_date_api_service.dart';

class ProductService {
  Future<
      ({
        bool isSuccess,
        List<Product>? products,
        String? error,
      })> getAllProducts() async {
    Response? response = await get(UrlConstants.productsUrl);
    final data = response!.data as List<dynamic>;
    final products =
        data.map((e) => Product.fromJson(e as Map<String, dynamic>)).toList();

    try {
      return (
        isSuccess: true,
        products: products,
        error: null,
      );
    } on DioException catch (e) {
      final result = e.response!.data as Map<String, dynamic>;
      return (
        isSuccess: false,
        products: null,
        error: result['error']['message'].toString(),
      );
    }
  }
}
