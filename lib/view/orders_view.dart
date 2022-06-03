import 'package:flutter/material.dart';
import 'package:flutter_provider/components/order.dart';
import 'package:flutter_provider/models/order_list.dart';
import 'package:provider/provider.dart';

import '../components/app_drawer.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (ctx, i) => OrderWidget(order: orders.items[i]),
      ),
    );
  }
}
