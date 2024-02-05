class Supplier {
  final String supplierId;
  final String supplierName;
  final String returnCondition;
  final int period;
  final int sale;

  Supplier({
    required this.supplierId,
    required this.supplierName,
    required this.returnCondition,
    required this.period,
    required this.sale,
  });

  factory Supplier.fromJson(Map<String, dynamic> json) {
    return Supplier(
      supplierId: json['supplierId'] as String,
      supplierName: json['supplierName'] as String,
      returnCondition: json['returnCondition'] as String,
      period: json['advanceNotice'] as int,
      sale: json['discount'] as int,
    );
  }
}
