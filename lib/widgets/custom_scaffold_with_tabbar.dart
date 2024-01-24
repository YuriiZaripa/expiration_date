import 'package:expiration_date/core/thema/app_colors.dart';
import 'package:flutter/material.dart';

class CustomScaffoldWithTabBar extends StatelessWidget {
  const CustomScaffoldWithTabBar({
    super.key,
    required this.exchangeList,
    required this.writeOffList,
    required this.returnList,
  });

  final Widget exchangeList;
  final Widget writeOffList;
  final Widget returnList;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.mainWhite,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('SUPPLIER'),
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
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                          ),
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 0),
                          unselectedLabelStyle: const TextStyle(
                            color: AppColors.mainWhite,
                            fontWeight: FontWeight.w300,
                          ),
                          indicator: BoxDecoration(
                            color: AppColors.indicatorRed,
                            border: Border.all(
                              color: AppColors.mainBlack,
                              width: 2,
                            ),
                          ),
                          tabs: [
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                    color: AppColors.mainBlack,
                                    width: 1,
                                  ),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: const Text(
                                  "EXCHANGE",
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                      color: AppColors.mainBlack, width: 1),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: const Text(
                                  "WRITE-OFF",
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                      color: AppColors.mainBlack, width: 1),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: const Text(
                                  "RETURN",
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
        body: TabBarView(
          children: [
            exchangeList,
            writeOffList,
            returnList,
          ],
        ),
      ),
    );
  }
}