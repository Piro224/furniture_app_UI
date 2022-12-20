// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  final List _products = [
    [
      "1",
      "56",
      "Classic Leather Chair",
      "assets/images/Item_1.png",
      "Lorem ipsum dolor sit amet"
    ],
    [
      "2",
      "68",
      "Poppy Plastic Tub Chair",
      "assets/images/Item_2.png",
      "Lorem ipsum dolor sit amet"
    ],
    [
      "3",
      "39",
      "Bar Stool Chair",
      "assets/images/Item_3.png",
      "Lorem ipsum dolor sit amet"
    ],
  ];

  final List _cartitems = [];


  //Add items to cart
  void addCartItems(int index) {
    _cartitems.add(products[index]);
    notifyListeners();
  }

  //delete items from cart
  void deleteCartItems(int index) {
    _cartitems.removeAt(index);
    notifyListeners();
  }


  //calculate totalprice
  String CalculatePrice() {
    double totalPrice = 0;
    for (int i = 0; i < _cartitems.length; i++) {
      totalPrice += double.parse(_cartitems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }

  get products => _products;

  get cartitems => _cartitems;
}



