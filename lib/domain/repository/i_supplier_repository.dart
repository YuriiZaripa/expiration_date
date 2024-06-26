import 'package:expiration_date/domain/entities/suppliers_by_conditions.dart';

abstract interface class ISupplierRepository {
  Future<
      ({
        bool isSuccess,
        SuppliersByConditions? suppliers,
        String? error,
      })> getAllSuppliers();
}
