import 'package:easy_localization/easy_localization.dart';
import 'package:expiration_date/core/thema/app_colors.dart';
import 'package:expiration_date/domain/entities/product.dart';
import 'package:expiration_date/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class SingleProductView extends StatelessWidget {
  SingleProductView({super.key, required this.product});

  final Product product;
  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            product.sku.title,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.mainBlack,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              width: 185,
              child: Image.network(
                product.sku.image ??
                    'https://img.freepik.com/premium-photo/little-cute-mouse-eats-piece-paper-white-background-closeup-cute-animal_700453-4175.jpg?w=740',
                // 'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg',
                fit: BoxFit.contain,
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.sku.supplier.supplierName,
                    style: const TextStyle(
                      color: AppColors.secondText,
                      fontSize: 18,
                      height: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (product.sku.barCode.isNotEmpty)
                    Container(
                      constraints: const BoxConstraints(maxHeight: 100.0),
                      height: 200,
                      child: Wrap(
                        spacing: 3,
                        runSpacing: 3,
                        children: product.sku.barCode
                            .map(
                              (barCode) => Text(
                                barCode,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: const Text(
                        'stock_balance',
                        style: TextStyle(
                          color: AppColors.mainBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ).tr(args: [
                        '${product.sku.stockBalance ?? LocaleKeys.no_data.tr()}'
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      product.produced != null
                          ? Column(
                              children: [
                                Text(
                                  '${LocaleKeys.produced.tr()}:',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  formatter.format(product.produced!),
                                  style: const TextStyle(
                                    color: AppColors.mainBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            )
                          : const SizedBox(),
                      Column(
                        children: [
                          Text(
                            '${LocaleKeys.expiration_date.tr()}:',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            formatter.format(product.expirationDate),
                            style: const TextStyle(
                              color: AppColors.mainBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
