import 'package:expiration_date/domain/entities/product.dart';

class DailyReport {
  final String? id;
  final Product product;
  double? quantity;
  DateTime? created;
  String? comment;

  DailyReport({
    this.id,
    required this.product,
    this.quantity,
    this.created,
    this.comment,
  });

  factory DailyReport.fromJson(Map<String, dynamic> json) {
    return DailyReport(
      id: json['id'] as String,
      product: Product.fromJson(json['product']),
      quantity: json['quantity'] as double,
      created: DateTime.parse(json['created']),
      comment: json['comment'] as String,
    );
  }

  Map<String, dynamic> toJsonWithProductId() {
    return {
      if (id != null) 'id': id,
      'product': product.id,
      'quantity': quantity,
      if (created != null) 'created': created,
      'comment': comment,
    };
  }
}
