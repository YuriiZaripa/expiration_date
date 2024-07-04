import 'package:easy_localization/easy_localization.dart';
import 'package:expiration_date/generated/locale_keys.g.dart';
import 'package:expiration_date/core/enums/enums.dart';
import 'package:expiration_date/core/thema/app_colors.dart';
import 'package:expiration_date/pages/product_page/bloc/product_bloc.dart';
import 'package:expiration_date/pages/product_page/bloc/product_event.dart';
import 'package:expiration_date/pages/product_page/bloc/product_state.dart';
import 'package:expiration_date/pages/product_page/single_product_page.dart';
import 'package:expiration_date/pages/product_page/widgets/product_tile.dart';
import 'package:expiration_date/pages/widgets/custom_scaffold_with_additions_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expiration_date/dependency_injection.dart' as di;

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductBloc productBloc = di.getIt.get();

  @override
  void initState() {
    productBloc.add(GetAllProductsEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithAdditionsWidget(
      title:  LocaleKeys.products.tr(),
      additionalAppBarButton: IconButton(
        icon: const Icon(
          Icons.filter_alt,
          color: AppColors.mainBlack,
        ),
        onPressed: () {},
      ),
      appBarAdditions: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: LocaleKeys.search.tr(),
            suffixIcon: const Icon(Icons.search),
              border: InputBorder.none
          ),
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        bloc: productBloc,
        builder: (BuildContext context, ProductState state) {
          if (state.blocStatus == BlocStatus.loading ||
              state.blocStatus == BlocStatus.none) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.mainRed,
              ),
            );
          } else if (state.blocStatus == BlocStatus.error ||
              state.products == null) {
            return Center(
              child: Text(LocaleKeys.error_plug.tr()),
            );
          }
          var products = state.products!;

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: ListView.separated(
              itemCount: products.length,
              itemBuilder: (_, index) {
                var product = products[index];

                return Padding(
                  padding: const EdgeInsets.only(top: 5),

                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SingleProductPage(product: product),
                          ),
                        ),
                        child: ProductTile(
                          product: products[index],
                          displayStockBalance: false,
                        ),
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
          );
        },
      ),
    );
  }
}
