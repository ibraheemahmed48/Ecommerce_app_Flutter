import 'package:ecommerce_app/app/router.dart';
import 'package:ecommerce_app/app/screens/splash_screen.dart';
import 'package:ecommerce_app/components/declarations.dart';
import 'package:ecommerce_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider())
      ],
  child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override

  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce-app',

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Declarations.backgroundColor
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home:const SplashScreen()

    );
  }
}
