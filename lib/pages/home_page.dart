import 'package:expiration_date/core/thema/app_colors.dart';
import 'package:expiration_date/pages/product_page/product_page.dart';
import 'package:expiration_date/pages/supplier_page/supplier_page.dart';
import 'package:expiration_date/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            color: AppColors.white,
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
                      label: 'ALL PRODUCTS',
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
}
