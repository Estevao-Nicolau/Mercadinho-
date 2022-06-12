import 'package:flutter/material.dart';
import 'package:flutter_provider/components/app_drawer.dart';
import 'package:flutter_provider/components/product_items.dart';
import 'package:flutter_provider/models/product_list.dart';
import 'package:flutter_provider/view/products_form_view.dart';
import 'package:provider/provider.dart';

import '../routes/app_routes.dart';

class ProductsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Gerenciar Produtos'), actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(
              AppRoutes.PRODUCTS_FORM,
            );
          },
        ),
      ]),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: products.itemsCount,
          itemBuilder: (ctx, i) => Column(
            children: [
              ProductItem(products.items[i]),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
