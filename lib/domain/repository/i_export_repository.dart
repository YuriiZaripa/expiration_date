import 'package:expiration_date/domain/entities/supplier.dart';

abstract interface class IExportRepository {
  Future<
      ({
      bool isSuccess,
      String? error,
      })> putNewProducts(Supplier supplier);
}