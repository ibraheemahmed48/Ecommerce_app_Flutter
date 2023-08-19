import 'package:ecommerce_app/app/models/language.dart';
import 'package:ecommerce_app/app/screens/User/search_screen.dart';
import 'package:flutter/material.dart';
import '../../../components/declarations.dart';
import '../../../main.dart';
import '../../widgets/addresbar.dart';
import '../../widgets/carousel_image.dart';
import '../../widgets/deal_of_day.dart';
import '../../widgets/top_categories.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName ='/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  void searchForProduct(String text){
    Navigator.pushNamed(context, SearchScreen.routeName,arguments: text);
  }
  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      appBar:PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: Declarations.appBarGradient
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted:searchForProduct,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: (){},
                          child:  const Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Icon(Icons.search,color: Colors.black,size: 23,),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          borderSide: BorderSide.none
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide: BorderSide(
                              color: Colors.black38,
                              width: 1
                            )
                        ),
                        hintText: AppLocalizations.of(context)!.searchInMySouq

                      ),
                    ),
                  )
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                child: DropdownButton<Language>(
                  underline: const SizedBox(),
                  icon: const Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                  onChanged: (Language? language)  {
                    setState(() {

                    });
                    if (language != null) {
                      MyApp.setLocale(context, Locale(language.languageCode, ''));
                    }
                  },
                  items: Language.languageList()
                      .map<DropdownMenuItem<Language>>(
                        (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ).toList(),
                ),
              )
            ],



          ),
        ),
      ),
      body:const Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    AddressBar(),       //40
                    SizedBox(height: 10,),     //10
                    TopCategories(),               //65
                    SizedBox(height: 10,),          //10
                    CarouselImage(),                 //200
                    SizedBox(height: 10,),             //10
                  ],
                ),

                DealOfDay(),
              ],
            ),
          ),


        ],
      ),

    );
  }
}
