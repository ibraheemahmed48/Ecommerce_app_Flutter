import 'package:flutter/material.dart';

import '../../../components/declarations.dart';
import '../../models/product.dart';
import '../../services/home_services.dart';
import '../../widgets/loader.dart';

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
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height/6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          border:  Border.all(
                              width: 1.5,
                              color: Colors.black12
                          ),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width/2,
                        padding: const EdgeInsets.all(10),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/logo.png',
                          image:  product.images[0],
                          fit: BoxFit.fitHeight,

                        ),
                      ),
                    ),

                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(product.name,
                          overflow: TextOverflow.ellipsis,),
                      ),
                    ),
                    Text('${product.price} IQD',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    )

                  ],
                )
              ],
            );
          }
      ):const Center(child: Text("NO DATA")),
    );
  }
}
