 import 'package:flutter/material.dart';
String urlDb ="http://10.0.2.2:3020";
class Declarations{
  static const GF = Color.fromRGBO(73, 255, 0, 1.0);

  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 201, 29, 126),
      Color.fromARGB(255, 221, 125, 187),
    ],
    stops: [0.5, 1.0],
  );
  static const appBarGradient2 = LinearGradient(
    colors: [
      Color.fromARGB(255, 221, 125, 187),
      Color.fromARGB(255, 201, 29, 126),
    ],
    stops: [0.5, 1.0],
  );
  static const primaryColor = Color.fromARGB(255, 201, 29, 126);

  static const secondaryColor = Color.fromRGBO(162, 255, 0, 1.0);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundColor = Color(0xffabacd3);
  static var selectedNavBarColor = const Color.fromARGB(255, 41, 59, 185);
  static const unselectedNavBarColor = Color.fromARGB(255, 0, 0, 0);

  static const List<Map<String , String>> catImages = [
    {
      'title' : 'Mobile',
      'image' :'assets/images/mobile.png'
    },
    {
      'title' : 'Appliance',
      'image' :'assets/images/appliance.png'
    },
    {
      'title' : 'Books',
      'image' :'assets/images/books.png'
    },
    {
      'title' : 'Fashion',
      'image' :'assets/images/clothes.png'
    },
    {
      'title' : 'Computer',
      'image' :'assets/images/computer.png'
    },{
      'title' : 'Essential',
      'image' :'assets/images/essential.png'
    },

  ];




  static const List carouselImages = [
    "http://via.placeholder.com/300x300/FFFC00/FFF",
    "http://via.placeholder.com/500x300/FFFC00/FFF",
    "http://via.placeholder.com/500x300/293BB9/FFF",
    "http://via.placeholder.com/500x300/FF0000/FFF",
    "http://via.placeholder.com/500x300/ABACD3/FFF",
    "http://via.placeholder.com/500x300/ABACD3/FFF",
  ];

  static double checkDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    } else if (value is String) {
      return double.parse(value);
    } else {
      return value;
    }
  }



}





