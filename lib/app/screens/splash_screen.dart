import 'package:ecommerce_app/app/screens/User/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';
import '../services/auth_services.dart';
import 'Admin/admin_screen.dart';
import 'auth_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/Splash-Screen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(context);

    Future.delayed(const Duration(seconds: 2) ,(){
      service();
    });
  }


  void service() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    if (userProvider.user.token.isNotEmpty) {
        Navigator.pushNamedAndRemoveUntil(
            context, UserScreen.routeName, (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, AuthScreen.routeName, (route) => false);
    }
  }




  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset("assets/images/logo.png",
            width:300,
            ),
            const CircularProgressIndicator(),

          ],
        ),
      ),

    );
  }
}
