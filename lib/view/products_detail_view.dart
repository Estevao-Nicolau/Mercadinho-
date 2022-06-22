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
  cart,
}

class ProductsViewDetail extends StatefulWidget {
  ProductsViewDetail({Key? key}) : super(key: key);

  @override
  State<ProductsViewDetail> createState() => _ProductsViewDetail();
}

class _ProductsViewDetail extends State<ProductsViewDetail> {
  bool _showFavoritesOnly = false;
  bool _isLoading = true;

  Future<void> _refreshProducts(BuildContext context) {
    return Provider.of<ProductList>(
      context,
      listen: false,
    ).loadProducts();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<ProductList>(
      context,
      listen: false,
    ).loadProducts().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Mercadinho')),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Somente favorito'),
                value: FilterOptions.Favorite,
              ),
              const PopupMenuItem(
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
              value: cart.itemCount.toString(),
              child: child!,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ProductGrid(_showFavoritesOnly),
      ),
      drawer: AppDrawer(),
    );
  }
}
