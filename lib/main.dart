import 'package:flutter/material.dart';
import 'package:flutter_provider/models/cart.dart';
import 'package:flutter_provider/models/order_list.dart';
import 'package:flutter_provider/models/product_list.dart';
import 'package:flutter_provider/routes/app_routes.dart';
import 'package:flutter_provider/view/cart_view.dart';
import 'package:flutter_provider/view/orders_view.dart';
import 'package:flutter_provider/view/products_view.dart';
import 'package:flutter_provider/view/products_detail_page.dart';
import 'package:flutter_provider/view/products_detail_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => OrderList(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.red),
        ),
        
        routes: {
          AppRoutes.HOME: (ctx) => ProductsViewDetail(),
          AppRoutes.PRODUCT_DETAILS: (ctx) => ProductDetailPage(),
          AppRoutes.CART: (ctx) => CartView(),
          AppRoutes.ORDERS: (ctx) => OrdersView(),
          AppRoutes.PRODUCTS: (ctx) => ProductsView(),
        },
      ),
    );
  }
}
