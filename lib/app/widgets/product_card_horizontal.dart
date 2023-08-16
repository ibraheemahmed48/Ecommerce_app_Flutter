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

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              FadeInImage.assetNetwork(
                placeholder: 'assets/images/logo.png',
                image:  product.images[0],
                fit: BoxFit.contain,
                width: 135,
                height: 135,
              ),
              Column(
                children: [
                  Container(
                    width: 235,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
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
                    child:const Text("Eligible For FREE Shipping")
                    //Text(AppLocalizations.of(context)!.eligibleForFREEShipping),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      "In Stock",
                      //AppLocalizations.of(context)!.inStock,
                      style: const TextStyle(
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
      ],
    );
  }
}
