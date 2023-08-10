import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border:  Border.all(
            width: 1.5,
            color: Colors.black12
          ),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white
        ),
        child: Container(
          width: 180,
          padding: const EdgeInsets.all(10),
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/logo.png',
            image: image,
            fit: BoxFit.fitHeight,

          ),
        ),
      ),

    );
  }
}
