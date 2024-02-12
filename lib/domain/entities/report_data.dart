import 'package:expiration_date/domain/entities/product.dart';

class ReportData {
  final List<Product> exchange;
  final List<Product> writeOff;
  final List<Product> regular;

  ReportData({
    required this.exchange,
    required this.writeOff,
    required this.regular,
  });

  factory ReportData.fromJson(Map<String, dynamic> json) {
    return ReportData(
      exchange: (json['exchange'] as List)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      writeOff: (json['writeOff'] as List)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      regular: (json['regular'] as List)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
