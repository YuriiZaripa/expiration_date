import 'package:expiration_date/data/remote_storage/product_service.dart';
import 'package:expiration_date/domain/entities/product.dart';
import 'package:expiration_date/domain/repository/i_product_repository.dart';

class ProductRepository implements IProductRepository {
  final ProductService productService;

  ProductRepository(
    this.productService,
  );

  @override
  Future<
      ({
        String? error,
        bool isSuccess,
        List<Product>? products,
      })> getAllProducts() {
    return productService.getAllProducts();
  }
}
