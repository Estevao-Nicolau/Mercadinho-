import 'package:flutter/material.dart';
import 'package:flutter_provider/components/app_drawer.dart';
import 'package:flutter_provider/models/product_list.dart';
import 'package:provider/provider.dart';

class ProductsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Produtos'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: products.itemsCount,
          itemBuilder: (ctx, i) => Text(products.items[i].name),
        ),
      ),
    );
  }
}
