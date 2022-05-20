import 'package:flutter/material.dart';
import 'package:flutter_provider/components/products_items.dart';
import 'package:flutter_provider/data/dummy_data.dart';
import 'package:flutter_provider/models/product.dart';

class ProductsView extends StatelessWidget {
  final List<Product> loadedProducts = dummyData;

  ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Lista de Produtos')),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) => ProductItems(product: loadedProducts[i]),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}