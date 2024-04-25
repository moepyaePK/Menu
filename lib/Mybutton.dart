import 'package:flutter/material.dart';
import 'package:flutter_application_1/AddtoCart.dart';

class Mybutton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const Mybutton({
    super.key,
    required this.text,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: onTap,
      child: Container(
           height: 70,
        width: 150,

        child: Text(text, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),),

        decoration: BoxDecoration(
          color:Color.fromRGBO(248, 119, 74, 0.68),
          borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(20),





      ),
    );
  }
}
