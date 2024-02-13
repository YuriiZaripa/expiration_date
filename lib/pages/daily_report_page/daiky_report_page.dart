import 'package:easy_localization/easy_localization.dart';
import 'package:expiration_date/core/enums/enums.dart';
import 'package:expiration_date/core/thema/app_colors.dart';
import 'package:expiration_date/domain/entities/product.dart';
import 'package:expiration_date/generated/locale_keys.g.dart';
import 'package:expiration_date/pages/daily_report_page/bloc/daily_report_bloc.dart';
import 'package:expiration_date/pages/daily_report_page/bloc/daily_report_event.dart';
import 'package:expiration_date/pages/daily_report_page/bloc/daily_report_state.dart';
import 'package:expiration_date/pages/product_page/widgets/product_list_tipe_widget.dart';
import 'package:expiration_date/widgets/custom_scaffold_with_tabbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:expiration_date/dependency_injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyReportPage extends StatefulWidget {
  const DailyReportPage({super.key});

  @override
  State<StatefulWidget> createState() => _DailyReportPageState();
}

class _DailyReportPageState extends State<DailyReportPage> {
  final DailyReportBloc dailyReportBloc = di.getIt.get();


  @override
  void initState() {
    super.initState();

    dailyReportBloc.add(GetDailyReportEvent());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithTabBar(
      title: LocaleKeys.daily_report_list.tr(),
      body: BlocBuilder<DailyReportBloc, DailyReportState>(
        bloc: dailyReportBloc,
        builder: (BuildContext context, DailyReportState state) {
          if (state.blocStatus == BlocStatus.loading) {
            return const Center(
                child: CircularProgressIndicator(color: AppColors.mainRed));
          } else if (state.blocStatus == BlocStatus.error ||
              state.reportData == null) {
            return const Center(
              child: Text('OOPS!'),
            );
          }

          final dailyReportData = state.reportData!;
          return TabBarView(
            children: [
              ProductListTileWidget(products: dailyReportData.exchange, displaySale: false,),
              ProductListTileWidget(products: dailyReportData.writeOff, displaySale: false),
              ProductListTileWidget(products: dailyReportData.regular, displaySale: false),
            ],
          );
        },
      ),
    );
  }
}
