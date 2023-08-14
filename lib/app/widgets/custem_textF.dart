import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustemText extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxline;



  const CustemText({Key? key,
    required this.controller,
    required this.hintText,
     this.maxline = 1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(

      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38
          )
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.black38
            )
        ),
      ),
      validator: (val){
        if(val == null || val.isEmpty){
          return "Enter your $hintText";
        }
        return null;


      },
      maxLines: maxline,

    );
  }
}
