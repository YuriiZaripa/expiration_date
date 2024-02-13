import 'package:expiration_date/data/remote_storage/report_service.dart';
import 'package:expiration_date/domain/entities/report_data.dart';
import 'package:expiration_date/domain/repository/i_report_repository.dart';

class ReportRepository implements IReportRepository {
  final ReportService reportService;

  ReportRepository(this.reportService,);

  @override
  Future<({
    bool isSuccess,
    ReportData? reportData,
    String? error,
  })> getDailyReport() async {
    return reportService.getDailyReport();
  }
}
