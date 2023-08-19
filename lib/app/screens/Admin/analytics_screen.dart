import 'package:ecommerce_app/app/services/admin_services.dart';
import 'package:ecommerce_app/app/widgets/loader.dart';
import 'package:flutter/material.dart';
import '../../../components/declarations.dart';
import '../../models/sales.dart';



class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  AdminService adminService = AdminService();
  List<Sales>? sales;
  double? totalSales;
  double? totalOrders;
  double? totalProducts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAnalytics();

  }

  void getAnalytics() async{
    var dateSales = await adminService.getTotalSales(context);
    totalSales = dateSales["totalSales"];
    sales = dateSales['sales'];
    totalOrders = dateSales['totalOrders'];
    totalProducts =dateSales['totalProducts'];
    setState(() {
    });

  }
  @override
  Widget build(BuildContext context) {
    return sales == null ? const Loader():
    SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  // table head
                  TableRow(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                              BorderSide(color: Colors.grey, width: 0.5))),
                      children: [
                        tableHeader("Category"),
                        tableHeader("Category Sales"),

                      ]),
                  //table data

                    for (int i = 0; i < sales!.length; i ++)
                      tableRow(
                        context,
                          image: Declarations.catImages[i]["image"]!,
                        category: sales![i].label,
                        price: "${sales![i].totalSale}",
                        index: (i+1)
                      )
                ]
            ),
          ),
           Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total Sales : $totalSales",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize:20

                    ),
                  ),

                  Text("Total Orders : $totalOrders",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize:20

                    ),
                  ),
                  Text("Total Products : ${totalProducts}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize:20

                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  TableRow tableRow(context, { required int index ,required image,required String category, required String price}) {
    return TableRow(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Text("${index} - ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize:18

                  ),
                ),
                Text(category,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize:18

                  ),
                ),
                const SizedBox(width: 10,),

                ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    image,
                  width: 40,
                    fit: BoxFit.cover,
                  )
                ),

              ],
            ),
          ),
          Text(
            price, style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize:18

          ),),


        ]
    );
  }

  Widget tableHeader(text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Text(text,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 22)),
    );
  }
}
