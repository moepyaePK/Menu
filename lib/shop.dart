import 'package:flutter/material.dart';
import 'package:flutter_application_1/foodDescription.dart';
import 'package:provider/provider.dart';
import 'CartModel.dart';
import 'menupage.dart';
import 'menuDetail.dart';
import 'food.dart';
import 'foodDescription.dart';
import 'FoodTile.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
      name: "Big Sushi Roll",
      price: "100",
      imagePath: "images/bigsushibig.png",
      ingredients: "Carrot, Seaweed, Pork, Sesame",
    ),
    Food(
      name: "Fish Egg Sushi",
      price: "75",
      imagePath: "images/bigsushibig.png",
      ingredients: "Carrot, minkhant, Pork, Sesame",
    ),
    Food(
      name: "Takoyaki(5)",
      price: "50",
      imagePath: "images/takoyaki.png",
      ingredients: "Carrot, Seaweed, Pork, Sesame",
    ),
    Food(
      name: "hmt",
      price: "75",
      imagePath: "images/hmt.png",
      ingredients: "Carrot, minkhant, Pork, Sesame",
    ),
    Food(
      name: "Big Sushi Roll",
      price: "100",
      imagePath: "images/bigsushibig.png",
      ingredients: "Carrot, Seaweed, Pork, Sesame",
    ),
    Food(
      name: "Fish Egg Sushi",
      price: "75",
      imagePath: "images/bigsushibig.png",
      ingredients: "Carrot, minkhant, Pork, Sesame",
    ),
    Food(
      name: "Takoyaki(5)",
      price: "50",
      imagePath: "images/takoyaki.png",
      ingredients: "Carrot, Seaweed, Pork, Sesame",
    ),
    Food(
      name: "hmt",
      price: "75",
      imagePath: "images/hmt.png",
      ingredients: "Carrot, minkhant, Pork, Sesame",
    ),
    Food(
      name: "Big Sushi Roll",
      price: "100",
      imagePath: "images/bigsushibig.png",
      ingredients: "Carrot, Seaweed, Pork, Sesame",
    ),
    Food(
      name: "Fish Egg Sushi",
      price: "75",
      imagePath: "images/bigsushibig.png",
      ingredients: "Carrot, minkhant, Pork, Sesame",
    ),
    Food(
      name: "Takoyaki(5)",
      price: "50",
      imagePath: "images/takoyaki.png",
      ingredients: "Carrot, Seaweed, Pork, Sesame",
    ),
    Food(
      name: "hmt",
      price: "75",
      imagePath: "images/hmt.png",
      ingredients: "Carrot, minkhant, Pork, Sesame",
    ),
  ];

  List<Food> _cart = [];

  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  void addtocart(context, Food food, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(food);
    }

    Provider.of<CartModel>(context, listen: false)
        .updateItemCount(_cart.length);
    notifyListeners();
  }

  void decreaseItemCount(BuildContext context, String itemName, int quantity) {
    // Find the item in the cart and decrease its count
    for (int i = 0; i < quantity; i++) {
      for (int j = 0; j < _cart.length; j++) {
        if (_cart[j].name == itemName) {
          _cart.removeAt(j);
          break;
        }
      }
    }

    Provider.of<CartModel>(context, listen: false)
        .updateItemCount(_cart.length);
    notifyListeners();
  }
}
