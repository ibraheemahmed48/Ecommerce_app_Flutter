import 'package:ecommerce_app/app/widgets/order.dart';
import 'package:ecommerce_app/components/declarations.dart';
import 'package:flutter/material.dart';
import '../../widgets/below_appBar.dart';
import '../../widgets/top_button.dart';
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: Declarations.appBarGradient
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset("assets/images/logo.png",
                  width: 95,
                    height: 45,

                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(Icons.notifications),
                      ),
                      Icon(Icons.search),
                    ],
                  ),
                )

              ],
            ),
          ),
      ),
      body:  const SingleChildScrollView(
        child:  Column(
          children: [
            BelowAppBar(),
            SizedBox(
              height: 10,
            ),
            TopButtons(),

            SizedBox(
              width: 10,
            ),
            Orders()
          ],
        ),
      ),
    );
  }
}
