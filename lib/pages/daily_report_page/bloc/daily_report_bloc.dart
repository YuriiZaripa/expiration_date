import 'package:expiration_date/core/enums/enums.dart';
import 'package:expiration_date/pages/daily_report_page/bloc/daily_report_event.dart';
import 'package:expiration_date/pages/daily_report_page/bloc/daily_report_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expiration_date/domain/usecases/get_daily_report_usecase.dart';

class DailyReportBloc extends Bloc<DailyReportEvent, DailyReportState> {
  final IGetDailyReportUsecase _getDailyReportUsecase;

  DailyReportBloc(this._getDailyReportUsecase)
      : super(
          const DailyReportState(blocStatus: BlocStatus.none),
        ) {
    on<GetDailyReportEvent>((event, emit) async {
      emit(state.copyWith(blocStatus: BlocStatus.loading));

      final result = await _getDailyReportUsecase();

      if (result.isSuccess) {
        emit(
          state.copyWith(
            blocStatus: BlocStatus.loaded,
            reportData: result.reportData,
          ),
        );
      } else {
        emit(
          state.copyWith(
            blocStatus: BlocStatus.error,
            error: result.error,
          ),
        );
      }
    });
  }
}
