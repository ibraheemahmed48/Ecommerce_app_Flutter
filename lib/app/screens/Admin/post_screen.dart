import 'package:ecommerce_app/app/services/admin_services.dart';
import 'package:ecommerce_app/app/widgets/loader.dart';
import 'package:ecommerce_app/components/declarations.dart';
import 'package:flutter/material.dart';
import '../../../components/utils.dart';
import '../../models/product.dart';
import '../User/product_details_screen.dart';
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
            return GestureDetector(
              onTap: (){
                Navigator.pushNamed(
                  context,
                  ProductDetailScreen.routeName,
                  arguments: products![index],
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 5,left: 5),
                child: Container(
                  height: 135,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20),),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius:10,
                            spreadRadius: 5
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width/2,
                          padding: const EdgeInsets.all(10),
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/logo.png',
                            image:  theProduct.images[0],
                            fit: BoxFit.fitHeight,
                            height: 100,
                            width: 100,
                          ),
                        ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(theProduct.name,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text("${theProduct.price}",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),

                                ],
                              ),
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
                ),
              ),
            );
          }
      ):const Center(child: Text("NO DATA")),





      floatingActionButton: FloatingActionButton(
        elevation: 3,
        mini: false,

        backgroundColor: Declarations.primaryColor,
        onPressed: (){
          Navigator.pushNamed(
              context, AddProduct.routeName,
          );
        },
        tooltip: "Add product",
        child: const Icon(Icons.add,color: Colors.white,size: 30,),
      ),
    );
  }


}




















































