import 'package:amazon_clone_flutter/common/widgets/loader.dart';
import 'package:amazon_clone_flutter/constants/globlal_variables.dart';
import 'package:amazon_clone_flutter/feature/account/screens/services/account_services.dart';
import 'package:amazon_clone_flutter/feature/account/screens/widgets/single_product.dart';
import 'package:amazon_clone_flutter/feature/order_details/screens/order_details.dart';
import 'package:flutter/material.dart';

import '../../../../models/order.dart';

class Orders extends StatefulWidget {
  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<Order>? order = [];
  final AccountService accountService = AccountService();
  @override
  void initState() {
    super.initState();
    ;
    fectOrder();
  }

  void fectOrder() async {
    order = await accountService.fetcMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return order == null
        ? Loader()
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Your Order',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 15),
                    child: Text(
                      'see all',
                      style: TextStyle(
                        color: GlobalVariables.selectedNavBarColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 170,
                padding: EdgeInsets.only(left: 10, top: 20, right: 0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: order!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, OrderDetailScreen.routName,
                            arguments: order![index]);
                      },
                      child: SingleProduct(
                        image: order![index].products[0].images[0],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
