import 'package:expiration_date/domaine/entities/supplier.dart';
import 'package:flutter/material.dart';

class SupplierTile extends StatelessWidget {
  final Supplier supplier;
  final String notifyingText;

  const SupplierTile({
    super.key,
    required this.supplier,
    required this.notifyingText,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(
        supplier.supplierName,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$notifyingText: ${supplier.period} days'),
            Text('sale: ${supplier.sale} %')
          ],
        ),
      ),
    );
  }
}
