import 'package:flutter/material.dart';
import 'package:flutter_provider/models/order_model.dart';
import 'package:intl/intl.dart';

class OrderWidget extends StatefulWidget {
  final Order order;

  const OrderWidget({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        ListTile(
          title: Text('R\$ ${widget.order.total.toStringAsFixed(2)}'),
          subtitle: Text(
            DateFormat('dd/mm/yyyy hh:mm').format(widget.order.date),
          ),
          trailing: IconButton(
            icon: Icon(Icons.expand_more),
            onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
          ),
        ),
        if (_expanded)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 4,
            ),
            height: widget.order.products.length * 30.0,
            child: ListView(
              children: widget.order.products.map(
                (product) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('${product.quantity}x R\$ ${product.price}',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),)
                    ],
                  );
                },
              ).toList(),
            ),
          )
      ],
    ));
  }
}
