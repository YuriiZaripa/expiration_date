import 'package:expiration_date/domain/entities/sku.dart';

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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      sku: Sku.fromJson(json['sku'] as Map<String, dynamic>),
      produced: DateTime.tryParse((json['produced'] as String?) ?? ''),
      expirationDate: DateTime.parse(json['expirationDate'] as String),
    );
  }
}
