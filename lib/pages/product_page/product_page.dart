import 'package:expiration_date/core/enums/enums.dart';
import 'package:expiration_date/core/thema/app_colors.dart';
import 'package:expiration_date/pages/product_page/bloc/product_bloc.dart';
import 'package:expiration_date/pages/product_page/bloc/product_event.dart';
import 'package:expiration_date/pages/product_page/bloc/product_state.dart';
import 'package:expiration_date/pages/product_page/widgets/product_list_tipe_widget.dart';
import 'package:expiration_date/widgets/custom_scaffold_with_additions_widget.dart';
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
      additionalAppBarButton: IconButton(
        icon: const Icon(
          Icons.filter_alt,
          color: AppColors.mainBlack,
        ),
        onPressed: () {},
      ),
      appBarAdditions: const Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: "Search",
            suffixIcon: Icon(Icons.search),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: BlocBuilder<ProductBloc, ProductState>(
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
              return const Center(
                child: Text('OOPS!'),
              );
            }

            return ProductListTileWidget(
              products: state.products!,
            );
          },
        ),
      ),
    );
  }
}

// Scaffold
// (
// backgroundColor: AppColors.mainWhite,
// appBar: AppBar(
// centerTitle: true,
// backgroundColor: AppColors.mainRed,
// title: const Text(
// 'PRODUCTS',
// style: TextStyle(
// color: AppColors.white,
// fontWeight: FontWeight.bold,
// ),
// ),
// actions: [
// IconButton(
// icon: const Icon( Icons.filter_alt,
// color: AppColors.mainBlack,
// ),
// onPressed: () {},
// ),
// ],
// bottom: PreferredSize(
// preferredSize: const Size.fromHeight(120),
// child: Padding(
// padding: const EdgeInsets.all(5.0),
// child: Container(
// width: double.infinity,
// decoration: BoxDecoration(
// color: const Color(0xFF242024),
// borderRadius: BorderRadius.vertical(
// top: Radius.elliptical(
// MediaQuery.of(context).size.width,
// 20.0,
// ),
// bottom: Radius.elliptical(
// MediaQuery.of(context).size.width,
// 60.0,
// ),
// ),
// ),
// child: Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 50,
// vertical: 30,
// ),
// child: Column(
// children: [
// Container(
// height: 50,
// decoration: BoxDecoration(
// color: AppColors.mainWhite,
// borderRadius: BorderRadius.circular(5),
// border: Border.all(
// color: AppColors.mainBlack,
// ),
// ),
// child: const Padding(
// padding: EdgeInsets.all(8.0),
// child: TextField(
// decoration: InputDecoration(
// labelText: "Search",
// suffixIcon: Icon(Icons.search),
// ),
// ),
// )
// ),
// ],
// ),
// ),
// ),
// ),
// )
// )
// ,
// body
// :
// //   ],
// // ),
// );
//
// const Padding(
// padding: EdgeInsets.all(8.0),
// child: TextField(
// decoration: InputDecoration(
// labelText: "Search",
// suffixIcon: Icon(Icons.search),
// ),
// ),
// ),
