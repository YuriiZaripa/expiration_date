

import 'package:expiration_date/domain/entities/supplier.dart';

class SuppliersByConditions {
  final List<Supplier> exchange;
  final List<Supplier> writeOff;
  final List<Supplier> regular;

  SuppliersByConditions({
    required this.exchange,
    required this.writeOff,
    required this.regular,
  });

  factory SuppliersByConditions.fromJson(Map<String, dynamic> json) {
    return SuppliersByConditions(
      exchange: (json['exchange'] as List)
          .map((e) => Supplier.fromJson(e as Map<String, dynamic>))
          .toList(),
      writeOff: (json['writeOff'] as List)
          .map((e) => Supplier.fromJson(e as Map<String, dynamic>))
          .toList(),
      regular: (json['regular'] as List)
          .map((e) => Supplier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
