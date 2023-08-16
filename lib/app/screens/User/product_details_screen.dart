import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

import '../../../components/declarations.dart';
import '../../../providers/user_provider.dart';
import '../../models/product.dart';
import '../../services/product_services.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  static const String routeName = '/product-detail';
  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductServices productServices = ProductServices();
  double avgRating = 0;
  double userRating = 0;
  double height = 10;

  @override
  void initState() {
    super.initState();
    double totalRating = 0;
    var user = Provider.of<UserProvider>(context, listen: false).user;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId == user.id) {
        userRating = widget.product.rating![i].rating;
      }
    }
    if (totalRating > 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        flexibleSpace: Container(
          decoration:
              const BoxDecoration(gradient: Declarations.appBarGradient),
        ),
        title: Text(
          widget.product.name,
          overflow: TextOverflow.ellipsis,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: widget.product.images.map(
                (i) {
                  return Builder(
                    builder: (BuildContext context) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FadeInImage.assetNetwork(
                          placeholder: 'assets/images/logo.png',
                          image: i,
                          fit: BoxFit.contain,
                          placeholderFit: BoxFit.contain,
                          height: 250,
                        ),
                        Container(
                          color: Colors.transparent,
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.arrow_back_ios),
                              Text(
                                "${(widget.product.images.indexOf(i) + 1).toString()} of ${widget.product.images.length}",
                                style: const TextStyle(fontSize: 18),
                              ),
                              const Icon(Icons.arrow_forward_ios),
                            ],
                          )),
                        )
                      ],
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                animateToClosest: true,
                viewportFraction: 1,
                height: 300,
              ),
            ),
            Container(
              color: Colors.black12,
              height: height,
            ),                 //height
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${widget.product.price}',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black12,
              height: height,
            ),                 //height
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.product.description,
                      overflow: TextOverflow.fade,
                      style:
                          const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                  ),



                ],
              ),
            ),
            Container(
              color: Colors.black12,
              height: height,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Rate The Product: ',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: RatingBar.builder(
                  initialRating: userRating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 0),
                  itemBuilder: (context, _) {
                    return const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 5,
                    );
                  },
                  onRatingUpdate: (rating) {
                    productServices.rateProduct(
                        context: context,
                        product: widget.product,
                        rating: rating);
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.menu,
        activeIcon: Icons.close,
        backgroundColor: Colors.deepOrangeAccent,
        foregroundColor: Colors.white,
        activeBackgroundColor: Colors.deepPurpleAccent,
        activeForegroundColor: Colors.white,
        buttonSize: const Size(56, 56),
        visible: true,
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        onOpen: () {},
        onClose: () {},
        elevation: 8.0,
        shape: const CircleBorder(),
        children: [
          SpeedDialChild(
            child: const Icon(Icons.shopping_cart_outlined),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            label: 'Add to Cart',
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () {
              // productServices.addProductToCart(
              //     context: context,
              //     product: widget.product,
              //     qty: 1
              // );
              //Navigator.pop(context);
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.monetization_on_outlined),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            label: 'Buy Now',
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
