import 'package:expiration_date/core/enums/enums.dart';
import 'package:expiration_date/core/thema/app_colors.dart';
import 'package:expiration_date/pages/supplier_page/bloc/supplier_bloc.dart';
import 'package:expiration_date/pages/supplier_page/bloc/supplier_event.dart';
import 'package:expiration_date/pages/supplier_page/bloc/supplier_state.dart';
import 'package:expiration_date/pages/supplier_page/widgets/supplier_tile_list.dart';
import 'package:expiration_date/widgets/custom_scaffold_with_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:expiration_date/dependency_injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierPage extends StatefulWidget {
  const SupplierPage({super.key});

  @override
  State<SupplierPage> createState() => _SupplierPageState();
}

class _SupplierPageState extends State<SupplierPage> {
  final SupplierBloc supplierBloc = di.getIt.get();


 @override
  void initState() {
    super.initState();
    
    supplierBloc.add(GetAllSuppliersEvent());
  }

  @override
  Widget build(BuildContext context) {

    return CustomScaffoldWithTabBar(
      body: BlocBuilder<SupplierBloc, SupplierState>(
        bloc: supplierBloc,
        builder: (BuildContext context, SupplierState state) {
          if (state.blocStatus == BlocStatus.loading) {
            return const Center(child: CircularProgressIndicator(color: AppColors.mainRed));
          } else if (state.blocStatus == BlocStatus.error ||
              state.suppliers == null) {
            return const Center(
              child: Text('OOPS!'),
            );
          }

          final suppliers = state.suppliers!;

          return TabBarView(
            children: [
              SupplierTileList(
                suppliers: suppliers.exchange,
                notifyingText: 'NOTIFYING PERIOD',
              ),
              SupplierTileList(suppliers: suppliers.writeOff),
              SupplierTileList(suppliers: suppliers.regular),
            ],
          );
        },
      ),
    );
  }
}