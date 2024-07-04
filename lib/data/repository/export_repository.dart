import 'package:expiration_date/data/remote_storage/export_service.dart';
import 'package:expiration_date/domain/entities/supplier.dart';
import 'package:expiration_date/domain/repository/i_export_repository.dart';

class ExportRepository implements IExportRepository {
  final ExportService exportService;

  ExportRepository(
    this.exportService,
  );

  @override
  Future<
      ({
        bool isSuccess,
        String? error,
      })> putNewProducts(Supplier supplier) async {
    return exportService.putNewProducts(supplier);
  }
}
