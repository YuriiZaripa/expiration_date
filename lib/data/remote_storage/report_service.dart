import 'package:dio/dio.dart';
import 'package:expiration_date/core/constants/url_constants.dart';
import 'package:expiration_date/domain/entities/daily_report.dart';
import 'package:expiration_date/domain/entities/report_data.dart';
import 'package:expiration_date/data/network_service/expiration_date_api_service.dart';

final class ReportService {
  Future<
      ({
        bool isSuccess,
        ReportData? reportData,
        String? error,
      })> getDailyReportsData() async {
    try {
      Response? response = await get(UrlConstants.dailyReportUrl);
      final data = response!.data as Map<String, dynamic>;
      final dailyReport = ReportData.fromJson(data);

      return (
        isSuccess: true,
        reportData: dailyReport,
        error: null,
      );
    } on DioException catch (e) {
      final result = e.response!.data as Map<String, dynamic>;

      return (
        isSuccess: false,
        reportData: null,
        error: result['error']['message'].toString(),
      );
    }
  }

  Future<
      ({
        bool isSuccess,
        DailyReport dailyReport,
        String? error,
      })> postDailyReport(DailyReport dailyReport) async {
    try {
      Response? response = await post(
        UrlConstants.dailyReportUrl,
        data: dailyReport.toJsonWithProductId(),
      );
      final data = response!.data as Map<String, dynamic>;
      final dailyReportResponse = DailyReport.fromJson(data);

      return (
        isSuccess: true,
        dailyReport: dailyReportResponse,
        error: null,
      );
    } on DioException catch (e) {
      final result = e.response!.data as Map<String, dynamic>;

      return (
        isSuccess: false,
        dailyReport: dailyReport,
        error: result['error']['message'].toString(),
      );
    }
  }
}
