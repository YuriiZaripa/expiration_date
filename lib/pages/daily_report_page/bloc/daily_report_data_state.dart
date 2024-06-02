import 'package:expiration_date/core/enums/enums.dart';
import 'package:expiration_date/domain/entities/report_data.dart';

class DailyReportDataState {
  const DailyReportDataState({
    required this.blocStatus,
    this.reportData,
    this.errorText,
  });

  final BlocStatus blocStatus;
  final ReportData? reportData;
  final String? errorText;

  DailyReportDataState copyWith({
    required BlocStatus blocStatus,
    ReportData? reportData,
    String? error,
  }) {
    return DailyReportDataState(
      blocStatus: blocStatus,
      reportData: reportData,
      errorText: errorText,
    );
  }
}
