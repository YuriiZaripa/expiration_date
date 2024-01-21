import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SupplierTile extends StatelessWidget {
  final String supplierName;
  final int discountPeriod;
  final int notifyingPeriod;
  final double salle;
  final String periodName;

  SupplierTile(
    this.supplierName, {
    this.discountPeriod = 0,
    this.notifyingPeriod = 0,
    this.salle = 0.0,
    this.periodName = '',
  });

  @override
  Widget build(BuildContext context) {
    final titleStile = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: () {},
        title: Text(
          supplierName,
          style: titleStile,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(periodName + ': $notifyingPeriod days'),
            Text('salle: $salle %')
          ],
        ),
      ),
    );
  }
}
