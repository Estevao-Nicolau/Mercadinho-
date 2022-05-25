import 'package:flutter/material.dart';

import '../components/products_grid.dart';


class ProductsView extends StatelessWidget {
  ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Lista de Produtos')),
      ),
      body: ProductGrid(),
    );
  }
}


