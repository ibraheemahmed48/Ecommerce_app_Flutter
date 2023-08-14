import 'package:flutter/material.dart';

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
      height: 65,
      
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemExtent:75 ,
          itemCount: Declarations.catImages.length,
          itemBuilder: (context , index){
            return GestureDetector(
              onTap: (){
                topCategories(context , Declarations.catImages[index]["title"]!);

              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(Declarations.catImages[index]["image"]!,
                    fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const SizedBox(height: 2,),
                  Text(Declarations.catImages[index]["title"]!)
                ],
              ),
            );

      }),



    );
  }
}
