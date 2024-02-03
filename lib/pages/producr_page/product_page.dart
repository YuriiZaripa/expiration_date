import 'dart:math';

import 'package:expiration_date/core/thema/app_colors.dart';
import 'package:expiration_date/domaine/entities/product.dart';
import 'package:expiration_date/domaine/entities/sku.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late List<Product> products;
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  int mainPadding = 10;

  @override
  void initState() {
    products = _generateProduct();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhite,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.mainRed,
        title: const Text(
          'SKU',
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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: ListView.separated(
              itemCount: products.length,
              itemBuilder: (_, index) {
                var product = products[index];

                return Padding(
                  padding: const EdgeInsets.only(top: 5, right: 5),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                          ),
                        ),
                        height: 175,
                        width: 130,
                        child: Image.network(
                          'https://content.okwine.ua/files/product/61b3452a6ebb0c2d53db12a2/aceb0ff0-c23a-11eb-b2e5-ebee22cc1ffb.jpg',
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.mainRed,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(
                                // width: MediaQuery.of(context).size.width * 0.5, 
                                // child: 
                                Text(
                                  product.sku.title,
                                  maxLines: 3,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                ),
                              // ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(product.sku.barCode.isNotEmpty
                                  ? product.sku.barCode[0]
                                  : ""),
                              const SizedBox(
                                height: 10,
                              ),
                              Text('Supplier: ${product.sku.supplier}'),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  if (product.produced != null)
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        children: [
                                          const Text('Produced:'),
                                          Text(
                                              formatter.format(product.produced!))
                                        ],
                                      ),
                                    ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      const Text('Expiration date:'),
                                      Text(formatter
                                          .format(product.expirationDate)),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
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
            ),
          ),
        ],
      ),
    );
  }

  List<Product> _generateProduct() {
    int barcodeCounter = 4000000000000;
    int vendoredCounter = 50059;
    var rng = Random();

    return List<Product>.generate(
        20,
        (index) => Product(
            id: '$index',
            sku: Sku(
                id: '$index',
                barCode: List.of(['${barcodeCounter++}']),
                title:
                    'Sku with very very very very very very very long naming$index',
                vendorCode: 'УТП0${vendoredCounter++}',
                supplier: 'Supplier title$index'),
            produced: index % 2 == 0 || index % 3 == 0
                ? DateTime.now().subtract(
                    Duration(days: rng.nextInt(200)),
                  )
                : null,
            expirationDate: DateTime.now().add(
              Duration(days: rng.nextInt(600)),
            )));
  }
}
