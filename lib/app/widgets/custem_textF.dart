import 'package:flutter/material.dart';

class CustemText extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxline;
  final IconData? icon;
  final bool isPassword ;



  const CustemText({Key? key,
    required this.controller,
    required this.hintText,
     this.maxline = 1,
    this.icon,
    this.isPassword = false
  }) : super(key: key);

  @override
  State<CustemText> createState() => _CustemTextState();
}

class _CustemTextState extends State<CustemText> {
  bool inVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inVisible !=widget.isPassword;

  }
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText: inVisible,

      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: widget.icon !=null?Icon(widget.icon):null,
        suffixIcon: widget.isPassword ? IconButton(
            onPressed: (){
              setState(() {
                inVisible =  !inVisible;
              });

            },
            icon: Icon(inVisible ? Icons.visibility_off:Icons.visibility)
        ):null,
        hintText: widget.hintText,
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
          return "Enter your ${widget.hintText}";
        }
        return null;


      },
      maxLines: widget.maxline,

    );
  }
}
