import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_provider/models/cart.dart';
import 'package:flutter_provider/models/order_model.dart';

class OrderList with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void addOrder(Cart cart) {
    _items.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        total: cart.totalAmount,
        product: cart.items.values.toList(),
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
