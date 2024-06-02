import 'package:expiration_date/domain/entities/suppliers_by_conditions.dart';
import 'package:expiration_date/domain/repository/i_supplier_repository.dart';

abstract interface class IGetAllSuppliersUsecase {
  Future<({bool isSuccess, SuppliersByConditions? suppliers, String? error})>
      call();
}

class GetAllSuppliersUsecase implements IGetAllSuppliersUsecase {
  final ISupplierRepository supplierRepository;

  GetAllSuppliersUsecase(
    this.supplierRepository,
  );

  @override
  Future<({SuppliersByConditions? suppliers, String? error, bool isSuccess})>
      call() async {
    return supplierRepository.getAllSuppliers();
  }
}
