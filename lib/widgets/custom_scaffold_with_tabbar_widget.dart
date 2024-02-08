import 'package:easy_localization/easy_localization.dart';
import 'package:expiration_date/core/thema/app_colors.dart';
import 'package:expiration_date/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class CustomScaffoldWithTabBar extends StatelessWidget {
  const CustomScaffoldWithTabBar({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.mainWhite,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            LocaleKeys.suppliers.tr(),
            style: const TextStyle(
              color: AppColors.mainWhite,
              letterSpacing: 1,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: AppColors.mainRed,
          elevation: 15,
          shadowColor: AppColors.mainRed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom:
                  Radius.elliptical(MediaQuery.of(context).size.width, 60.0),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(120),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF242024),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(
                      MediaQuery.of(context).size.width,
                      20.0,
                    ),
                    bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width,
                      60.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 30,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.mainRed,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: AppColors.mainBlack,
                          ),
                        ),
                        child: TabBar(
                          tabAlignment: TabAlignment.center,
                          isScrollable: true,
                          padding: const EdgeInsets.symmetric(
                            vertical: 7,
                          ),
                          labelColor: AppColors.mainWhite,
                          labelStyle: const TextStyle(
                            fontSize: 11,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                          ),
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 0),
                          unselectedLabelStyle: const TextStyle(
                            fontSize: 11,
                            color: AppColors.mainWhite,
                            fontWeight: FontWeight.w300,
                          ),
                          indicator: BoxDecoration(
                            color: AppColors.indicatorRed,
                            border: Border.all(
                              color: AppColors.mainBlack,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          tabs: [
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: AppColors.mainBlack,
                                    width: 2,
                                  ),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  LocaleKeys.exchange.tr(),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: AppColors.mainBlack,
                                    width: 2,
                                  ),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  LocaleKeys.write_off.tr(),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: AppColors.mainBlack,
                                    width: 2,
                                  ),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  LocaleKeys.regular.tr(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: body,
      ),
    );
  }
}
