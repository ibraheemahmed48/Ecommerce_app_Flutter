import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 2,

      content: Text(
        text,
        style: const TextStyle(
          // Customize the text style here
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.grey, // Customize the background color
      duration: const Duration(seconds: 3), // Customize the display duration

    ),
  );
}




Future <List<File>> pickImages() async {
 List<File> images = [];
 try {
   var files = await FilePicker.platform.pickFiles(
     type: FileType.image,
     allowMultiple: true
   );
   if(files != null && files.files.isNotEmpty){
     for(int i = 0 ; i<files.files.length;i++){
       images.add(File(files.files[i].path!));
     }
   }
 }catch (e){
   debugPrint(e.toString());
 }

 return images;
}


showAlertDialog(BuildContext context , VoidCallback onOk , String textHead, String textMsg){
Widget cancelButton = TextButton(
    onPressed: (){
      Navigator.pop(context);
    },

    child: const Text("Cancel")
);
Widget oKButton = TextButton(
    onPressed: onOk,

    child: const Text("OK")
);

AlertDialog alertDialog = AlertDialog(
  title: Text(textHead),
  content: Text(textMsg),
  actions: [
    cancelButton,
    oKButton
  ],
  );

  showDialog(context: context,
      builder: (BuildContext context){
      return alertDialog;
      }
  );
}


showAlertDialog2(BuildContext context  , String textHead, String textMsg){
  Widget cancelButton = TextButton(
      onPressed: (){
        Navigator.pop(context);
      },

      child: const Text("OK")
  );


  AlertDialog alertDialog = AlertDialog(
    title: Text(textHead),
    content: Text(textMsg),
    actions: [
      cancelButton,

    ],
  );

  showDialog(context: context,
      builder: (BuildContext context){
        return alertDialog;
      }
  );




}


String getStatus(int value) {
  switch(value) {
    case 0:
      return "preparing";
    case 1:
      return "Preparing";
    case 2:
      return "Ready";
    case 3:
      return "On Way";
    case 4:
      return "Completed";
    default:
      return "preparing";
  }
}


String adminAppBar(int value) {
  switch(value) {
    case 0:
      return "Posts";
    case 1:
      return "Analytics";
    case 2:
      return "Orders";
    default:
      return "Posts";
  }
}

Color? getStatusColor1(int value) {
  switch(value) {
    case 0:
      return Colors.green;
    case 1:
      return Colors.blue;
    case 2:
      return Colors.yellowAccent;
    case 3:
      return Colors.deepOrange;
    case 4:
      return Colors.red;
    default:
      return Colors.green;
  }
}


double getProportionateScreenHeight(double inputHeight, BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  return (inputHeight / 812.0) * screenHeight;
}

double getProportionateScreenWidth(double inputWidth, BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return (inputWidth / 375.0) * screenWidth;
}