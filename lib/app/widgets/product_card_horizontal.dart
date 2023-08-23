import 'package:ecommerce_app/app/widgets/stars_bar.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';


class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    double avgRating = 0;
    double totalRating =0;
    for (int i = 0; i < product.rating!.length; i ++) {
      totalRating += product.rating![i].rating;
    }
    if (totalRating > 0) {
      avgRating = totalRating /  product.rating!.length;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 5),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20),),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black12,
                  blurRadius:10,
                  spreadRadius: 5
              )
            ]
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Row(
          children: [
            Container(
              width: 135,
              height: 135,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),

              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/logo.png',
                  image:  product.images[0],
                  fit: BoxFit.contain,

                ),
              ),
            ),





            Column(
              children: [
                Container(
                  width: 235,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    overflow:TextOverflow.ellipsis,
                    product.name,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    maxLines: 2,
                  ),
                ),
                Container(
                  width: 235,
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: StarsBar(
                    rating: avgRating,
                  ),
                ),
                Container(
                  width: 235,
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    overflow:TextOverflow.ellipsis,

                    '\$${product.price}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                ),
                Container(
                  width: 235,
                  padding: const EdgeInsets.only(left: 10),
                  child:const Text("Eligible For FREE Shipping",
                    overflow:TextOverflow.ellipsis,
                  ),
                  //Text(AppLocalizations.of(context)!.eligibleForFREEShipping),
                ),
                Container(
                  width: 235,
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: const Text(
                    overflow:TextOverflow.ellipsis,

                    "In Stock",
                    //AppLocalizations.of(context)!.inStock,
                    style: TextStyle(
                      color: Colors.teal,
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
