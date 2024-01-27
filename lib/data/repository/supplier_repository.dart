import 'package:expiration_date/data/remote_storage/supplier_service.dart';
import 'package:expiration_date/domaine/entities/suppliers_by_conditions.dart';
import 'package:expiration_date/domaine/repository/i_supplier_repository.dart';

class SupplierRepository implements ISupplierRepository {
  final SupplierService supplierService;

  SupplierRepository(this.supplierService,);

  @override
  Future<({bool isSuccess, SuppliersByConditions? suppliers, String? error,})> getAllSuppliers() async {
    return supplierService.getAllSuppliers();
  }
}