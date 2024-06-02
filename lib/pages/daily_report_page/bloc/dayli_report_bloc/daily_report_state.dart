import 'package:expiration_date/core/enums/enums.dart';
import 'package:expiration_date/domain/entities/daily_report.dart';

class DailyReportState {
  const DailyReportState({
    required this.blocStatus,
    this.dailyReport,
    this.errorText,
  });

  final BlocStatus blocStatus;
  final DailyReport? dailyReport;
  final String? errorText;

  DailyReportState copyWith({
    required BlocStatus blocStatus,
    DailyReport? dailyReport,
    String? error,
  }) {
    return DailyReportState(
      blocStatus: blocStatus,
      dailyReport: dailyReport,
      errorText: errorText,
    );
  }
}
