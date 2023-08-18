import 'package:ecommerce_app/app/models/product.dart';
import 'package:flutter/material.dart';

import '../screens/User/product_details_screen.dart';
class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product, required this.isLiked});
  final Product product;
  final bool isLiked;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.pushNamed(
          context,
          ProductDetailScreen.routeName,
          arguments: widget.product,
        );
      },
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
        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
          child:  Stack(
            alignment: Alignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/logo.png',
                            image:  widget.product.images[0],
                            fit: BoxFit.fitHeight,
                          ),
                        )
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.product.name,
                          overflow:TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text("${widget.product.price} IQD",
                          overflow:TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red
                          ),
                        ),
                      ],
                    ),


                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Best Sale",

                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                          color: Colors.red
                        ),
                      ),
                    ),

                  ],
                ),
              ),







              Positioned(
                  left: 0,
                  top: 0,
                  child: IconButton(
                    icon: Icon(
                      widget.isLiked? Icons.favorite:Icons.favorite_border,
                      color:  widget.isLiked?Colors.red:Colors.red,
                    ),
                    onPressed: (){
                    },
                  )
              ),

            ],
          ),
        ),

      ),
    );
  }
}
