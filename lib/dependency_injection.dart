import 'package:expiration_date/data/remote_storage/supplier_service.dart';
import 'package:expiration_date/data/repository/supplier_repository.dart';
import 'package:expiration_date/domaine/repository/i_supplier_repository.dart';
import 'package:expiration_date/domaine/usecases/get_all_supliers_usecase.dart';
import 'package:expiration_date/pages/supplier_page/bloc/supplier_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt
    //SERVICES
    ..registerLazySingleton<SupplierService>(
      () => SupplierService(),
    )

    //REPOSITORIES
    ..registerLazySingleton<ISupplierRepository>(
      () => SupplierRepository(
        getIt.get(),
      ),
    )

    //USECASES
    ..registerLazySingleton<IGetAllSuppliersUsecase>(
      () => GetAllSuppliersUsecase(
        getIt.get(),
      ),
    )

    //BLOCS
    ..registerLazySingleton<SupplierBloc>(
      () => SupplierBloc(
        getIt.get(),
      ),
    );
}
