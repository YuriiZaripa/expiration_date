import 'package:expiration_date/domain/entities/report_data.dart';
import 'package:expiration_date/domain/repository/i_report_repository.dart';

abstract interface class IGetDailyReportUsecase {
  Future<
      ({
        bool isSuccess,
        ReportData? reportData,
        String? error,
      })> call();
}

class GetDailyReportUsecase implements IGetDailyReportUsecase {
  final IReportRepository reportRepository;

  GetDailyReportUsecase(this.reportRepository);

  @override
  Future<
      ({
        bool isSuccess,
        ReportData? reportData,
        String? error,
      })> call() async {
    return reportRepository.getDailyReportsData();
  }
}
