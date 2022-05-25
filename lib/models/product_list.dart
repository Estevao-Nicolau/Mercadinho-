import 'package:flutter/material.dart';
import 'package:flutter_provider/data/dummy_data.dart';
import 'package:flutter_provider/models/product.dart';

class ProductList with ChangeNotifier {
  List<Product> _items = dummyData;

  List<Product> get items => [..._items];

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}