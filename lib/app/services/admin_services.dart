import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../components/declarations.dart';
import '../../components/error_handling.dart';
import '../../components/utils.dart';
import '../../providers/user_provider.dart';
import '../models/product.dart';

class AdminService {
  void saveProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double qty,
    required String category,
    required List<File> images
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloud = CloudinaryPublic('dixrqvdzm', 'sb5mgz5m');
      List<String> imageUrls = [];
      for (int i = 0; i < images.length; i ++) {
        CloudinaryResponse res = await cloud.uploadFile(
            CloudinaryFile.fromFile(images[i].path, folder: category)
        );
        imageUrls.add(res.secureUrl);
      }
      Product product = Product(name: name,
          description: description,
          price: price,
          qty: qty,
          category: category,
          images: imageUrls);

      http.Response res = await http.post(
        Uri.parse(
            '$urlDb/admin/add-product'
        ),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'myApp': userProvider.user.token
        },
        body: product.toJson(),
      );

      httpErrorHandel(response: res, context: context, onSuccess: () {
        showSnackBar(context, 'your product has been added 😍');
        Navigator.pop(context);

      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Product>> getAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productsList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$urlDb/admin/get-products'),
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

  void deleteProduct ({required BuildContext context, required Product product,
    required VoidCallback onSuccess}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
          Uri.parse('$urlDb/admin/delete-products'),
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
            'myApp': userProvider.user.token
          },
          body: jsonEncode(
              {
                'id': product.id
              }
          )
      );
      httpErrorHandel(response: res, context: context,
          onSuccess: () {
            showSnackBar(context, 'your product has been deleted 😍');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // Future<List<Order>> getAllOrders({
  //   required BuildContext context,
  // }) async {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   List<Order> orderList = [];
  //
  //   try {
  //     http.Response res = await http.get(
  //       Uri.parse('$urlDb/api/all-orders-admin'),
  //       headers: {
  //         'Content-Type': 'application/json; charset=utf-8',
  //         'myApp': userProvider.user.token
  //       },
  //     );
  //     httpErrorHandel(response: res, context: context, onSuccess: () {
  //       for (int i = 0; i < jsonDecode(res.body).length; i ++) {
  //         orderList.add(
  //             Order.fromJson(
  //                 jsonEncode(jsonDecode(res.body)[i])
  //             )
  //         );
  //       }
  //     });
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     showSnackBar(context, e.toString());
  //   }
  //   return orderList;
  // }

  // void changeOrderStatus  ({required BuildContext context, required int status,
  //   required Order order, required VoidCallback onSuccess}) async {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   try {
  //     http.Response res = await http.post(
  //         Uri.parse('$urlDb/admin/update-order-status'),
  //         headers: {
  //           'Content-Type': 'application/json; charset=utf-8',
  //           'myApp': userProvider.user.token
  //         },
  //         body: jsonEncode(
  //             {
  //               'id': order.id,
  //               'status': status
  //             }
  //         )
  //     );
  //     httpErrorHandel(response: res, context: context, onSuccess: () {
  //       onSuccess();
  //     });
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  // }

  // Future<Map<String, dynamic>> getTotalSales(BuildContext context) async {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   List<Sales> sales = [];
  //   double totalSales = 0;
  //   double totalOrders = 0;
  //   double totalProducts = 0;
  //   try {
  //     http.Response res = await http.get(
  //       Uri.parse('$urlDb/admin/analytics'),
  //       headers: {
  //         'Content-Type': 'application/json; charset=utf-8',
  //         'myApp': userProvider.user.token
  //       },
  //     );
  //
  //     httpErrorHandel(response: res, context: context, onSuccess: () {
  //       var result = jsonDecode(res.body);
  //       totalSales = Declarations.checkDouble(result['totalSales'] ?? 0.0);
  //       totalOrders = Declarations.checkDouble(result['totalOrders'] ?? 0.0);
  //       totalProducts = Declarations.checkDouble(result['totalProducts'] ?? 0.0);
  //       sales = [
  //         Sales(label: 'Mobiles', totalSale: Declarations.checkDouble(result['catMobiles'] ?? 0.0)),
  //         Sales(label: 'Appliances', totalSale: Declarations.checkDouble(result['catAppliances'] ?? 0.0)),
  //         Sales(label: 'Fashion', totalSale: Declarations.checkDouble(result['catFashion'] ?? 0.0)),
  //         Sales(label: 'Essentials', totalSale: Declarations.checkDouble(result['catEssentials'] ?? 0.0)),
  //         Sales(label: 'Computers', totalSale: Declarations.checkDouble(result['catComputers'] ?? 0.0)),
  //       ];
  //     });
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  //   return {
  //     'sales': sales,
  //     'totalSales': totalSales,
  //     'totalOrders': totalOrders,
  //     'totalProducts':totalProducts
  //   };
  // }
}