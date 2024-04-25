import 'package:flutter/cupertino.dart';

class CartModel extends ChangeNotifier {
  int _itemCount = 0;

  int get itemCount => _itemCount;

  void updateItemCount(int count) {
    _itemCount = count;
    notifyListeners();
  }
}
