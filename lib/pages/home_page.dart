import 'package:auto_route/auto_route.dart';
import 'package:expiration_date/core/thema/app_colors.dart';
import 'package:expiration_date/pages/supplier_page/supplier_page.dart';
import 'package:expiration_date/router/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/custom_button.dart';

@RoutePage()
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
        centerTitle: true,
        backgroundColor: AppColors.mainRed,
        title: const Text(
          'OKWINE',
          style: TextStyle(
            color: AppColors.mainWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
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
                        label: 'DAILY REPORT',
                        onPress: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      child: CustomButton(
                        label: 'WEEKLY REPORT',
                        onPress: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      child: CustomButton(
                        label: 'ADD PRODUCT',
                        onPress: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      child: CustomButton(
                        label: 'ADD SUPPLIER',
                        onPress: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      child: CustomButton(
                        label: 'ALL SUPPLIERS',
                        onPress: () {
                          context.router.push(
                            SupplierRoute(),
                          );
                        },
                      ),
                    ),
                    CustomButton(
                      label: 'ALL PRODUCTS',
                      onPress: () {},
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
}
