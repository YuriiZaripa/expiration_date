import 'package:dio/dio.dart';
import 'package:expiration_date/core/constants/url_constants.dart';
import 'package:expiration_date/data/network_service/expiration_date_api_service.dart';
import 'package:expiration_date/domain/entities/suppliers_by_conditions.dart';

final class SupplierService {
  Future<
      ({
        bool isSuccess,
        SuppliersByConditions? suppliers,
        String? error,
      })> getAllSuppliers() async {
    try {
      Response? response = await get(UrlConstants.suppliersByConditionUrl);
      final data = response!.data as Map<String, dynamic>;
      final suppliers = SuppliersByConditions.fromJson(data);

      return (
        isSuccess: true,
        suppliers: suppliers,
        error: null,
      );
    } on DioException catch (e) {
      final result = e.response!.data as Map<String, dynamic>;
      return (
        isSuccess: false,
        suppliers: null,
        error: result['error']['message'].toString(),
      );
    }
  }
}
