import 'package:expiration_date/core/enums/enums.dart';
import 'package:expiration_date/domain/entities/report_data.dart';

class DailyReportState {
  const DailyReportState({
    required this.blocStatus,
    this.reportData,
    this.errorText,
  });

  final BlocStatus blocStatus;
  final ReportData? reportData;
  final String? errorText;

  DailyReportState copyWith({
    required BlocStatus blocStatus,
    ReportData? reportData,
    String? error,
  }) {
    return DailyReportState(
      blocStatus: blocStatus,
      reportData: reportData,
      errorText: errorText,
    );
  }
}
