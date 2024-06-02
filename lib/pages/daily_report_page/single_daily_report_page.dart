import 'dart:collection';

import 'package:easy_localization/easy_localization.dart';
import 'package:expiration_date/core/enums/enums.dart';
import 'package:expiration_date/core/thema/app_colors.dart';
import 'package:expiration_date/domain/entities/daily_report.dart';
import 'package:expiration_date/domain/entities/product.dart';
import 'package:expiration_date/generated/locale_keys.g.dart';
import 'package:expiration_date/pages/daily_report_page/bloc/dayli_report_bloc/dailt_report_bloc.dart';
import 'package:expiration_date/pages/daily_report_page/bloc/dayli_report_bloc/daily_report_event.dart';
import 'package:expiration_date/pages/daily_report_page/bloc/dayli_report_bloc/daily_report_state.dart';
import 'package:expiration_date/pages/product_page/widgets/single_product_view.dart';
import 'package:expiration_date/pages/widgets/custom_button_widget.dart';
import 'package:expiration_date/pages/widgets/custom_scaffold_with_additions_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:expiration_date/dependency_injection.dart' as di;

final _dailyReportFormKey = GlobalKey<FormState>();

class SingleDailyReportPage extends StatefulWidget {
  const SingleDailyReportPage({
    super.key,
    required this.products,
    required this.startIndex,
  });

  final List<Product> products;
  final int startIndex;

  @override
  State<SingleDailyReportPage> createState() => _SingleDailyReportPageState();
}

class _SingleDailyReportPageState extends State<SingleDailyReportPage>
    with SingleTickerProviderStateMixin {
  late Queue<DailyReport> _dailyReportQueue;
  late TextEditingController _quantityController;
  late TextEditingController _commentController;
  final DailyReportBloc _dailyReportBloc = di.getIt.get();

  @override
  void initState() {
    super.initState();
    _dailyReportQueue = Queue();

    for (int i = widget.startIndex; i < widget.products.length; i++) {
      _dailyReportQueue.add(DailyReport(product: widget.products[i]));
    }
    for (int i = 0; i < widget.startIndex; i++) {
      _dailyReportQueue.add(DailyReport(product: widget.products[i]));
    }

    _quantityController = TextEditingController();
    _commentController = TextEditingController();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _commentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithAdditionsWidget(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context, true),
      ),
      title: LocaleKeys.report.tr(),
      appBarAdditions: BlocBuilder<DailyReportBloc, DailyReportState>(
          bloc: _dailyReportBloc,
          buildWhen: (previous, current) {
            if (previous.blocStatus == BlocStatus.loading &&
                current.blocStatus == BlocStatus.loaded) {
              _dailyReportQueue.removeLast();
              setState(() {});
              return true;
            }
            if (previous.blocStatus == BlocStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text('OOPS! ${current.dailyReport!.product.sku.title}'),
                  backgroundColor: AppColors.indicatorRed,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }

            return false;
          },
          builder: (context, state) {
            return LiquidLinearProgressIndicator(
              value: 1 - (_dailyReportQueue.length) / widget.products.length,
              valueColor: AlwaysStoppedAnimation(_dailyReportQueue.isNotEmpty
                  ? AppColors.mainRed
                  : Colors.green),
              backgroundColor: Colors.white,
              direction: Axis.horizontal,
              center: Text(
                  '${widget.products.length - _dailyReportQueue.length}/${widget.products.length}'),
            );
          }),
      body: GestureDetector(
        //InkWell
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.primaryVelocity! > 0) {
            _nextProduct(context);
          } else {
            _defer(context);
          }
        },
        child: Builder(builder: (context) {
          if (_dailyReportQueue.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.all_done.tr(),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const Icon(
                    Icons.favorite,
                    size: 100,
                    color: AppColors.mainRed,
                  ),
                ],
              ),
            );
          }

          var dailyReport = _dailyReportQueue.first;

          return Form(
            key: _dailyReportFormKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                  top: 10,
                ),
                child: Column(
                  children: [
                    SingleProductView(product: dailyReport.product),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        left: 10,
                      ),
                      child: TextFormField(
                        controller: _quantityController,
                        validator: (value) => value == null || value.isEmpty
                            ? LocaleKeys.quantityError.tr()
                            : null,
                        decoration: InputDecoration(
                            labelText: LocaleKeys.quantity.tr(),
                            labelStyle: const TextStyle(
                              fontSize: 18,
                              color: AppColors.mainBlack,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.mainBlack),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.mainBlack),
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        left: 10,
                      ),
                      child: TextFormField(
                        controller: _commentController,
                        maxLines: 4,
                        maxLength: 255,
                        decoration: InputDecoration(
                          labelText: LocaleKeys.comment.tr(),
                          labelStyle: const TextStyle(
                            fontSize: 18,
                            color: AppColors.mainBlack,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.mainBlack),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.mainBlack),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: 350,
                          child: CustomButton(
                              label: LocaleKeys.confirm.tr(),
                              onPress: () => _nextProduct(context))),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void _nextProduct(BuildContext context) {
    if (!_dailyReportFormKey.currentState!.validate()) return;

    _dailyReportQueue.first
      ..comment = _commentController.text
      ..quantity = double.tryParse(_quantityController.text);

    _dailyReportBloc
        .add(PostDailyReportEvent(dailyReport: _dailyReportQueue.first));
    setState(
      () {
        _dailyReportQueue.add(_dailyReportQueue.first);
        _dailyReportQueue.removeFirst();

        _commentController.clear();
        _quantityController.clear();
      },
    );
  }

  void _defer(BuildContext context) {
    setState(
      () {
        _dailyReportQueue.add(_dailyReportQueue.first);
        _dailyReportQueue.removeFirst();

        _commentController.clear();
        _quantityController.clear();
      },
    );
  }
}
