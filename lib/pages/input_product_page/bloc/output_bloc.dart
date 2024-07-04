import 'package:expiration_date/core/enums/enums.dart';
import 'package:expiration_date/domain/usecases/put_new_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'output_event.dart';
import 'output_state.dart';

class OutputBloc extends Bloc<OutputEvent, OutputState> {
  final IPutNewProductsUsecase _sendNewProductsUsecaseUsecase;

  OutputBloc(this._sendNewProductsUsecaseUsecase)
      : super(
          const OutputState(
            blocStatus: BlocStatus.none,
          ),
        ) {
    on<SendNewProductsEvent>((event, emit) async {
      emit(
        state.copyWith(
          blocStatus: BlocStatus.loading,
        ),
      );

      final result = await _sendNewProductsUsecaseUsecase(event.supplier);

      if (result.isSuccess) {
        emit(
          state.copyWith(
            blocStatus: BlocStatus.loaded,
          ),
        );
      } else {
        emit(
          state.copyWith(
            blocStatus: BlocStatus.error,
            errorText: result.error,
          ),
        );
      }
    });
  }
}
