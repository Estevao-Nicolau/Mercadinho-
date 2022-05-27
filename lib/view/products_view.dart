import 'package:flutter/material.dart';
import 'package:flutter_provider/models/product_list.dart';
import 'package:provider/provider.dart';

import '../components/products_grid.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsView extends StatefulWidget {
  ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  bool _showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Lista de Produtos')),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Somente favorito'),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: FilterOptions.All,
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorite) {
                  _showFavoritesOnly = true;
                } else {
                  _showFavoritesOnly = false;
                }
              });
            },
          )
        ],
      ),
      body: ProductGrid(_showFavoritesOnly),
    );
  }
}
