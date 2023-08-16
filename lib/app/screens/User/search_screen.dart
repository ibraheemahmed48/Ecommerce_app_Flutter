import 'package:ecommerce_app/app/screens/User/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../components/declarations.dart';
import '../../models/product.dart';
import '../../services/home_services.dart';
import '../../widgets/loader.dart';
import '../../widgets/product_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.searchText});
  static const String routeName = "/Search-Screen";
  final String searchText;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? productList ;
  bool isEmpty = false;

  HomeService homeService= HomeService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCategory();
  }

  fetchCategory() async {
    productList = await homeService.searchForProducts(
        context: context,
        text: widget.searchText);
    if(productList!.isEmpty){
      isEmpty = true;
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: Declarations.appBarGradient
          ),
        ),
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Search result for ${widget.searchText}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            )

          ],
        ),
      ),
      body: productList == null?
      const Loader():
      isEmpty ==false?
      GridView.builder(
          padding: const EdgeInsets.only(top: 10),
          itemCount: productList!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,

          ),
          itemBuilder: (context , index){
            final product = productList![index];
            return  ProductCard(product: product, isLiked: false,);
          }
      ):const Center(child: Text("NO DATA")),
    );
  }
}
