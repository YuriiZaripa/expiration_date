import 'package:auto_route/auto_route.dart';
import 'package:expiration_date/domaine/entities/supplier.dart';
import 'package:expiration_date/pages/supplier_page/widgets/supplier_tile_list.dart';
import 'package:expiration_date/widgets/custom_scaffold_with_tabbar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SupplierPage extends StatelessWidget {
  const SupplierPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Supplier> suppliersExchange = [
      Supplier(supplierName: 'First to Exchange', period: 10, sale: 20),
      Supplier(supplierName: 'Second to Exchange', period: 12, sale: 30),
      Supplier(supplierName: 'Third to Exchange', period: 24, sale: 25),
      Supplier(supplierName: 'Fourth to Exchange', period: 7, sale: 40),
      Supplier(supplierName: 'Fifth to Exchange', period: 100, sale: 0),
    ];

    final List<Supplier> suppliersWriteOff = [
      Supplier(supplierName: 'First to Write-Off', period: 10, sale: 20),
      Supplier(supplierName: 'Second to Write-Off', period: 12, sale: 30),
      Supplier(supplierName: 'Third to Write-Off', period: 24, sale: 25),
      Supplier(supplierName: 'Fourth to Write-Off', period: 7, sale: 40),
      Supplier(supplierName: 'Fifth to Write-Off', period: 100, sale: 0),
    ];

    final List<Supplier> suppliersReturn = [
      Supplier(supplierName: 'First', period: 10, sale: 20),
      Supplier(supplierName: 'Second', period: 12, sale: 30),
      Supplier(supplierName: 'Third', period: 24, sale: 25),
      Supplier(supplierName: 'Fourth', period: 7, sale: 40),
      Supplier(supplierName: 'Fifth', period: 100, sale: 0),
    ];

    return CustomScaffoldWithTabBar(
      exchangeList: SupplierTileList(
              suppliers: suppliersExchange,
              notifyingText: 'NOTIFYING PERIOD',
            ), 
      writeOffList: SupplierTileList(suppliers: suppliersWriteOff),
      returnList: SupplierTileList(suppliers: suppliersReturn),);
  }
}


