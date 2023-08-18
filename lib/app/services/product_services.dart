import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../components/declarations.dart';
import '../../components/error_handling.dart';
import '../../components/utils.dart';
import '../../providers/user_provider.dart';
import '../models/product.dart';
import '../models/user.dart';


class ProductServices {

  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$urlDb/api/rate-product'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'myApp': userProvider.user.token
        },
        body: jsonEncode({
          'id': product.id!,
          'rating': rating,
        }),
      );

      httpErrorHandel(response: res, context: context, onSuccess: () {
        showSnackBar(context, 'product has been rated successfully');
      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void addProductToCart({
    required BuildContext context,
    required Product product,
    required double qty }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res;

      if (qty < 0) {
        res = await http.delete(
          Uri.parse('$urlDb/api/remove-to-cart/${product.id}'),
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
            'myApp': userProvider.user.token
          },
        );
      } else {
        res = await http.post(
          Uri.parse('$urlDb/api/add-to-cart'),
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
            'myApp': userProvider.user.token
          },
          body: jsonEncode({
            'id': product.id!,
            'qty': qty,
          }),
        );
      }

      httpErrorHandel(response: res, context: context, onSuccess: () {
        User user = userProvider.user.copyWith(
          cart: jsonDecode(res.body)['cart'],
        );
        userProvider.setObjectUser(user);
        if ( qty > 0) {
          showSnackBar(context, 'product has been added successfully');
        }
      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }


  void saveUserAddress({
    required BuildContext context,
    required String address }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$urlDb/api/save-user-address'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'myApp': userProvider.user.token
        },
        body: jsonEncode({
          'address': address
        }),
      );

      httpErrorHandel(response: res, context: context, onSuccess: () {
        User user = userProvider.user.copyWith(
          address: jsonDecode(res.body)['address'],
        );
        userProvider.setObjectUser(user);
        //showSnackBar(context, 'Ok Address Has been Updated');
      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
  //
  void setAnOrder({
    required BuildContext context,
    required String address,
    required double totalPrice,
    required String paymentMethod }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$urlDb/api/order'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'myApp': userProvider.user.token
        },
        body: jsonEncode({
          'cart': userProvider.user.cart,
          'address': address,
          'totalPrice': totalPrice,
          'paymentMethod': paymentMethod
        }),
      );
      httpErrorHandel(response: res, context: context, onSuccess: () {
        User user = userProvider.user.copyWith(
          cart: [],
        );
        ////////////////////////////////
        print("Cart : ${res.body}");
/////////////////////////
        userProvider.setObjectUser(user);
        showSnackBar(context, 'Ok Order send successfully :)');
        Navigator.pop(context);
      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

}