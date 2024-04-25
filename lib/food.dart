import 'package:flutter/material.dart';
import 'menupage.dart';
import 'menuDetail.dart';
import 'main.dart';


class Food{
  String name;
  String price;
  String imagePath;
  String ingredients;

  Food({required this.name, required this.price, required this.imagePath, required this.ingredients});

  String get _name => name;
  String get _price => price;
  String get _imagePath => imagePath;
  String get _ingredients => ingredients;

}