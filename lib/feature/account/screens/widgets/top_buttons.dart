import 'package:amazon_clone_flutter/feature/account/screens/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          AccountButton(text: 'Your Oder',onTap: (){},),
           AccountButton(text: 'Turn Seller',onTap: (){},),
            
        ],),
        SizedBox(height: 10,),
         Row(children: [
          AccountButton(text: 'Log Out',onTap: (){},),
           AccountButton(text: 'Your Wish',onTap: (){},),
            
        ],),
      ],
      
    );
  }
}