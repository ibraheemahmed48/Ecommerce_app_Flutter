import 'package:flutter/material.dart';

import 'accountbtuuon.dart';
class TopButton extends StatefulWidget {
  const TopButton({super.key});

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          children: [
            AccountButton(text: 'My Order', onClick: () {  },),
            AccountButton(text: 'Be Seller', onClick: () {  },)


          ],
        ),
        Row(
          children: [
            AccountButton(text: 'Wish List', onClick: () {  },),
            AccountButton(text: 'Log Out', onClick: () {  },)


          ],
        ),
      ],
    );
  }
}
