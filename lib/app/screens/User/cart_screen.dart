import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/declarations.dart';
import '../../../providers/user_provider.dart';
import '../../widgets/addresbar.dart';
import '../../widgets/cart_subtotal.dart';
import '../../widgets/product_card_cart.dart';
import 'address_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart.map((e) => sum += e['qty'] * e['product']['price'] as int).toList();
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:
              const BoxDecoration(gradient: Declarations.appBarGradient),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shopping Cart',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          user.cart.isEmpty?
          const  Center(child: Text("NO DATA")):
          Padding(
            padding: const EdgeInsets.only(top: 40,bottom: 50),
            child: ListView.builder(
              itemCount: user.cart.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ProductCardCart(
                  index: index,
                );
              },
            ),
          ),




          const Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 40,
              child: Column(
                children: [
                  AddressBar(),
                ],
              ),
            ),
          ),


          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CartSubtotal(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AddressScreen.routeName, arguments: sum.toString());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Declarations.primaryColor, // Change the button's background color here
                        onPrimary: Colors.white, // Change the text color here
                        padding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "Buy Now",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
 const AddressBar(),
              const CartSubtotal(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  text: 'Proceed to Buy (${user.cart.length} items)',
                  onTap: () {
                    //Navigator.pushNamed(context, AddressScreen.routeName, arguments: sum.toString());
                  },
                ),
              ),
* */
