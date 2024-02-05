import 'package:expiration_date/core/enums/enums.dart';
import 'package:expiration_date/domain/entities/product.dart';

class ProductState {
  const ProductState({
    required this.blocStatus,
    this.products,
    this.errorText,
  });

  final BlocStatus blocStatus;
  final List<Product>? products;
  final String? errorText;

  ProductState copyWith({
    required BlocStatus blocStatus,
    List<Product>? products,
    String? error,
  }) {
    return ProductState(
      blocStatus: blocStatus,
      products: products,
      errorText: errorText,
    );
  }
}
