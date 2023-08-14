import 'package:ecommerce_app/app/router.dart';
import 'package:ecommerce_app/app/services/auth_services.dart';
import 'package:ecommerce_app/components/declarations.dart';
import 'package:ecommerce_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/screens/auth_screen.dart';
import 'app/screens/Admin/admin_screen.dart';
import 'app/screens/User/user_screen.dart';

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
  final AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(context);

  }
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
      home:
      Provider.of<UserProvider>(context,listen: false).user.token.isNotEmpty ?
      Provider.of<UserProvider>(context).user.type=='user' ?
           const UserScreen()
          : const AdminScreen()
          : const AuthScreen()
    );
  }
}
