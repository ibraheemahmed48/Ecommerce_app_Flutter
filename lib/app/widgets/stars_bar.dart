import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarsBar extends StatelessWidget {
  final double rating;
  const StarsBar({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return  RatingBarIndicator(
      direction: Axis.horizontal,
        itemCount: 5,
        rating: rating,
        itemSize: 15,
        itemBuilder: (context,_){
        return const Icon(Icons.star,
        color: Colors.amber,
        );
        }
    );
  }
}
