import 'package:expiration_date/domaine/entities/supplier.dart';
import 'package:expiration_date/pages/supplier_page/widgets/supplier_tile.dart';
import 'package:flutter/material.dart';

class SupplierTileList extends StatelessWidget {
  final List<Supplier> suppliers;
  final String notifyingText;

  const SupplierTileList({super.key, 
    required this.suppliers,
    this.notifyingText = 'DISCOUNT PERIOD',
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
              itemCount: suppliers.length,
              itemBuilder: (context, int index) {
                return SupplierTile(
                  supplier: suppliers[index], 
                  notifyingText: notifyingText,
                  );
              },
              separatorBuilder: (context, int index) {
                return const Divider(
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                );
              },
            );
  }
}

