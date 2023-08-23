import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../components/custom_text_styles.dart';
import '../../components/declarations.dart';
import '../screens/User/category_deal_screen.dart';
class TopCategories extends StatelessWidget {
  const TopCategories({super.key});
  void topCategories(BuildContext context , String category){
   Navigator.pushNamed(context, CategoryDealScreen.routeName,arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 50,
      
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          //itemExtent:120 ,
          itemCount: Declarations.catImages.length,
          itemBuilder: (context , index){
            return GestureDetector(
              onTap: (){
                topCategories(context , Declarations.catImages[index]["title"]!);
              },
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.all(0),
                    child: Center(
                        child: Text(
                            getName(Declarations.catImages[index]['title']!, context),
                          overflow:TextOverflow.ellipsis,
                          style: CustomStyles.getStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              locale:AppLocalizations.of(context)!.localeName
                          ),
                        )
                    )
                ),
              ),
            );

      }),



    );
  }

  String getName(String theName,BuildContext context) {
    switch(theName) {
      case "Mobile":
        return AppLocalizations.of(context)!.mobiles;
      case "Appliance":
        return AppLocalizations.of(context)!.appliances;
      case "Fashion":
        return AppLocalizations.of(context)!.fashion;
      case "Essential":
        return AppLocalizations.of(context)!.essentials;
      case "Books":
        return AppLocalizations.of(context)!.books;
      case "Computer":
        return AppLocalizations.of(context)!.computers;
      default:
        return "";
    }
  }
}
