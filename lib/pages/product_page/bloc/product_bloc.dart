import 'package:expiration_date/core/enums/enums.dart';
import 'package:expiration_date/domain/usecases/get_all_products_usecase.dart';
import 'package:expiration_date/pages/product_page/bloc/product_event.dart';
import 'package:expiration_date/pages/product_page/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IGetAllProductsUsecase _getAllProductsUsecase;

  ProductBloc(this._getAllProductsUsecase)
      : super(
          const ProductState(
            blocStatus: BlocStatus.none,
          ),
        ) {
    on<GetAllProductsEvent>((event, emit) async {
      emit(
        state.copyWith(
          blocStatus: BlocStatus.loading,
        ),
      );

      final result = await _getAllProductsUsecase();

      if (result.isSuccess) {
        emit(
          state.copyWith(
            blocStatus: BlocStatus.loaded,
            products: result.products,
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
