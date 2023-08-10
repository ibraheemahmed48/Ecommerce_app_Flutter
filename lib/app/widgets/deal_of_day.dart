import 'package:flutter/material.dart';
class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SingleChildScrollView(
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 10,top: 15),
            child: const Text("Deal of the day",
              style: TextStyle(fontSize: 20),),
          ),
        ),
        FadeInImage.assetNetwork(
          placeholder: 'assets/images/logo.png',
          image:"http://via.placeholder.com/500x300/A2FF00/FFF",
          fit: BoxFit.cover,

        ),
      ],
    );
  }
}
