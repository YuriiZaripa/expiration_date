import 'package:expiration_date/domain/entities/product.dart';
import 'package:expiration_date/domain/repository/i_product_repository.dart';

abstract interface class IGetAllProductsUsecase {
  Future<({bool isSuccess, List<Product>? products, String? error})> call();
}

class GetAllProductsUsecase implements IGetAllProductsUsecase {
  final IProductRepository productRepository;

  GetAllProductsUsecase(
    this.productRepository,
  );

  @override
  Future<
      ({
        String? error,
        bool isSuccess,
        List<Product>? products,
      })> call() async {
    return productRepository.getAllProducts();
  }
}
