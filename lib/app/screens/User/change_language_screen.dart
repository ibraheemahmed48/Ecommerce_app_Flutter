import 'package:flutter/material.dart';
import '../../../components/custom_text_styles.dart';
import '../../../components/declarations.dart';
import '../../../main.dart';
import '../../models/language.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home_screen.dart';

class ChangeLanguage extends StatefulWidget {
  static const String routeName ='/changeLanguage';

  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  bool flag =false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:
          const BoxDecoration(gradient: Declarations.appBarGradient),
        ),
        leading:  IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp,)),
        title: const Text(
          'Account',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                height:400 ,
                child: Image.asset(
                  "assets/images/translate-icon.jpg",
                  fit: BoxFit.contain,
                ),
              ),
             Text(
                "Change Language  تغيير اللغة",
              style: CustomStyles.getStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  locale:"ar"
              )
            ),


              const SizedBox(height: 20,),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    elevation: 3,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 22
                    ),
                    backgroundColor: AppLocalizations.of(context)!.localeName=="ar"?
                    const Color(0xffFD5151):Colors.white,
                    // Add text color property
                    onPrimary: Colors.black,
                  ),
                onPressed: (){
                    flag = true;
                    Future.delayed(const Duration(seconds: 2),(){
                      MyApp.setLocale(context, const Locale('ar', ''));
                    });
                Future.delayed(const Duration(seconds: 3),(){
                  setState(() {
                  });
                  flag = false;
                }).then((value) => {
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomeScreen.routeName, (route) => false)
                });
              },

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.arabic,
                      style: CustomStyles.getStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          locale:"ar"
                      ),
                      ),
                      const SizedBox(width: 10,),
                      const Text("🇸🇦"),

                    ],
                  )),

              const SizedBox(height: 20,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    elevation: 3,
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 22
                    ),
                    backgroundColor: AppLocalizations.of(context)!.localeName=="en"?
                    const Color(0xffFD5151):Colors.white,
                    // Add text color property
                    onPrimary: Colors.black,
                  ),
                  onPressed: (){

                    flag = true;
                    Future.delayed(const Duration(seconds: 2),(){
                      MyApp.setLocale(context, const Locale('en', ''));
                    });
                    Future.delayed(const Duration(seconds: 3),(){
                      setState(() {
                      });
                      flag = false;
                    }).then((value) => {
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomeScreen.routeName, (route) => false)
                    });





                  },

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.english,
                        style: CustomStyles.getStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            locale:"ar"
                        ),
                      ),
                      const SizedBox(width: 10,),
                      const Text("🇺🇸"),

                    ],
                  )),
              const SizedBox(height: 20,),

              flag?
              const CircularProgressIndicator(color:Color(0xffFD5151) ,):
                  Container()


            ],
          ),
        ),
      ),
    );
  }
}
