import 'package:ecommerce_app/app/services/admin_services.dart';
import 'package:ecommerce_app/app/widgets/loader.dart';
import 'package:flutter/material.dart';

import '../../../components/utils.dart';
import '../../models/product.dart';
import '../../widgets/single_product.dart';
import 'add_product.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final AdminService adminService =AdminService();
  List<Product>? products;
  bool isEmpty = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllProduct();
  }

  getAllProduct()async{
    products = await adminService.getAllProducts(context);
  setState(() {
  });
  if(products!.isEmpty){
    isEmpty = true;
  }
  print("product ${products}");
  }

  void deleteProduct({required Product product,required int index}){
    adminService.deleteProduct(context: context, product: product,
        onSuccess: (){
          products!.removeAt(index);
          setState(() {
          });
        });
  }
  @override
  Widget build(BuildContext context) {
    return products==null? const Loader():

    Scaffold(
      body: isEmpty ==false? GridView.builder(
          itemCount: products?.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
          ),
          itemBuilder: (context ,index){
            final theProduct = products![index];
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height/6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            border:  Border.all(
                                width: 1.5,
                                color: Colors.black12
                            ),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width/2,
                          padding: const EdgeInsets.all(10),
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/logo.png',
                            image:  theProduct.images[0],
                            fit: BoxFit.fitHeight,

                          ),
                        ),
                      ),

                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(theProduct.name,
                            overflow: TextOverflow.ellipsis,),
                          ),
                      ),
                      IconButton(
                          onPressed: (){
                            showAlertDialog(
                              context,
                                (){
                                  deleteProduct(product: theProduct ,index: index);
                                  Navigator.pop(context);
                                  setState(() {

                                  });
                                },
                              "Delete Product",
                              "Are You sure to delete this product?"
                            );

                          },
                          icon: const Icon(Icons.delete)
                      )
                    ],
                  )
                ],
              ),
            );
          }
          ):const Center(child: Text("NO DATA")),





      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, AddProduct.routeName);
    },
        tooltip: "Add product",
        child: const Icon(Icons.add),
      ),
    );
  }


}
