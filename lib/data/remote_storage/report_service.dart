import 'package:dio/dio.dart';
import 'package:expiration_date/core/constants/url_constants.dart';
import 'package:expiration_date/domain/entities/report_data.dart';
import 'package:expiration_date/data/network_service/expiration_date_api_service.dart';

final class ReportService {
  Future<
      ({
        bool isSuccess,
        ReportData? reportData,
        String? error,
      })> getDailyReport() async {
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
}
