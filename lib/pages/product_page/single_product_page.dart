import 'package:easy_localization/easy_localization.dart';
import 'package:expiration_date/core/thema/app_colors.dart';
import 'package:expiration_date/domain/entities/product.dart';
import 'package:expiration_date/generated/locale_keys.g.dart';
import 'package:expiration_date/pages/product_page/widgets/single_product_view.dart';
import 'package:expiration_date/pages/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

class SingleProductPage extends StatefulWidget {
  const SingleProductPage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainRed,
        centerTitle: true,
        title: Text(
          LocaleKeys.product_info.tr(),
          style: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Column(
            children: [
              SingleProductView(product: widget.product),
              Padding(
                padding: const EdgeInsets.only(
                  top: 200.0,
                  left: 10.0,
                  right: 10.0,
                ),
                child: SizedBox(
                  width: 350,
                  child:
                      CustomButton(label: LocaleKeys.edit.tr(), onPress: () {}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
