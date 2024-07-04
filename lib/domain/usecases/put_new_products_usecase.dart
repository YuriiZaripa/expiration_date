import 'package:expiration_date/domain/entities/supplier.dart';
import 'package:expiration_date/domain/repository/i_export_repository.dart';

abstract interface class IPutNewProductsUsecase {
  Future<
      ({
      bool isSuccess,
      String? error,
      })> call(Supplier supplier);
}

class PutNewProductsUsecase implements IPutNewProductsUsecase {
  final IExportRepository exportRepository;

  PutNewProductsUsecase(this.exportRepository);

  @override
  Future<
      ({
      bool isSuccess,
      String? error,
      })> call(Supplier supplier) async {
    return exportRepository.putNewProducts(supplier);
  }
}