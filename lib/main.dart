import 'package:ecommerce_app/app/router.dart';
import 'package:ecommerce_app/app/screens/splash_screen.dart';
import 'package:ecommerce_app/components/declarations.dart';
import 'package:ecommerce_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'app/models/language.dart';

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
  static void setLocale(BuildContext context , Locale newlocal){
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newlocal);
  }

}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  setLocale(Locale locale){
    setState(() {
      _locale = locale;

    });

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
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      home:const SplashScreen()

    );
  }
}
