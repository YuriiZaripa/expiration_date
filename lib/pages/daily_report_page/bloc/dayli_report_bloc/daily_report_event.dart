import 'package:expiration_date/domain/entities/daily_report.dart';

abstract class DailyReportEvent {}

class PostDailyReportEvent implements DailyReportEvent {

  final DailyReport dailyReport;

  PostDailyReportEvent({required this.dailyReport});
}