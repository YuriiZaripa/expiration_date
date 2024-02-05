import 'package:expiration_date/core/thema/app_colors.dart';
import 'package:expiration_date/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductListTileWidget extends StatelessWidget {
  ProductListTileWidget({
    super.key,
    required this.products,
  });

  final List<Product> products;
  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: products.length,
      itemBuilder: (_, index) {
        var product = products[index];

        return Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // decoration: BoxDecoration(
                    //   border: Border.all(
                    //     width: 1,
                    //   ),
                    // ),
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
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              product.produced != null
                                  ? Column(
                                      children: [
                                        const Text('Produced:'),
                                        Text(
                                            formatter.format(product.produced!))
                                      ],
                                    )
                                  : const SizedBox(),
                              Column(
                                children: [
                                  const Text('Expiration date:'),
                                  Text(
                                      formatter.format(product.expirationDate)),
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
              if (product.sku.supplier.sale > 0)
                Padding(
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
                        'Discount: ${product.sku.supplier.sale}%',
                        style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w800),
                      ),
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
    );
  }
}
