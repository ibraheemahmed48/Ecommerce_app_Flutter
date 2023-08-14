import 'dart:convert';

import 'package:ecommerce_app/components/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

void httpErrorHandel({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess
}){
  print("httpErrorHandel");
  switch(response.statusCode){
    case 200:
      print("httpErrorHandel : 200");
      onSuccess();
      break;


    case 400:
      print("httpErrorHandel : 400");
      showSnackBar(context,jsonDecode(response.body)["msg"]);
      break;

    case 500:
      print("httpErrorHandel : 500");
      showSnackBar(context,jsonDecode(response.body)["error"]);
      break;

    default:
      print("httpErrorHandel : default ${response.body}");
      showSnackBar(context,jsonDecode(response.body));
  }

}