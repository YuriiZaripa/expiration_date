import 'package:expiration_date/data/remote_storage/product_service.dart';
import 'package:expiration_date/data/remote_storage/supplier_service.dart';
import 'package:expiration_date/data/repository/product_repository.dart';
import 'package:expiration_date/data/repository/supplier_repository.dart';
import 'package:expiration_date/domain/repository/i_product_repository.dart';
import 'package:expiration_date/domain/repository/i_supplier_repository.dart';
import 'package:expiration_date/domain/usecases/get_all_products_usecase.dart';
import 'package:expiration_date/domain/usecases/get_all_suppliers_usecase.dart';
import 'package:expiration_date/pages/product_page/bloc/product_bloc.dart';
import 'package:expiration_date/pages/supplier_page/bloc/supplier_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt
    //SERVICES
    ..registerLazySingleton<SupplierService>(
      () => SupplierService(),
    )
    ..registerLazySingleton<ProductService>(
          () => ProductService(),
    )

    //REPOSITORIES
    ..registerLazySingleton<ISupplierRepository>(
      () => SupplierRepository(
        getIt.get(),
      ),
    )
    ..registerLazySingleton<IProductRepository>(
          () => ProductRepository(
        getIt.get(),
      ),
    )

    //USECASES
    ..registerLazySingleton<IGetAllSuppliersUsecase>(
      () => GetAllSuppliersUsecase(
        getIt.get(),
      ),
    )
    ..registerLazySingleton<IGetAllProductsUsecase>(
          () => GetAllProductsUsecase(
        getIt.get(),
      ),
    )

    //BLOCS
    ..registerLazySingleton<SupplierBloc>(
      () => SupplierBloc(
        getIt.get(),
      ),
    )
    ..registerLazySingleton<ProductBloc>(
          () => ProductBloc(
        getIt.get(),
      ),
    )
  ;
}
