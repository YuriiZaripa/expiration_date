import 'package:easy_localization/easy_localization.dart';
import 'package:expiration_date/domain/entities/supplier.dart';
import 'package:expiration_date/generated/locale_keys.g.dart';
import 'package:expiration_date/pages/supplier_page/widgets/supplier_tile_widget.dart';
import 'package:flutter/material.dart';

class SupplierTileList extends StatelessWidget {
  final List<Supplier> suppliers;
  final String? notifyingText;
  final Function()? onTup;

  const SupplierTileList({
    super.key,
    required this.suppliers,
    this.notifyingText,
    this.onTup,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: suppliers.length,
      itemBuilder: (context, int index) {
        return SupplierTile(
          supplier: suppliers[index],
          notifyingText: notifyingText ?? LocaleKeys.discount_period.tr(),
          onTap: onTup,
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
