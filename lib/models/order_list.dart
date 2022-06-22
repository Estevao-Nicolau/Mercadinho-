import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_provider/models/cart.dart';
import 'package:flutter_provider/models/order_model.dart';
import 'package:flutter_provider/utils/constants.dart';
import 'package:http/http.dart' as http;

class OrderList with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Future<void> addOrder(Cart cart) async {
    final date = DateTime.now();
    final response = await http.post(
      Uri.parse('${Constants.ORDERS_BASE_URL}.json'),
      body: jsonEncode(
        {
          'total': cart.totalAmount,
          'data': date.toIso8601String(),
          'products': cart.items.values
              .map((cartItem) => {
                    'id': cartItem.id,
                    'productId': cartItem.productId,
                    'name': cartItem.name,
                    'quantity': cartItem.quantity,
                    'price': cartItem.price,
                  })
              .toList(),
        },
      ),
    );
    final id = jsonDecode(response.body)['name'];
    _items.insert(
      0,
      Order(
        id: id,
        total: cart.totalAmount,
        product: cart.items.values.toList(),
        date: date,
      ),
    );
    notifyListeners();
  }
}
