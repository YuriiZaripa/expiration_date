import 'package:expiration_date/core/thema/app_colors.dart';
import 'package:expiration_date/domain/entities/product.dart';
import 'package:expiration_date/pages/daily_report_page/bloc/daily_report_data_bloc.dart';
import 'package:expiration_date/pages/daily_report_page/bloc/daily_report_data_event.dart';
import 'package:expiration_date/pages/daily_report_page/single_daily_report_page.dart';
import 'package:expiration_date/pages/product_page/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:expiration_date/dependency_injection.dart' as di;

class DailyReportListTile extends StatelessWidget {
  const DailyReportListTile({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: products.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
          child: InkWell(
            onTap: () async {
              bool isBack = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SingleDailyReportPage(
                      products: products, startIndex: index),
                ),
              );

              if (isBack) {
                final DailyReportDataBloc dailyReportDataBloc = di.getIt.get();
                dailyReportDataBloc.add(GetDailyReportDataEvent());
              }
            },
            child: ProductTile(
              product: products[index],
            ),
          ),
        );
      },
      separatorBuilder: (_, __) {
        return const Divider(
          color: AppColors.mainBlack,
          thickness: 3,
          indent: 10,
          endIndent: 10,
        );
      },
    );
  }
}
