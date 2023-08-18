import 'package:ecommerce_app/app/services/admin_services.dart';
import 'package:ecommerce_app/app/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
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

  }
  @override
  Widget build(BuildContext context) {
    return sales == null ? Loader():
    Column(
      children: [

      ],
    );
  }
}
