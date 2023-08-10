import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../components/declarations.dart';
class CarouselImage extends StatelessWidget {
  const CarouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    return
      CarouselSlider(
        items: Declarations.carouselImages.map((e)  {
          return Builder(
            builder: (BuildContext context) => FadeInImage.assetNetwork(
              placeholder: 'assets/images/logo.png',
              image: e,
              fit: BoxFit.cover,
              height: 200,

            ),

        );
        }).toList(),
        options: CarouselOptions(
          viewportFraction: 1,
          height: 200,
          autoPlay: true,
        )
      );
  }
}
