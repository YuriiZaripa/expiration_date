import 'package:expiration_date/domain/entities/supplier.dart';

class Sku {
  final String id;
  final String? vendorCode;
  final List<String> barCode;
  final String title;
  final String? image;
  final Supplier supplier;

  Sku({
    required this.id,
    this.vendorCode,
    required this.barCode,
    required this.title,
    this.image,
    required this.supplier,
  });

  factory Sku.fromJson(Map<String, dynamic> json) {
    return Sku(
      id: json['id'] as String,
      title: json['title'] as String,
      vendorCode: json['vendorCode'] as String,
      barCode: (json['barCode'] as List).map((e) => e as String).toList(),
      image: json['image'] as String?,
      supplier: Supplier.fromJson(json['supplier']),
    );
  }
}
