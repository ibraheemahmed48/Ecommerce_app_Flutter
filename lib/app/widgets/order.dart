import 'package:ecommerce_app/app/widgets/single_product.dart';
import 'package:ecommerce_app/components/declarations.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List list =[
    "http://via.placeholder.com/250x150/100000/FFF",
    "http://via.placeholder.com/350x150/100000/FFF",
    "http://via.placeholder.com/450x150/100000/FFF",
    "http://via.placeholder.com/650x150/100000/FFF",
    "http://via.placeholder.com/150x150/100000/FFF"
  ];

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
             child: const Text(
               "My Orders",
               style: TextStyle(
                 fontSize: 18,
                 fontWeight: FontWeight.w500,

               ),
             ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child:  Text(
                "View All",
                style: TextStyle(
                  fontSize: 15,
                  color: Declarations.selectedNavBarColor,

                ),
              ),
            ),
          ],
        ),
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10,right: 5,top: 20),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
              itemBuilder: ((context , index){
               return  SingleProduct(image: list[index],);
              })
          ),
        )
      ],
    );
  }
}
