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
            builder: (BuildContext context) =>
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20),

                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/logo.png',
                        image: e,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )

                )

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
/*
FadeInImage.assetNetwork(
              placeholder: 'assets/images/logo.png',
              image: e,
              fit: BoxFit.cover,
              height: 200,

            ),
* */