import 'package:expiration_date/domain/entities/daily_report.dart';
import 'package:expiration_date/domain/repository/i_report_repository.dart';

abstract interface class IPostDailyReportUsecase {
  Future<
      ({
        bool isSuccess,
        DailyReport dailyReport,
        String? error,
      })> call(DailyReport dailyReport);
}

class PostDailyReportUsecase implements IPostDailyReportUsecase {
  final IReportRepository reportRepository;

  PostDailyReportUsecase(this.reportRepository);

  @override
  Future<
      ({
        bool isSuccess,
        DailyReport dailyReport,
        String? error,
      })> call(DailyReport dailyReport) async {
    return reportRepository.postDailyReport(dailyReport);
  }
}
