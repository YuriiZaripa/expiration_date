import 'package:expiration_date/core/enums/enums.dart';
import 'package:expiration_date/domain/entities/suppliers_by_conditions.dart';

class SupplierState {
  const SupplierState({
    required this.blocStatus,
    this.suppliers,
    this.errorText,
  });

  final BlocStatus blocStatus;
  final SuppliersByConditions? suppliers;
  final String? errorText;

  SupplierState copyWith({
    required BlocStatus blocStatus,
    SuppliersByConditions? suppliers,
    String? errorText,
  }) {
    return SupplierState(
      blocStatus: blocStatus,
      suppliers: suppliers,
      errorText: errorText,
    );
  }
}
