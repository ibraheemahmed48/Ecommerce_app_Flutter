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
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:
          const BoxDecoration(gradient: Declarations.appBarGradient),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Account',
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            )
          ],
        ),
      ),
      body:  const SingleChildScrollView(
        child:  Column(
          children: [
            // BelowAppBar(),
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
