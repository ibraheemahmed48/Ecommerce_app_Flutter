import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/app/services/admin_services.dart';
import 'package:ecommerce_app/components/utils.dart';
import 'package:flutter/material.dart';
import '../../../components/declarations.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../widgets/custem_textF.dart';
import '../../widgets/custom_button.dart';

class AddProduct extends StatefulWidget {
  static const String routeName = "/addProduct-Screen";

  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController qtyController = TextEditingController();
  final AdminService adminService = AdminService();

  final _addProductForm = GlobalKey<FormState>();
  String category = 'Mobile';
  List<File> images = [];
   @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    qtyController.dispose();
  }
  void pickAnImage() async {
     var res = await pickImages();

     setState(() {
  images = res;
     });
  }

   void addProduct(){
     print("--------------- void addProduct");
     if(_addProductForm.currentState!.validate() && images.isNotEmpty){
       adminService.saveProduct(context: context,
           name: productNameController.text,
           description: descriptionController.text,
           price:double.parse(priceController.text),
           qty: double.parse(qtyController.text),
           category: category,
           images: images
       );
       print("if--------------- void addProduct");

     }
     setState(() {

     });
   }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: Declarations.appBarGradient
          ),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Add Product",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductForm,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                images.isNotEmpty?
                Column(
                  children: [
                    CarouselSlider(
                      disableGesture: true,
                        items: images.map((e)  {
                          return Builder(
                            builder: (BuildContext context) => Image.file(
                              e,
                              height: 200,
                              fit:BoxFit.cover
                            )

                          );
                        }).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                          autoPlay: true,
                        )
                    ),
                    

                  ],
                ):



                GestureDetector(
                  onTap: (){
                    pickAnImage();
                  },
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      dashPattern: const [10,4],
                      strokeCap: StrokeCap.round,
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child:  const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.folder_open,
                            size: 40,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text("Select Image",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey
                            ),)
                          ],
                        ),
                      )
                  ),
                ),
                const SizedBox(height: 20,),
                CustemText(controller: productNameController, hintText: 'Product Name :',),
                const SizedBox(height: 10,),
                CustemText(controller: descriptionController, hintText: 'Description :',maxline: 5,),
                const SizedBox(height: 10,),
                CustemText(controller: priceController, hintText: 'qty :',),
                const SizedBox(height: 10,),
                CustemText(controller: qtyController, hintText: 'Price :',),
                const SizedBox(height: 10,),


                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: Declarations.catImages.map((e){
                      return DropdownMenuItem(
                        value: e['title'],
                          child: Text(e['title']!));
                    }).toList(),
                    onChanged: (String? val) {
                      setState(() {
                        category = val!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10,),
                CustomButton(
                  text: 'Save',
                  onTap: addProduct,),

                const SizedBox(height: 10,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
