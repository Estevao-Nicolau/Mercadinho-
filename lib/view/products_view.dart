import 'package:flutter/material.dart';
import 'package:flutter_provider/components/app_drawer.dart';
import 'package:flutter_provider/components/badge.dart';
import 'package:flutter_provider/models/cart.dart';
import 'package:flutter_provider/models/product_list.dart';
import 'package:flutter_provider/routes/app_routes.dart';
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
          ),
          Consumer<Cart>(
            child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.CART);
                },
              ),
            builder: (ctx, cart, child) => Badge(
              value:cart.itemCount.toString(),
              child: child!,
            ),
          ),
        ],
      ),
      body: ProductGrid(_showFavoritesOnly),
      drawer: AppDrawer(),
    );
  }
}
