import 'package:ecommerce_app/app/widgets/product_card_horizontal.dart';
import 'package:flutter/material.dart';

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
    productList = await homeService.dealOfProducts(
        context: context);
    setState(() {});
    print(productList?.length);
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10,top: 15),
          child: const Text("Deal of the day",
            style: TextStyle(fontSize: 20),),
        ),
        SizedBox(
            height: 3*140,
            width: double.infinity,
            child: productList == null ? const Loader() : ListView.builder(
              itemCount: productList!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ProductDetailScreen.routeName,
                      arguments: productList![index],
                    );
                  },
                  child: ProductCardHorizontal(
                    product: productList![index],
                  ),
                );
              },)
        )
      ],
    );

  }
}






