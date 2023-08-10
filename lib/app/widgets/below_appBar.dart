import 'package:ecommerce_app/components/declarations.dart';
import 'package:ecommerce_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return  Container(
      decoration: const BoxDecoration(
        gradient: Declarations.appBarGradient
      ),
      child: Row(
        children:[
          RichText(
              text: TextSpan(
                  text: "Hello , ",
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black
                  ),
                  children: [
                    TextSpan(
                      text: user.name,
                      style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),

                    )
                  ]
              )
          ),
        ]
      ),
    );
  }
}
