import 'package:easy_localization/easy_localization.dart';
import 'package:expiration_date/core/thema/app_colors.dart';
import 'package:expiration_date/core/utils/utils.dart';
import 'package:expiration_date/domain/entities/product.dart';
import 'package:expiration_date/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
    this.displaySale = true,
    this.displayStockBalance = true,
  });

  final Product product;
  final bool displaySale;
  final bool displayStockBalance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 175,
              width: 130,
              child: Image.network(
                product.sku.image ??
                    'https://img.freepik.com/premium-photo/little-cute-mouse-eats-piece-paper-white-background-closeup-cute-animal_700453-4175.jpg?w=740',
                // 'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg',
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.sku.title,
                      maxLines: 3,
                      style: const TextStyle(
                          color: AppColors.mainBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          height: 1),
                    ),
                    // ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(product.sku.barCode.isNotEmpty
                        ? product.sku.barCode.last
                        : ""),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      product.sku.supplier.supplierName,
                      style: const TextStyle(
                        color: AppColors.secondText,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        height: 1,
                      ),
                    ),
                    SizedBox(
                        height: 50,
                        child: !displayStockBalance == true
                            ? null
                            : Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: const Text('stock_balance').tr(args: [
                                  '${product.sku.stockBalance ?? LocaleKeys.no_data.tr()}'
                                ]),
                              )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        product.produced != null
                            ? Column(
                                children: [
                                  Text('${LocaleKeys.produced.tr()}:'),
                                  Text(DateFormatter.format(product.produced!))
                                ],
                              )
                            : const SizedBox(),
                        Column(
                          children: [
                            Text('${LocaleKeys.expiration_date.tr()}:'),
                            Text(DateFormatter.format(product.expirationDate)),
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
        product.sku.supplier.sale > 0 && displaySale
            ? Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.indicatorRed,
                    border: Border.all(
                      width: 1,
                    ),
                  ),
                  height: 25,
                  width: 150,
                  child: Center(
                    child: Text(
                      '${LocaleKeys.discount.tr()}: ${product.sku.supplier.sale}%',
                      style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              )
            : const SizedBox(
                height: 10,
              ),
      ],
    );
  }
}
