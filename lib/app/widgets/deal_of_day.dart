import 'package:ecommerce_app/app/widgets/product_card_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../components/custom_text_styles.dart';
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
    String _locale=AppLocalizations.of(context)!.localeName;

    return Column(
      children: [
        Container(
          alignment: AppLocalizations.of(context)!.localeName=="en"?
             Alignment.topLeft:Alignment.topRight,
          padding:AppLocalizations.of(context)!.localeName=="en"?
          const EdgeInsets.only(left: 10, top: 0):
          const EdgeInsets.only(right: 10, top: 0),
          child:Text(
            AppLocalizations.of(context)!.dealOfTheDay,
            style: CustomStyles.getStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                locale:AppLocalizations.of(context)!.localeName
            )
          ),
        ),
        SizedBox(
            height: 3 * 155,
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
