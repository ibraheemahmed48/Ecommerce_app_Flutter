import 'package:ecommerce_app/app/screens/auth_screen.dart';
import 'package:ecommerce_app/app/screens/User/home_screen.dart';
import 'package:ecommerce_app/app/screens/User/user_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {


    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AuthScreen());


    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomeScreen());


    case UserScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const UserScreen());



    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("NO DATA HERE :("),
                ),
              ));
  }
}
