import 'package:expiration_date/core/enums/enums.dart';
import 'package:expiration_date/domain/usecases/post_daily_report.dart';
import 'package:expiration_date/pages/daily_report_page/bloc/dayli_report_bloc/daily_report_event.dart';
import 'package:expiration_date/pages/daily_report_page/bloc/dayli_report_bloc/daily_report_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyReportBloc extends Bloc<DailyReportEvent, DailyReportState> {
  final IPostDailyReportUsecase _postDailyReportUsecase;

  DailyReportBloc(this._postDailyReportUsecase)
      : super(const DailyReportState(
          blocStatus: BlocStatus.none,
        )) {
    on<PostDailyReportEvent>((event, emit) async {
      emit(state.copyWith(blocStatus: BlocStatus.loading));

      final result = await _postDailyReportUsecase(event.dailyReport);

      if (result.isSuccess) {
        emit(state.copyWith(
          blocStatus: BlocStatus.loaded,
          dailyReport: result.dailyReport,
        ));
      } else {
        emit(state.copyWith(
          blocStatus: BlocStatus.error,
          dailyReport: result.dailyReport,
          error: result.error,
        ));
      }
    });
  }
}
