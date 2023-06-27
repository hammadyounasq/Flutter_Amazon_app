import 'package:amazon_clone_flutter/constants/globlal_variables.dart';
import 'package:amazon_clone_flutter/feature/account/screens/widgets/account_button.dart';
import 'package:amazon_clone_flutter/feature/account/screens/widgets/below_app_bar.dart';
import 'package:amazon_clone_flutter/feature/account/screens/widgets/orders.dart';
import 'package:amazon_clone_flutter/feature/account/screens/widgets/top_buttons.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(50),
      child: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: GlobalVariables.appBarGradient,
          ),
        ),
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          Container(
            alignment: Alignment.topLeft,
            child: const Text('Amazon',style:TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 10),),

          ),
          Container(
            padding: const EdgeInsets.only(left: 15,right: 15,),
            child: Row(children: const [
              Padding(padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.notification_add_outlined),),
              Icon(Icons.search_off_outlined),
            ],),
          ),
        ]),
      ),),
      body: Column(
        children: [
          BelowApp(),
          SizedBox(height: 10,),
         TopButtons(),
         SizedBox(height: 20,),
         Orders(),
          ],),
    );
  }
}