import 'package:flutter/material.dart';


class AnalyticsTable extends StatelessWidget {
  const AnalyticsTable({super.key, required this.label, required this.totalSale});
  final String label;
  final String totalSale;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,

                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$totalSale\$",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
