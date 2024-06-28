import 'package:expiration_date/core/constants/url_constants.dart';
import 'package:dio/dio.dart';
import 'package:expiration_date/data/network_service/expiration_date_api_service.dart';
import 'package:expiration_date/domain/entities/supplier.dart';


final class ExportService {
  Future<
      ({
      bool isSuccess,
      String? error,
      })> putNewProducts(Supplier supplier) async {
    try {
      await put('${UrlConstants.importUrl}/${supplier.supplierId}');

      return (
      isSuccess: true,
      error: null,
      );
    } on DioException catch (e) {
      final result = e.response!.data as Map<String, dynamic>;
      return (
      isSuccess: false,
      error: result['message'].toString(),
      );
    }
  }
}