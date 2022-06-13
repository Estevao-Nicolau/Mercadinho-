import 'package:flutter/material.dart';
import 'package:flutter_provider/models/product.dart';
import 'package:flutter_provider/models/product_list.dart';
import 'package:flutter_provider/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.PRODUCTS_FORM,
                  arguments: product,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                Provider.of<ProductList>(
                  context,
                  listen: false,
                ).removeProduct(product);
              },
            ),
          ],
        ),
      ),
    );
  }
}
