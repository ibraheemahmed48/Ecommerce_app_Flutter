import 'package:flutter/material.dart';
import '../../../components/declarations.dart';
import '../../models/product.dart';
import '../../services/home_services.dart';
import '../../widgets/loader.dart';
import '../../widgets/product_card.dart';

class CategoryDealScreen extends StatefulWidget {
  static const String routeName ='/Category-Deal';

  final String category;
  const CategoryDealScreen({super.key, required this.category});

  @override
  State<CategoryDealScreen> createState() => _CategoryDealScreenState();
}

class _CategoryDealScreenState extends State<CategoryDealScreen> {
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
    productList = await homeService.getCategoryProducts(
        context: context,
        category: widget.category);
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
            Text(widget.category,
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
            return ProductCard(product: product, isLiked: false,);
          }
      ):const Center(child: Text("NO DATA")),
    );
  }
}
