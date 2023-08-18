import 'package:ecommerce_app/app/screens/Admin/add_product.dart';
import 'package:ecommerce_app/app/screens/User/address_screen.dart';
import 'package:ecommerce_app/app/screens/User/category_deal_screen.dart';
import 'package:ecommerce_app/app/screens/User/product_details_screen.dart';
import 'package:ecommerce_app/app/screens/User/search_screen.dart';
import 'package:ecommerce_app/app/screens/auth_screen.dart';
import 'package:ecommerce_app/app/screens/User/home_screen.dart';
import 'package:ecommerce_app/app/screens/User/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/app/screens/splash_screen.dart';

import 'models/product.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {


    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AuthScreen());



    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) =>  AddressScreen(
        totalAmount: totalAmount,

      ));


    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomeScreen());


    case UserScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const UserScreen());

    case AddProduct.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AddProduct());

    case SplashScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const SplashScreen());

    case CategoryDealScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) =>  CategoryDealScreen(
        category: category,));


    case SearchScreen.routeName:
      var txt = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) =>  SearchScreen(searchText: txt,));



    case ProductDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) =>  ProductDetailScreen( product: product,));


    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("NO DATA HERE :("),
                ),
              ));
  }
}
