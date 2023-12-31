import 'package:flutter/material.dart';
class AccountButton extends StatelessWidget {

  final String text;
  final VoidCallback onTap;
   AccountButton({ Key? key,required this.text,required this.onTap, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white,),
          borderRadius: BorderRadius.circular(50),
        ),
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black.withOpacity(0.03),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
          ),
    
          child: Text(text,style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),
          ),onPressed: onTap,),
        
      ),
    );
  }
}