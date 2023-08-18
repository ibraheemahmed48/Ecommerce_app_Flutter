import 'package:flutter/material.dart';

import '../../components/utils.dart';
import '../models/order.dart';
import '../screens/User/order_details_screen.dart';
import '../services/home_services.dart';
import 'loader.dart';


class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<Order>? orders;
  HomeService homeService = HomeService();
  bool isEmpty = false;

  @override
  void initState() {
    super.initState();
   getAllUserOrders();
  }

  void getAllUserOrders() async {
    orders = await homeService.getMyOrders(context: context);
    setState(() {});
    print("-------------------------------------");
    if(orders!.isEmpty){
      isEmpty = true;
    }



  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Orders",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          const Divider(thickness: 0.5, color: Colors.grey,),
          

          orders ==null? const Loader():
          isEmpty == false ?Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                // table head
                TableRow(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                            BorderSide(color: Colors.grey, width: 0.5))),
                    children: [
                      tableHeader("Order"),
                      tableHeader("Amount"),
                      tableHeader("Status"),
                      tableHeader("View"),
                    ]),
                //table data
                if(orders != null)
                  for (int i = 0; i < orders!.length; i++)
                    tableRow(
                        context,
                        image: orders![i].products[0].images[0],
                        amount: orders![i].totalPrice.toString(),
                        status:orders![i].status,
                        index: (i + 1).toString(),
                        i: i
                    )

                    
              ]
          ):const Center(child: Text("NO DATA")),
        ],
      ),
    );
  }

  TableRow tableRow(context, {index, image, amount,required int status, required int i}) {
    return TableRow(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))
        ),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Text(index),
                const SizedBox(width: 10,),

                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/logo.png',
                    image:  image,
                    fit: BoxFit.fitHeight,
                    width: 30,
                    height: 30,
                  ),
                ),

              ],
            ),
          ),
          Text(amount),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: getStatusColor1(status)
                ),
                height: 10,
                width: 10,
              ),
              const SizedBox(width: 10,),
              Text(getStatus(status)),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, OrderDetailsScreen.routeName,
                  arguments: orders![i]);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100)),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
              child: const Center(
                child: Text(
                  "view",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
          )
        ]);
  }

  Widget tableHeader(text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical:10),
      child: Text(text,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }
}
