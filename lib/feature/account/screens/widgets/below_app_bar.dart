import 'package:amazon_clone_flutter/constants/globlal_variables.dart';
import 'package:amazon_clone_flutter/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class BelowApp extends StatelessWidget {
  const BelowApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user=Provider.of<UserProvider>(context).user;
    return Container(
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      padding: const EdgeInsets.only(left: 10,right: 15),
      child: Row(
        children: [
          RichText(text: TextSpan(
            text: 'hello.',style: TextStyle(fontSize: 22,color: Colors.black),
            children: [TextSpan(
            text: user.name,style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),)]),
            ),
        ],
      ),
    );
  }
}