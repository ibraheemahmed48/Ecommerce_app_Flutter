import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? icon;
  const CustomButton({Key? key, required this.text, required this.onTap, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return icon ==null?ElevatedButton(
        onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),

      ),
        child: Text(text,),
    ):ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        )

      ), icon:Icon(icon,
      size: 25,

    ) , label: Text(text,style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18
    ),),
    );
  }
}
