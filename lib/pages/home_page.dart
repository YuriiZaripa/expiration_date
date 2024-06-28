import 'package:easy_localization/easy_localization.dart';
import 'package:expiration_date/core/language.dart';
import 'package:expiration_date/core/thema/app_colors.dart';
import 'package:expiration_date/generated/locale_keys.g.dart';
import 'package:expiration_date/pages/daily_report_page/daily_report_page.dart';
import 'package:expiration_date/pages/input_product_page/supplier_input_page.dart';
import 'package:expiration_date/pages/product_page/product_page.dart';
import 'package:expiration_date/pages/supplier_page/supplier_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'widgets/custom_button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhite,
      appBar: AppBar(
        backgroundColor: AppColors.mainRed,
        centerTitle: true,
        title: const Text(
          'OKWINE',
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [languagesDropdownMenu()],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            child: SvgPicture.asset(
              'images/cheese.svg',
              width: 300,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                width: 350,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      child: CustomButton(
                        label: LocaleKeys.daily_report.tr(),
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DailyReportPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      child: CustomButton(
                        label: LocaleKeys.weekly_report.tr(),
                        onPress: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      child: CustomButton(
                        label: LocaleKeys.add_supplier.tr(),
                        onPress: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      child: CustomButton(
                        label: LocaleKeys.add_product.tr(),
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SupplierInputPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      child: CustomButton(
                        label: LocaleKeys.all_supplier.tr(),
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SupplierPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    CustomButton(
                      label: LocaleKeys.all_products.tr(),
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget languagesDropdownMenu() {
    return SizedBox(
      child: PopupMenuButton<Language>(
        icon: const Icon(
          Icons.language,
          color: AppColors.mainBlack,
        ),
        onSelected: (language) {
          context.setLocale(
            Locale(language.languageCode),
          );
        },
        itemBuilder: (_) => Language.languageList()
            .map(
              (e) => PopupMenuItem<Language>(
                value: e,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      e.flag,
                      style: const TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(e.name),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
