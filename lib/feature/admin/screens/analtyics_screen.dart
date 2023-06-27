import 'package:amazon_clone_flutter/common/widgets/loader.dart';

import 'package:amazon_clone_flutter/feature/admin/services/admin_services.dart';
import 'package:amazon_clone_flutter/models/sales.dart';
import 'package:flutter/material.dart';

class AnaltyicsScreen extends StatefulWidget {
  const AnaltyicsScreen({Key? key}) : super(key: key);

  @override
  State<AnaltyicsScreen> createState() => _AnaltyicsScreenState();
}

class _AnaltyicsScreenState extends State<AnaltyicsScreen> {
  final AdminService addersService = AdminService();
  int? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  void getEarnings() async {
    var earningData = await addersService.getEarning(context);
    totalSales = earningData['totalEarning'];
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return earnings == null || totalSales == null
        ? Loader()
        : Column(
            children: [
              Text(
                '\$$totalSales',
              ),
              SizedBox(
                height: 150,
                // child: CategoryProductChart(
                //   seriesList: [
                //     charts.Series(
                //       id: 'Sales',
                //       data: earnings!,
                //       domainFn: (Sales sales, _) => sales.label,
                //       measureFn: (Sales sales, _) => sales.earning,
                //     ),
                //   ],
                // ),
              )
            ],
          );
  }
}
