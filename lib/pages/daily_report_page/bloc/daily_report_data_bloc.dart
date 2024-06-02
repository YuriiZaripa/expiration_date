import 'package:expiration_date/core/enums/enums.dart';
import 'package:expiration_date/pages/daily_report_page/bloc/daily_report_data_event.dart';
import 'package:expiration_date/pages/daily_report_page/bloc/daily_report_data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expiration_date/domain/usecases/get_daily_report_usecase.dart';

class DailyReportDataBloc extends Bloc<DailyReportDataEvent, DailyReportDataState> {
  final IGetDailyReportUsecase _getDailyReportUsecase;

  DailyReportDataBloc(this._getDailyReportUsecase)
      : super(
          const DailyReportDataState(blocStatus: BlocStatus.none),
        ) {
    on<GetDailyReportDataEvent>((event, emit) async {
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
