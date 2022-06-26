import 'package:flutter/material.dart';
import 'package:flutter_provider/models/auth.dart';
import 'package:flutter_provider/models/cart.dart';
import 'package:flutter_provider/models/order_list.dart';
import 'package:flutter_provider/models/product_list.dart';
import 'package:flutter_provider/routes/app_routes.dart';
import 'package:flutter_provider/view/auth_or_home_page.dart';
import 'package:flutter_provider/view/cart_view.dart';
import 'package:flutter_provider/view/orders_view.dart';
import 'package:flutter_provider/view/products_form_view.dart';
import 'package:flutter_provider/view/products_view.dart';
import 'package:flutter_provider/view/products_detail_page.dart';
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
          create: (BuildContext context) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, ProductList>(
          create: (_) => ProductList('', []),
          update: (ctx, auth, previous) {
            return ProductList(
              auth.token ?? '',
              previous?.items ?? [],
            );
          },
        ),
        ChangeNotifierProxyProvider<Auth, OrderList>(
          create: (_) => OrderList('', []),
          update: (ctx, auth, previous) {
            return OrderList(
              auth.token ?? '',
              previous?.items ?? [],
            );
          }
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Cart(),
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
          AppRoutes.AUTH_OR_HOME: (ctx) => AuthOrHomeView(),
          AppRoutes.PRODUCT_DETAILS: (ctx) => ProductDetailPage(),
          AppRoutes.CART: (ctx) => CartView(),
          AppRoutes.ORDERS: (ctx) => OrdersView(),
          AppRoutes.PRODUCTS: (ctx) => ProductsView(),
          AppRoutes.PRODUCTS_FORM: (ctx) => ProductFormView(),
        },
      ),
    );
  }
}
