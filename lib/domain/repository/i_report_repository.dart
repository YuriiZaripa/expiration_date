import 'package:expiration_date/domain/entities/daily_report.dart';
import 'package:expiration_date/domain/entities/report_data.dart';

abstract interface class IReportRepository {
  Future<
      ({
      bool isSuccess,
      ReportData? reportData,
      String? error,
      })> getDailyReportsData();

  Future<
      ({
      bool isSuccess,
      DailyReport dailyReport,
      String? error,
      })> postDailyReport(DailyReport dailyReport);
}