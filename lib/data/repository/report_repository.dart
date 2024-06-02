import 'package:expiration_date/data/remote_storage/report_service.dart';
import 'package:expiration_date/domain/entities/daily_report.dart';
import 'package:expiration_date/domain/entities/report_data.dart';
import 'package:expiration_date/domain/repository/i_report_repository.dart';

class ReportRepository implements IReportRepository {
  final ReportService reportService;

  ReportRepository(
    this.reportService,
  );

  @override
  Future<
      ({
        bool isSuccess,
        ReportData? reportData,
        String? error,
      })> getDailyReportsData() async {
    return reportService.getDailyReportsData();
  }

  @override
  Future<({DailyReport dailyReport, String? error, bool isSuccess})>
      postDailyReport(DailyReport dailyReport) {
    return reportService.postDailyReport(dailyReport);
  }
}
