


import 'package:flutter/material.dart';
import 'package:flutter_application_1/CartModel.dart';
import 'package:flutter_application_1/menuDetail.dart';
import 'package:flutter_application_1/menupage.dart';
import 'package:provider/provider.dart';
import 'AddtoCart.dart';
import 'hompage.dart';
import 'shop.dart';

void main() {
  runApp(

    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Shop()),
        ChangeNotifierProvider(create: (context) => CartModel()),
      ],
      child: const MenuPage(),
    ),


  );
}





