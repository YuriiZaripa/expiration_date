class Sku {
  final String id;
  final String? vendorCode;
  final List<String> barCode;
  final String title;
  final String? image;
  final String supplier;

  Sku({
    required this.id,
    this.vendorCode,
    required this.barCode,
    required this.title,
    this.image,
    required this.supplier,
  });
}
