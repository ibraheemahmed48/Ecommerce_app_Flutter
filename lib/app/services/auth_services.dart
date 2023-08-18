import 'dart:convert';
import 'package:ecommerce_app/app/screens/auth_screen.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/providers/user_provider.dart';
import 'package:ecommerce_app/app/models/user.dart';
import 'package:ecommerce_app/components/declarations.dart';
import 'package:ecommerce_app/components/utils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/error_handling.dart';
import '../screens/User/user_screen.dart';

class AuthService {
  void singUpUser(
      {required String email,
        required String password,
        required String name,
        required BuildContext context}) async {
    print("**************************singUpUser");
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '',
          cart: []);
      http.Response response = await http.post(Uri.parse("$urlDb/api/signup"),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
          });
      httpErrorHandel(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Account created");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void singInUser(
      {required String email,
        required String password,
        required BuildContext context}) async {
    print("**************************singInUser");
    try {
      http.Response response = await http.post(Uri.parse("$urlDb/api/signin"),
          body: jsonEncode({"email": email, "password": password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
          });
      httpErrorHandel(
          response: response,
          context: context,
          onSuccess: () async {
            SharedPreferences preferences =
            await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(response.body);
            await preferences.setString("myApp", jsonDecode(response.body)["token"]);

            Navigator.pushNamedAndRemoveUntil(
                context,
                UserScreen.routeName, (route) => false);

          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> getUserData(BuildContext context) async {
    print("getUserData ");
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      String? token = sp.getString('myApp');
      print("token ${token}");
      if (token == null) {
        print("222222222222222222");

        sp.setString('myApp', '');
      }
      var resToken = await http.post(Uri.parse("$urlDb/isValidToken"),
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
            'myApp': token!
          });

      var res1 = jsonDecode(resToken.body);
      if (res1 == true) {
        http.Response userRes = await http.get(Uri.parse("$urlDb/"),
            headers: {
              'Content-Type': 'application/json; charset=utf-8',
              'myApp': token!
            });
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        print("userRes ${userRes.body}");
        userProvider.setUser(userRes.body);
        print("userProvider ${userProvider.user.type}");
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> logOut(BuildContext context) async {
    try{
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString('myApp', '');
      Navigator.pushNamedAndRemoveUntil(context, AuthScreen.routeName, (route) => false);
    }catch(e){
      showSnackBar(context, e.toString());
    }

  }
}