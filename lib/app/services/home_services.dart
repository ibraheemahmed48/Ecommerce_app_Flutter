import 'dart:convert';

import 'package:ecommerce_app/app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../components/declarations.dart';
import '../../components/error_handling.dart';
import '../../components/utils.dart';
import '../../providers/user_provider.dart';
class HomeService{
  Future<List<Product>>getCategoryProducts({
    required BuildContext context,
    required String category

}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productsList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$urlDb/api/get-products?category=$category'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'myApp': userProvider.user.token
        },
      );
      print("userProvider : ${userProvider.user.name}");
      print("userProvider : ${userProvider.user.token}");
      print("userProvider : ${userProvider.user.type}");
      print("body : ${res.body}");


      httpErrorHandel(
          response: res,
          context: context,
          onSuccess: () {
            for (int i =0; i < jsonDecode(res.body).length; i ++) {
              productsList.add(
                Product.fromJson(
                    jsonEncode(jsonDecode(res.body)[i])
                ),
              );
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productsList;

}



  Future<List<Product>>searchForProducts({
    required BuildContext context,
    required String text

  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productsList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$urlDb/api/get-products/search/$text'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'myApp': userProvider.user.token
        },
      );
      print("userProvider : ${userProvider.user.name}");
      print("userProvider : ${userProvider.user.token}");
      print("userProvider : ${userProvider.user.type}");
      print("body : ${res.body}");


      httpErrorHandel(
          response: res,
          context: context,
          onSuccess: () {
            for (int i =0; i < jsonDecode(res.body).length; i ++) {
              productsList.add(
                Product.fromJson(
                    jsonEncode(jsonDecode(res.body)[i])
                ),
              );
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productsList;

  }


  Future<List<Product>> dealOfProducts({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productsList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$urlDb/api/deal-of-the-day'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'myApp': userProvider.user.token
        },
      );

      httpErrorHandel(response: res, context: context, onSuccess: () {
        for (int i = 0; i < jsonDecode(res.body).length; i ++) {
          productsList.add(
              Product.fromJson(
                  jsonEncode(jsonDecode(res.body)[i])
              )
          );
        }
      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productsList;
  }

}