import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:expiration_date/core/enums/enums.dart';
import 'package:expiration_date/domain/entities/supplier.dart';
import 'package:expiration_date/domain/entities/suppliers_by_conditions.dart';
import 'package:expiration_date/generated/locale_keys.g.dart';
import 'package:expiration_date/pages/input_product_page/input_product_page.dart';
import 'package:expiration_date/pages/supplier_page/bloc/supplier_bloc.dart';
import 'package:expiration_date/pages/supplier_page/bloc/supplier_event.dart';
import 'package:expiration_date/pages/supplier_page/bloc/supplier_state.dart';
import 'package:expiration_date/pages/widgets/custom_scaffold_with_additions_widget.dart';
import 'package:flutter/material.dart';
import 'package:expiration_date/dependency_injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierInputPage extends StatefulWidget {
  const SupplierInputPage({super.key});

  @override
  State<SupplierInputPage> createState() => _SupplierInputPage();
}

class _SupplierInputPage extends State<SupplierInputPage> {
  final SupplierBloc _supplierBloc = di.getIt.get();
  Supplier? _selectedSupplier;
  int _selectedTileIndex = -1;

  @override
  void initState() {
    super.initState();

    _supplierBloc.add(GetAllSuppliersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithAdditionsWidget(
      appBarAdditions: BlocBuilder<SupplierBloc, SupplierState>(
        bloc: _supplierBloc,
        builder: (BuildContext context, SupplierState state) {
          if (state.blocStatus == BlocStatus.none ||
              state.blocStatus == BlocStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.blocStatus == BlocStatus.error) {
            return Center(
              child: Text(LocaleKeys.error_plug.tr()),
            );
          }
          List<Supplier> suppliers = [
            if (state.suppliers != null) ...state.suppliers!.exchange,
            if (state.suppliers != null) ...state.suppliers!.regular,
            if (state.suppliers != null) ...state.suppliers!.writeOff,
          ];

          return SizedBox(
            child: Center(
              child: _selectedSupplier != null
                  ? Text(_selectedSupplier!.supplierName)
                  : Text(LocaleKeys.choseSupplier.tr()),
            ),
          );
        },
      ),
      title: LocaleKeys.choseSupplier.tr(),
      body: BlocBuilder<SupplierBloc, SupplierState>(
        bloc: _supplierBloc,
        builder: (BuildContext context, SupplierState state) {
          if (state.blocStatus == BlocStatus.none ||
              state.blocStatus == BlocStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.blocStatus == BlocStatus.error) {
            return Center(
              child: Text(LocaleKeys.error_plug.tr()),
            );
          }
          List<Supplier> suppliers = _getAllSupliers(state.suppliers);

          return ListView.builder(
            itemCount: suppliers.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(suppliers[index].supplierName),
                leading: Radio(
                  value: index,
                  groupValue: _selectedTileIndex,
                  onChanged: (value) {
                    setState(() => _selectedSupplier = suppliers[index]);
                    _selectedTileIndex = index;
                  },
                ),
                onTap: () {
                  setState(() => _selectedSupplier = suppliers[index]);
                  _selectedTileIndex = index;
                },
              );
            },
          );
        },
      ),
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(8),
          padding: WidgetStateProperty.all(
            const EdgeInsets.all(25),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          backgroundColor: WidgetStateProperty.all(Colors.green),
        ),
        onPressed: () {
          if (_selectedSupplier == null) {
            _showDialog(context);
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InputProductPage(
                  supplier: _selectedSupplier!,
                ),
              ),
            );
          }
        },
        child: Text(
          LocaleKeys.add_product.tr(),
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Timer(const Duration(seconds: 1), () {
          Navigator.of(context).pop();
        });

        return AlertDialog(
          content: Text(LocaleKeys.choseSupplierHint.tr()),
        );
      },
    );
  }

  List<Supplier> _getAllSupliers(SuppliersByConditions? suppliers) {
    return [
      if (suppliers != null) ...suppliers.exchange,
      if (suppliers != null) ...suppliers.regular,
      if (suppliers != null) ...suppliers.writeOff,
    ];
  }
}
