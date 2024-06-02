import 'package:easy_localization/easy_localization.dart';
import 'package:expiration_date/core/enums/enums.dart';
import 'package:expiration_date/core/thema/app_colors.dart';
import 'package:expiration_date/generated/locale_keys.g.dart';
import 'package:expiration_date/pages/daily_report_page/bloc/daily_report_data_bloc.dart';
import 'package:expiration_date/pages/daily_report_page/bloc/daily_report_data_event.dart';
import 'package:expiration_date/pages/daily_report_page/bloc/daily_report_data_state.dart';
import 'package:expiration_date/pages/widgets/custom_scaffold_with_tabbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:expiration_date/dependency_injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/daily_report_list_tile.dart';

class DailyReportPage extends StatefulWidget {
  const DailyReportPage({super.key});

  @override
  State<StatefulWidget> createState() => _DailyReportPageState();
}

class _DailyReportPageState extends State<DailyReportPage> {
  final DailyReportDataBloc dailyReportBloc = di.getIt.get();

  @override
  void initState() {
    super.initState();

    dailyReportBloc.add(GetDailyReportDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithTabBar(
      title: LocaleKeys.daily_report_list.tr(),
      body: BlocBuilder<DailyReportDataBloc, DailyReportDataState>(
        bloc: dailyReportBloc,
        builder: (BuildContext context, DailyReportDataState state) {
          if (state.blocStatus == BlocStatus.loading) {
            return const Center(
                child: CircularProgressIndicator(color: AppColors.mainRed));
          } else if (state.blocStatus == BlocStatus.error ||
              state.reportData == null) {
            return Center(
              child: Text(
                LocaleKeys.error_plug.tr(),
              ),
            );
          }

          final dailyReportData = state.reportData!;
          return TabBarView(
            children: [
              dailyReportData.exchange.isNotEmpty
                  ? DailyReportListTile(products: dailyReportData.exchange)
                  : Center(
                      child: SizedBox(
                        width: 200,
                        child: Text(
                          LocaleKeys.fine.tr(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ),
              dailyReportData.writeOff.isNotEmpty
                  ? DailyReportListTile(products: dailyReportData.writeOff)
                  : const Center(child: Text("All FINE!")),
              dailyReportData.regular.isNotEmpty
                  ? DailyReportListTile(products: dailyReportData.regular)
                  : const Center(child: Text("All FINE!")),
            ],
          );
        },
      ),
    );
  }
}
