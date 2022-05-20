import 'package:flutter/material.dart';
import 'package:flutter_provider/routes/app_routes.dart';
import 'package:flutter_provider/view/products_detail_page.dart';
import 'package:flutter_provider/view/products_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.red),
      ),
      home: ProductsView(),
      routes: {
        AppRoutes.PRODUCT_DETAILS: (ctx) => ProductDetailPage(),
      },
    );
  }
}
