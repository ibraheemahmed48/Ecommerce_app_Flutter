import 'package:ecommerce_app/app/widgets/product_card_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/product.dart';
import '../screens/User/product_details_screen.dart';
import '../services/home_services.dart';
import 'loader.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  List<Product>? productList;
  HomeService homeService = HomeService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCategories();
  }

  fetchCategories() async {
    productList = await homeService.dealOfProducts(context: context);
    setState(() {});
    print(productList?.length);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: AppLocalizations.of(context)!.localeName=="en"?
             Alignment.topLeft:Alignment.topRight,
          padding:AppLocalizations.of(context)!.localeName=="en"?
          const EdgeInsets.only(left: 10, top: 15):
          const EdgeInsets.only(right: 10, top: 15),
          child:Text(
            AppLocalizations.of(context)!.dealOfTheDay,
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
            height: 3 * 140,
            width: double.infinity,
            child: productList == null
                ? const Loader()
                : Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ProductDetailScreen.routeName,
                            arguments: productList![0],
                          );
                        },
                        child: ProductCardHorizontal(
                          product: productList![0],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ProductDetailScreen.routeName,
                            arguments: productList![1],
                          );
                        },
                        child: ProductCardHorizontal(
                          product: productList![1],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ProductDetailScreen.routeName,
                            arguments: productList![2],
                          );
                        },
                        child: ProductCardHorizontal(
                          product: productList![2],
                        ),
                      ),
                    ],
                  ))
      ],
    );
  }
}
