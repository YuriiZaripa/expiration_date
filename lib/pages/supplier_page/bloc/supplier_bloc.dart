import 'package:expiration_date/core/enums/enums.dart';
import 'package:expiration_date/domain/usecases/get_all_suppliers_usecase.dart';
import 'package:expiration_date/pages/supplier_page/bloc/supplier_event.dart';
import 'package:expiration_date/pages/supplier_page/bloc/supplier_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierBloc extends Bloc<SupplierEvent, SupplierState> {
  final IGetAllSuppliersUsecase _getAllSuppliersUsecase;

  SupplierBloc(this._getAllSuppliersUsecase)
      : super(
          const SupplierState(blocStatus: BlocStatus.none),
        ) {
    on<GetAllSuppliersEvent>((event, emit) async {
      emit(state.copyWith(blocStatus: BlocStatus.loading));

      final result = await _getAllSuppliersUsecase();

      if (result.isSuccess) {
        emit(
          state.copyWith(
            blocStatus: BlocStatus.loaded,
            suppliers: result.suppliers,
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
