import 'package:expiration_date/domain/entities/product.dart';

abstract interface class IProductRepository {
  Future<
      ({
        bool isSuccess,
        List<Product>? products,
        String? error,
      })> getAllProducts();
}
