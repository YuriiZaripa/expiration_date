import 'package:expiration_date/domaine/entities/suppliers_by_conditions.dart';

abstract interface class ISupplierRepository {
  Future<
      ({
        bool isSuccess,
        SuppliersByConditions? suppliers,
        String? error
      })> getAllSuppliers();
}