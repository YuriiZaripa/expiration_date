import 'package:expiration_date/domaine/entities/sku.dart';

class Product {
  final String id;
  final Sku sku;
  final DateTime? produced;
  final DateTime expirationDate;

  Product({
    required this.id,
    required this.sku,
    this.produced,
    required this.expirationDate,
  });
}
