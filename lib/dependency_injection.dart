import 'package:expiration_date/data/remote_storage/export_service.dart';
import 'package:expiration_date/data/remote_storage/product_service.dart';
import 'package:expiration_date/data/remote_storage/report_service.dart';
import 'package:expiration_date/data/remote_storage/supplier_service.dart';
import 'package:expiration_date/data/repository/export_repository.dart';
import 'package:expiration_date/data/repository/product_repository.dart';
import 'package:expiration_date/data/repository/report_repository.dart';
import 'package:expiration_date/data/repository/supplier_repository.dart';
import 'package:expiration_date/domain/repository/i_export_repository.dart';
import 'package:expiration_date/domain/repository/i_product_repository.dart';
import 'package:expiration_date/domain/repository/i_report_repository.dart';
import 'package:expiration_date/domain/repository/i_supplier_repository.dart';
import 'package:expiration_date/domain/usecases/get_all_products_usecase.dart';
import 'package:expiration_date/domain/usecases/get_all_suppliers_usecase.dart';
import 'package:expiration_date/domain/usecases/get_daily_report_usecase.dart';
import 'package:expiration_date/domain/usecases/post_daily_report.dart';
import 'package:expiration_date/domain/usecases/put_new_products_usecase.dart';
import 'package:expiration_date/pages/daily_report_page/bloc/daily_report_data_bloc.dart';
import 'package:expiration_date/pages/daily_report_page/bloc/dayli_report_bloc/dailt_report_bloc.dart';
import 'package:expiration_date/pages/input_product_page/bloc/output_bloc.dart';
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
    ..registerLazySingleton<ReportService>(
      () => ReportService(),
    )
    ..registerLazySingleton<ExportService>(
      () => ExportService(),
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
    ..registerLazySingleton<IReportRepository>(
      () => ReportRepository(
        getIt.get(),
      ),
    )
    ..registerLazySingleton<IExportRepository>(
      () => ExportRepository(
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
    ..registerLazySingleton<IGetDailyReportUsecase>(
      () => GetDailyReportUsecase(
        getIt.get(),
      ),
    )
    ..registerLazySingleton<IPostDailyReportUsecase>(
      () => PostDailyReportUsecase(
        getIt.get(),
      ),
    )
    ..registerLazySingleton<IPutNewProductsUsecase>(
      () => PutNewProductsUsecase(
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
    ..registerLazySingleton<DailyReportDataBloc>(
      () => DailyReportDataBloc(
        getIt.get(),
      ),
    )
    ..registerLazySingleton<DailyReportBloc>(
      () => DailyReportBloc(
        getIt.get(),
      ),
    )
    ..registerLazySingleton<OutputBloc>(
      () => OutputBloc(
        getIt.get(),
      ),
    );
}
